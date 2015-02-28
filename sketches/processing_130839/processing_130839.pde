
//copyright Joanne Lo jylo 2014
//mouse pressed alters background color and allows function to draw
//key pressed alters background color
//mouse wheel alters background color to shades of white, grey, and black

//variable declaration
float x,y;
float w,h;
float xDist, yDist;
float easingCoef;
{
  x=mouseX;
  y=mouseY;
  w=250;
  h=250;
}
 int direction = 1;
void setup()
{ 
   size(400,400);
   background(0);
    easingCoef=0.02;
   noCursor();
   smooth();
  frameRate(20);
}
void draw()
{
    x=mouseX;
    y=mouseY;
    if((mousePressed)&& (mouseButton==LEFT)){
   strokeWeight(1);
    noFill(); 
     stroke( random(100), random(200), random(200));
  triangle(pmouseX,pmouseY,mouseX,mouseY,200,200);
  line(pmouseX,pmouseY,mouseX,mouseY);
      x=x+w;
   }
    if(x*1<1 || x*1 > 25){ 
      w = w * -1;
   } 
}
void mousePressed()
{
   background(random(255), random(255), random(255));
}
void mouseWheel(MouseEvent event) {
   background(random(255));
   frameRate(4);
}
void keyPressed()
{
key=' ';
  fill(random(255),random(110),0);
  rect(0,0,400,400);
}



