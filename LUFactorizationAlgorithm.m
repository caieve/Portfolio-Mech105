function [L, U, P] = luFactor(A)
[n,n] = size(A)
if n>3 || n<3  
    disp('Matrix needs to be 3x3')
  
end
L = eye(n)
P=L;
U=A;
for i=1:n
    [pivot x]=max(abs(U(i:n,i)));
    x=x+i-1;
    if x~=i
        % slide rows m and k in U
        row=U(i,:);
        U(i,:)=U(x,:);
        U(x,:)=row;
        % slide rows m and k in P
        row=P(i,:);
        P(i,:)=P(x,:);
        P(x,:)=row;
        if i >= 2
            row=L(i,1:i-1);
            L(i,1:i-1)=L(x,1:i-1);
            L(x,1:i-1)=row;
        end
    end
    for j=i+1:n
        L(j,i)=U(j,i)/U(i,i);
        U(j,:)=U(j,:)-L(j,i)*U(i,:);
    end
end
M = zeros(n,n)
if U == M
    error('Matrix is incorrect')
end


