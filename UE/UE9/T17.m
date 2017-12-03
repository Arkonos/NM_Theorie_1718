clc
clear

A=[0 2 6 10; 3 6 9 -3; 15 0 0 1; -15 -10 -3 1];
b=[4 -6 -14 -8]';
[L,U,P,IP]=LU_pivot(A)

b_til = P*b;
y=L\b_til
x=U\y


function [L,U,P,IP]=LU_pivot(U)


[~,n]=size(U);
L=eye(n); P=L;
IP(n)=-1;
swaps=0;

for k=1:n
    [~, pivot_index]=max(abs(U(k:n, k)));
    pivot_index=pivot_index+k-1;
    if pivot_index~=k
        IP(k)=pivot_index;
        swaps=swaps + 1;
        IP(n)=(-1)^swaps;
        
        % swap rows pivot_index and k in U
        U([k pivot_index],:)=U([pivot_index k],:);
        
        % swap rows pivot_index and k in P
        P([k pivot_index],:)=P([pivot_index k],:);
        
        if k >= 2
            L([k pivot_index],1:k-1)=L([pivot_index k],1:k-1);
        end
    end
    for j=k+1:n
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end

end