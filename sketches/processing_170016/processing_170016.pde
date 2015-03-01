
void setup()

{
  size (500,500);
  background (0);
  
}
void draw()
{
 background (0); 
 
  //sekunde
 float sekunde_1 = map(second(), 0, 60, 0, -360); 
 pushMatrix(); 
 translate(width/2, height/2);
 rotate(sekunde_1);
 rectMode(CENTER);
 rect(0,0,200,-200);
 stroke(255, 255, 255);
 strokeWeight(5);
 popMatrix();
 
   //Minutenzeiger
 float minute_1 = map(minute(), 0, 60, 0, 2*PI);
  pushMatrix();
  translate(width/2,width/2);
  rotate(minute_1);
  rectMode(CENTER);
  stroke(0 ,0 ,0);
  strokeWeight(1);
  line(0,0,0,-90);
  popMatrix();
   
  //Stundenzeiger

float stunde_1 = map(hour(), 0, 12, 0, 2*PI);
  println(stunde_1);
 
  pushMatrix();
  translate(width/2,width/2);
  rotate(stunde_1);
  stroke(0);
  strokeWeight(3);
  line(0,0,0,-50);
  popMatrix();
}

