
/* Ellipse Elapse
by Clea Stone
CMSC 117
02/19/10
Press the mouse to see the date.*/
PFont font1;
void setup()
{
  size(400,400);
  stroke(0);
  font1 = loadFont("ArnoPro-SmbdSubhead-48.vlw"); 
  smooth(); 
} 

void draw()
{
  background(0);
  float s = map(second(),0,60,70,400);
  float m = map(minute(),0,60,70,400);
  float h = map(hour(),0,24,70,100);
  float p = map(second(),0,60,0,255);
  float l = map(minute(),0,60,0,255);
  float k = map(hour(),0,24,0,255);
  noFill();
  
  //left circles
  stroke(p,l,k);
  strokeWeight(2);
  ellipse(73,200,s,s);
  strokeWeight(5);
  ellipse(73,200,m,m);
  strokeWeight(8);
  ellipse(73,200,h,h);
  
  //middle circles
  stroke(l,k,p);
  strokeWeight(2);
  ellipse(198,200,s,s);
  strokeWeight(5);
  ellipse(198,200,m,m);
  strokeWeight(8);
  ellipse(198,200,h,h);
  
  //right circles
  stroke(k,p,l);
  strokeWeight(2);
  ellipse(323,200,s,s);
  strokeWeight(5);
  ellipse(323,200,m,m);
  strokeWeight(8);
  ellipse(323,200,h,h);
  
  //date and clock
  fill(255);
  textFont(font1);
  if (mousePressed)
  {
    text(nf(month(), 2) + "   -   " + nf(day(), 2) + "   -   " + nf(year()-2000, 2), 50, 215); 
  }
  else 
  {
    text(nf(hour(), 2) + "   :   " + nf(minute(), 2) + "   :   " + nf(second(), 2), 50, 215); 
  }
  

}


