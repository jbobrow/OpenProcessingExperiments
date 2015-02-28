
void setup()
{
background(0);
size(500, 500);
 
}
void draw()
{
 background(255);
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);
 translate(width/2, height/2);
   
 //rotate(radians(-100));
 //for (int i=0; i<360; i+=mouseX+1)
   
   for (int i=0; i<360; i+=360/12)
  {
   pushMatrix();
    rotate(radians(i));
    translate(0, 180);
    //translate(0, mouseX-180);
    strokeWeight(1);
    
    fill(200,0,0);
    ellipse(0, 0, 18, 18);
   popMatrix();
    
 pushMatrix();
  fill(#FF0000);
  strokeWeight(1);
  noFill();
  ellipse(0, 0, 300, 300);
  ellipse(0, 0, 400, 400);
   ellipse(0, 0, 420, 420);
 popMatrix();
 }
  
  rotate(radians(-90));
  noFill();
 //SEKUNDENZEIGER
  pushMatrix();
  rotate(radians(sec));
  strokeWeight(2);
  stroke(255,0,0);
  line(0, 0, 150, 5);
  popMatrix();
 //MINUTENZEIGER
  pushMatrix();
  stroke(0);
  rotate(radians(min));
  strokeWeight(4);
  line(0, 0, 160, 5);
  popMatrix();
 //STUNDENZEIGER
  pushMatrix();
  rotate(radians(h));
  strokeWeight(10);
  line(0, 0, 80, 5);
  popMatrix();
    
  }

