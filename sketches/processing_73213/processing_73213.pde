
// Homework #8, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// yvonnehidle@gmail.com


//====================================================//
// global variables
float x;
float y;
float x2;
float y2;
color rayColor;
//====================================================//


//====================================================//
void setup()
{
size(600,400);
smooth();

x = 0;
y = 0;
x2 = 0;
y2=0;
rayColor=color(53,122,180);
}
//====================================================//


//====================================================//
void draw()
{
transparency();
whileStuff(x,y,x2,y2,rayColor);
}
//====================================================//


//====================================================//
// change ray color
void mousePressed()
{
 rayColor=color(random(255),random(255),random(255)); 
}
//====================================================//


//====================================================//
// change ray amoount
void keyPressed()
{
  
if (key == 's')
{
  x2+=50;
  y2+=50;
}

if (key == 'l')
{
  x2+=-50;
  y2+=-50;
}
  
}
//====================================================//


//====================================================//
void whileStuff(
float x,
float y,
float x2,
float y2,
color rayColor
)
{
  
  while(x < width)
{
  strokeWeight(.5);
  stroke(150);
  curveTightness(5);
  noFill();
  curve(
  x,y,
  x-width,y+30,
  x+60,height,
  width,height/2
  );  
  x+=10;
  y+=10;  
}

while(x2 < width)
{
pushMatrix();
rotate(frameCount);
stroke(rayColor);
strokeWeight(2);
strokeCap(ROUND);
ellipse(width/2,height/2,10,10);
arc(
width/2,height/2,
x2,y2,
0,radians(90)
);
x2+=30;
y2+=30;
popMatrix();
}

}
//====================================================//


//====================================================//
// a function that makes things look cool
void transparency()
{
noStroke();
fill(255,60);
rect(0,0,width,height);
}
//====================================================//


