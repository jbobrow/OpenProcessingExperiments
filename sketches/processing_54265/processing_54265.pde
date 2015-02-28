
float a = 100;

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;



import java.awt.*;

float[] dashes = { 29.0f, 25.0f, 29.0f, 25.0f };
BasicStroke pen; //BasicStroke for Vertex

float[] dashes2 = {26.0f, 22.0f, 26.0f, 22.0f};
BasicStroke pen2;  //BasicStroke for lines 

PShape s;
PShape sm;

void setup()
{
  size(900, 900);
  smooth();
  
  s=loadShape("asterisk.svg");
  sm=loadShape("asterisk_mag.svg");
  
  
  
 
}
void draw()
{
 

  background(255);
  strokeWeight(.5);
  strokeCap(SQUARE);
  
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width/3) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height/3) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
  a = a - 0.5;
  if( a < 0 ) {
    a = height;
  }
  beginShape();
  noFill();
  translate(-160, 0);
 
  
  pen = new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_MITER,  1.5f, dashes, 0.0f);
  Graphics2D g2 = ((PGraphicsJava2D) g).g2;
  g2.setStroke(pen);  //vertex setting
  
  stroke(y);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  
  pen2 = new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_MITER,  1.5f, dashes2, 0.0f);
  g2.setStroke(pen2); //line setting

 
  stroke(#1839EA);
   stroke(x);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);

 
  stroke(#EA1870);
  stroke(y);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  
  
  noStroke();
  fill(255);
  ellipse(608,282,48,48); // top ellipse
  
  shape(sm, 568, 245, 75, 75); //top
  
  fill(255);
  ellipse(608,435,50,50); // middle ellipse
  shape(sm, 568, 400, 75, 75); //middle 
  
  fill(255);
  ellipse(608,592,50,50);
  shape(s, 568, 556, 75, 75); //bottom
  
  
  shape(s, 434, 477, 75, 75); //left corner
  fill(255);
  
  shape(s, 434, 322, 75, 75); //top left corner
  fill(255);
  
  shape(sm, 705, 322, 75, 75); //top right corner
  fill(255);
  
  shape(sm, 705, 477, 75, 75); //bottom right corner
  fill(255);
  
  

   }


