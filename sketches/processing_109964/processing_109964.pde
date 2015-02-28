
//homework 4
//copyright Colleen Clifford Pittsburgh PA Sept 2013

float x, y, wd, ht;

void setup()
{
 size (400, 400);
 background (7, 6, 49);
 rectMode (CENTER);
 smooth();
 frameRate (30);
 
 x= width*.5;
 y= height*.5;
 wd= width*.25;
 ht= height*.25;
 
 bee();
 hive();
 fill( 255, 255, 255);
 text("get the bee to the hive!", width*.5, height*.75);
}

void prepScreen ()
{
 noStroke();
 fill(7, 6, 49, 120);
 rect (x, y, wd*4, ht*4); 
}

void draw()
{

 if (keyPressed)
  {
    bee();
  }
}

void keyPressed()
{
   
 if (key == CODED)
 { 
  if (keyCode== RIGHT)
  {
    x= x+5;
  }
  else if (keyCode== LEFT)
  {
    x= x-5;
  }
  else if (keyCode== UP)
  {
    y= y-5;
  }
  else if(keyCode== DOWN)
  {
    y= y+5;
  }
 }
 prepScreen();
 stroke(0, 0, 0);
 hive();
}

void bee()
{
 stroke(0, 0, 0);
 strokeWeight (.75);
 noFill();
 fill(255, 247, 0);
 ellipse(x- wd*1.4, y+ ht*1.5, wd*.38, ht*.28);
 ellipse(x- wd*1.19, y+ ht*1.43, wd*.21, ht*.21);
 strokeWeight (3);
 line(x- wd*1.53, y+ ht*1.37, x- wd*1.48, y+ ht*1.62);
 line(x- wd*1.38, y+ ht*1.37, x- wd*1.33, y+ ht*1.62);
 fill(240, 240, 240, 180);
 strokeWeight (2);
 beginShape();
 curveVertex(x- wd*1.49, y+ ht*1.2);
 curveVertex(x- wd*1.5,  y+ ht*1.1);
 curveVertex(x- wd*1.55, y+ ht*1.3);
 curveVertex(x- wd*1.4,  y+ ht*1.4);
 curveVertex(x- wd*1.35, y+ ht*1.35);
 curveVertex(x- wd*1.3,  y+ ht*1.2);
 curveVertex(x- wd*1.4,  y+ ht*1.1);
 curveVertex(x- wd*1.5,  y+ ht*1.1);
 curveVertex(x- wd*1.49, y+ ht*1.2);
 endShape();
}

void hive()
{
  fill(232, 229, 152);
  ellipse(width*.5- wd, height*.5- ht*1.5, 60, 30);
  rect(width*.5- wd, height*.5- ht* 1.4, 75, 20, 9);
  rect(width*.5- wd, height*.5- ht*1.25, 85, 20, 9);
  rect(width*.5- wd, height*.5- ht*1.1 , 95, 20, 9);
  rect(width*.5- wd, height*.5- ht*  .8, 95, 20, 9);
  rect(width*.5- wd, height*.5- ht* .95, 105, 20, 9);
  
  fill(0, 0, 0);
  ellipse(width*.5- wd, height*.5- ht*.95, 25, 30);
}


