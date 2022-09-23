Filter_Size = "Filter Size: ";
x = input(Filter_Size);
triangle=zeros(x,x);
for  i = 1:x
    triangle(i,1) = 1;
    triangle(i,i) = 1;
    for j = 2:i
        triangle(i,j) = triangle(i-1,j-1) + triangle(i-1,j);
    end
end 
Filter = (triangle(x,:).*triangle(x,:).');
Filter_Normalization = Filter/sum(Filter,"all");
disp(Filter_Normalization)