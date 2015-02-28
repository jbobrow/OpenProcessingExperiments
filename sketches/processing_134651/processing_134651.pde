
// Data 1: Variables
// Exercises

// I almost always use integers because floating-point numbers give me a headache
// except when I'm in Solidworks, I pretty much have no choice

size(400,300);
background(150);

// size (500,700);
// size(200,200);
// size(1000,10);

int x = 100;

int y = 200;

float z = 43.5672;

println(x,y,z);

line(0,height*0.5,width,height*0.5);
line(width*0.5,0,width*0.5,height);
line(0,0,width,height);
line(0,height,width,0);
line(0,0,width*0.5,height);
line(width,0,width*0.5,height);
line(0,height,width*0.5,0);
line(width,height,width*0.5,0);
line(0,0,width,height*0.5);
line(0,height,width,height*0.5);
line(width,0,0,height*0.5);
line(width,height,0,height*0.5);

smooth();
fill(255,50);
strokeWeight(2);
stroke(255);

ellipse(width*0.5,height*0.5,width,height);
ellipse(width*0.5,height*0.5,width,height*0.5);
ellipse(width*0.5,height*0.5,width*0.5,height);

ellipse(width*0.5,height*0.5,width*0.5,height*0.5);
ellipse(width*0.5,height*0.5,width*0.5,height*0.25);
ellipse(width*0.5,height*0.5,width*0.25,height*0.5);

ellipse(width*0.5,height*0.5,width*0.25,height*0.25);
ellipse(width*0.5,height*0.5,width*0.25,height*0.125);
ellipse(width*0.5,height*0.5,width*0.125,height*0.25);


