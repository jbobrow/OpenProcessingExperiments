
//Cristina Mele  
// Computing for the Arts with Processing  
// 51-257  
// Copyright © Cristina Mele  
// September 8, 2011  
// Homework 4

float x,y,wd,ht;
color blu,darkOrang,orang;
int mCount;

void setup()
{
  x=200;   
  y=200;  
  wd=375;  
  ht=375; 
  mCount = 0;
  orang = color(250,200,140);
  darkOrang = color(240,90,50);
  blu = color(140,160,190);
  
  size(400,400);  
  background (blu);  
  noFill();  
  smooth();
}
  


   
void draw()
{
  x = mouseX;
  y = mouseY;
  
  background (blu);
  //circle  
  fill(orang);  
  noStroke();  
  ellipse (x,y,wd+(.025*wd),ht+(.025*ht));  
  strokeWeight(2);  
  stroke(blu);  
  ellipse (x,y,wd,ht);  
   
//C 
  strokeWeight(2);  
  stroke(darkOrang);
  beginShape();  
  curveVertex( x-(.1*wd),y-(.3*ht));  
  curveVertex( x-(.1*wd),y-(.3*ht));  
  curveVertex(x-(.32*wd), y-(.3*ht));  
  curveVertex(x-(.32*wd), y-(.3*ht));  
  curveVertex( x-(.32*wd), y+(.3*ht));  
  curveVertex(x-(.32*wd), y + (.3*ht));  
  curveVertex(x-(.1*wd), y+(.3*ht));  
  curveVertex(x-(.1*wd), y + (.3*ht));  
  endShape( );  
  
  //L  
  beginShape();  
  curveVertex(x,y-(.4*ht) );  
  curveVertex(x,y-(.4*ht) );  
  curveVertex(x,y+(.4*ht) );  
  curveVertex(x,y+(.4*ht) );  
  curveVertex(x+(.2*wd),y+(.4*ht) );  
  curveVertex(x+(.2*wd),y+(.4*ht) );  
  endShape();  
     
  //M  
  beginShape();  
  curveVertex(x+(.15*wd),y+(.3*ht) );  
  curveVertex(x+(.15*wd), y+(.3*ht) );  
  curveVertex(x+(.15*wd),y-(.25*ht) );  
  curveVertex(x+(.15*wd),y-(.25*ht) );  
  curveVertex(x+(.25*wd),y+(.1*ht) );  
  curveVertex(x+(.25*wd),y+(.1*ht) );  
  curveVertex(x+(.35*wd),y-(.25*ht) );  
  curveVertex(x+(.35*wd),y-(.25*ht) );  
  curveVertex(x+(.35*wd),y+(.3*ht) );  
  curveVertex(x+(.35*wd),y+(.3*ht) );  
  endShape(); 
}


void keyPressed()
{
  if (keyCode == DOWN)
  {
    x = x-10;
    y = y-10;
    wd = wd-10;
    ht = ht-10;
  }
  else if (keyCode == UP)
  {
    x = x+10;
    y = y+10;
    wd = wd+10;
    ht = ht+10;
  }
  else if (keyCode == LEFT)
  {
    x=200;   
    y=200;  
    wd=375;  
    ht=375;
  }
   else if (keyCode == RIGHT)
  {
    x=200;   
    y=200;  
    wd=375;  
    ht=375;
  }
 } 
 
 void mouseClicked() {
   
  mCount = mCount + 1; 
  if ((mCount % 2) == 0) 
  {
   blu = color(250,200,140);
   darkOrang = color(250,200,140);
   orang = color(140,160,190);
  } 
  else 
  {
   orang = color(250,200,140);
   darkOrang = color(240,90,50);
   blu = color(140,160,190);
  } 
 }


