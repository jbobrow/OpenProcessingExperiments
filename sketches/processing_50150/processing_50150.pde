
//Sara Humel
//Copyright 2012


float count=0;


void setup( ) {
  size(400,400);
 background(0,0,0);
}
 
void draw( ) {
  float x= random(mouseX-width/10,mouseX+width/10);
  float y= random(mouseY-width/10,mouseY+width/10);
   if (count%4 == 0) {
      strokeWeight(1);
      stroke(255,255,255);
      line(width-width,width-width,x,y);
      line(width-width,width,x,y);
      stroke(0,0,0);
      line(width,width-width,x,y);
      line(width,width,x,y);
      count++;
  } 
  count++;
  fill(x,0,y);
  strokeWeight(2);
  stroke(255,255,0);
  float d= random(20);
  ellipse(x,y,d,d);
  noStroke();
  fill(255,255,255);
}  

                
                
