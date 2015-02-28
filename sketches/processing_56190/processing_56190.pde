
float x = 225;      // x-coord
float y = 300;      // y-coord
color g = color(0,255,0);
color o = color(211,99,34);

float easing = 0.02;

void setup() {
  size(600,600);
  smooth();
  background(255);
  
  stroke(70);
  strokeWeight(4);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  ellipseMode(RADIUS);
}

void draw() {
  int targetX = mouseX;
  x += (targetX - x) * easing;
  int targetY = mouseY;
  y += (targetY - y) * easing;
  if (mousePressed) {
    o = g;
  } else {
    o = color(211,99,34);
  }
    
  
  background (255);
  
//Neck
fill(224,205,27);
rect(x-25,y-100,50,20);
fill(o);
rect(x-15,y-80,10,30);
fill(255);
rect(x+5,y-80,10,30);
fill(o);
rect(x+5,y-80,10,30);

//Antennae
line(x-25,y-250,x,y-200);
line(x+25,y-250,x,y-200);
fill(o);
rect(x-35,y-260,10,10);
rect(x+25,y-260,10,10);

//Head
fill(220);
triangle(x,y-200,x-45,y-100,x+45,y-100);
fill(255);
ellipse(x,y-125,15,15);
fill(0);
ellipse(x,y-120,2.5,2.5);
fill(255);

//Torso
fill(12,61,201);
triangle(x-25,y-50,x+25,y-50,x,y);
fill(255);
ellipse(x,y+15,15,15);
fill(87,240,111);
rectMode(CENTER);
rect(x,y+15,10,10);
fill(12,61,201);
triangle(x,y+30,x-25,y+80,x+25,y+80);

//Arms
noFill();
line(x-25,y-50,x-75,y);
line(x+25,y-50,x+75,y);

//Base
stroke(0);
fill(0);
arc(x-35,y+130,10,10,radians(0),radians(180));
arc(x+35,y+130,10,10,radians(0),radians(180));
fill(o);
rectMode(CORNER);
rect(x-55,y+80,110,50);
fill(255);
rect(x-45,y+90,10,30);
rect(x+35,y+90,10,30);
line(x-25,y+100,x+25,y+100);
line(x-25,y+110,x+25,y+110);
}

