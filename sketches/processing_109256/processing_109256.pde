
size(300,300);
background(#C9FFFF);
int num1,num2;
float var1,var2;
num1 = -2;
num2 = 1;
println("variable 1 is "+num1);
println("variable 2 is "+num2);
num1 = num1+3;
println("variable 1 + 3 is " + num1);
num2 = num2*num2;
println("variable 2^2 is " + num2);
fill(255,0,0);
rect(width/4,height/4,width/2,height/2);
fill(0,255,0);
triangle(width/4,height/4,width/4,height/2,width/2,height/2);
fill(0,0,255);
triangle(width/4,height/4,width/2,height/4,width/2,height/2);
var1 =num1;
var2=num2;
println("float variable 1 is "+var1);
println("float variable 2 is "+var2);
var1 = var1/2;
println("float variable 1 devided by 2 is " + var1);
var1 = var1/2;
println("float variable 1 devided by 2 is " + var1);
println("float variable 1 plus float variable 2 is " + (var1+var2));


