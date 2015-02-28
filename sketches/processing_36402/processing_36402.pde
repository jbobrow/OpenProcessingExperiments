
//homework 3
//copyright Andrew Viny, Carnegie Mellon University, Sept 2011, Pittsburgh, Pa

float x, y;// variable declarations
color col1;
color col2;
color col3;
color col4;
void setup()
{
   size(400, 400);
   col1=color(random( 256), random( 256), random(256));
   col2=color(random( 100), random( 100), random(200));
   col3=color(random( 200), random( 256), random(100));
   col4=color(random( 256), random( 20), random(10));
  
}


void draw ()
{ 
  strokeWeight(8);
  col1 = color(255, random(240,255), random(255));
  col2 = color(random(250,255), random(255), 255);
  col3 = color(255, random (115, 255), random(255));
  col4 = color(35, random (255, 105), random(55));
   
  if (mouseX >=0 && mouseX <=40 && mouseY >=0 && mouseY <=40) {
    background(col4);
    stroke (col1); 
    line (0, 0, random(150,250), random (150,250));
    fill(col3);
    ellipse (200,200,40,40);}
 
  if (mouseX >=360 && mouseX <=400 && mouseY >=360 && mouseY <=400) {
    background(col3);
    stroke (col2); 
    line (400, 400, random(250,150), random (150,250));
    fill(col1);
    ellipse (200,200,40,40);}
     
  if (mouseX >=0 && mouseX <=40 && mouseY >=360 && mouseY <=400) {
    background(col2);
    stroke (col3); 
    line (0, 400, random(150,250), random (250,150));
    fill(col4);
    ellipse (200,200,40,40);}
    
  if (mouseX >=360 && mouseX <=400 && mouseY >=0 && mouseY <=40) {
    background(col1);
    stroke (col4); 
    line (400, 0, random(150,250), random (250,150));
    fill(col3);
    ellipse (200,200,40,40);}
    
  fill(0,20);
  rect(0,0,width,height);
  int rand = (int)(Math.random()*4);
  if(rand ==0)
  {fill(col1);}
  if(rand ==1)
  {fill(col2);}
  if(rand ==2)
  {fill(col3);}
  if(rand ==3)
  {fill(col4);}
  
  noStroke();
  ellipse( mouseX, mouseY, 60, 60);
    
}               
