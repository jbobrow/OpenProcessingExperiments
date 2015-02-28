
size(300,300);
//variable birthday December 6 = 6 
float x = 6; 
smooth();

//green rectangle
rectMode(CENTER); 
fill(130,255,49);
rect(width/x,height/2,80,80);

//red circle
ellipseMode(RADIUS); 
fill(211,17,17);
ellipse(width/2,height/2,1.5*x,1.5*x);

//yellow circle
fill(250,230,10); 
ellipse((width/2+100),height/2,30,30); 

//orange line
stroke(222,127,31);
strokeWeight(2);
line((width*2)/3, (height/2)+(3*x), (width*2)/3, (height/2)-(3*x));

//blue triangle
fill(42,46,229);
stroke(0);
strokeWeight(1);
triangle(width/3, (height/2)-(2*x), (width/3)-(2*x), (height/2)+(2*x), (width/3)+(2*x), (height/2)+(2*x));


