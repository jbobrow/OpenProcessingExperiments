
size(300, 300);
background(#86D8FF);


float x = 50; 
float y = 100; 
float diameter = 150; 

//ellipse(x, y, diameter, diameter);
 

x = 100 + x; 
y = 100 + y; 
diameter = 100 + diameter; 

println(x); 
println(y);
println(diameter);

//ellipse(x, y, diameter, diameter); 


x = x / 2;
y = y/ 2; 
diameter = diameter/2; 


//ellipse(x, y, diameter, diameter); 
 
fill(83, 227, 37); 
rect(100, 100, width/2, height/2);
 
fill(227, 37, 126);
ellipse(100, 100, width/2, height/2); 

fill(223, 227, 37);
triangle(width/2, height/2, 75.0 / 300.0 * width, 80.0 / 300.0 * height, 100.0 / 300.0 * width, 150.0 / 300.0 * height); 


line( width , height , 80.0, 110.0);

line( width*2.0, height*2.0, 80, 110.0);

line( width*4.0, height*4.0, 80.0, 110.0);

line( width*8.0, height*8.0, 80, 110);

line( width*16.0, height*16.0, 80, 110);



