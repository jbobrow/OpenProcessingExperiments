
//Hyun Woo Jo
//Copyrighted Hyun Woo Jo, Jan 2013
 float x,xx,yy,y,wd,ht,easingCoef,c;
 void setup()
{
 frameRate(15);
 size(400,400);
 wd = width *.1;
 ht = height *.1;
noStroke();
 smooth();
 easingCoef = 0.05;
c=0;
background(0);
}
 
 void draw()
{
  fill(255,10);
  rect(0,0,width,height);

  
  float distX =mouseX -x;
  float distY =mouseY- y;
  
  float distXX =mouseX -xx;
  float distYY =mouseY- yy;
  noStroke();
  
  c=c+0.35;
  
  x = x+easingCoef*distX;
  y = y+easingCoef*distY;
  xx = xx+easingCoef*distXX;
  yy = yy+easingCoef*distYY;
   
  x = x+sin(c)*wd*1;
  y = y-sin(c+PI/2)*wd*1;
  xx = xx+sin(c+PI)*wd*1;
  yy = yy-sin(c+PI*1.5)*wd*1;
  
  noStroke();
  fill(200,0,0);
  textSize(random(10,70));
  text(int(random(0,10)), x,y);
  noStroke();
  fill(0,0,200);
  textSize(random(10,70));
  text(int(random(0,10)), xx,yy);
}
