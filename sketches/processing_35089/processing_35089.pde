
size (300,300);
float x = 13;
fill(255,0,0);
ellipse(300/2,300/2,3*x,3*x);
fill(255,255,0);
ellipse(250,150,60,60); 
fill(0,255,80);
rectMode(CENTER);
rect(width/x,150,80,80);
stroke(255,120,45);
strokeWeight(2);
line(width*2/3,150-6*x,width*2/3,150+6*x);
stroke(0,0,0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3,height/2-2*x,width/3-2*x,height/2+2*x,width/3+2*x,height/2+2*x);


