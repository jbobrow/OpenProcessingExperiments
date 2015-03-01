
void setup()
{
  size(500,500);  
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  noFill();
  stroke(255,183,0);
  ellipse(0,0,420,420);
  
  //Unterteilung Sek
  for (int m=0;m<360;m=m+6)
  {
  pushMatrix();
  rotate(radians(m));
  noStroke();
  fill(255,183,0);
  rect(0,210,2,20);
  popMatrix();
  }
  
  noFill();
  strokeWeight(8);
  stroke(22,58,134);
  ellipse(0,0,418,418);
  
  //Unterteilung min
   for (int m=0;m<360;m=m+30)
   {
   pushMatrix();
   rotate(radians(m));
   noStroke();
   fill(22,58,134);
   rect(0,225,8,50);
   popMatrix();
   } 
   
 noFill();
 strokeWeight(10);
 stroke(10,158,201);
 ellipse(0,0,400,400);
 rectMode(CENTER);
  
//Unterteilung 12,3,6,9
    for (int m=0;m<360;m=m+90)
 {
  pushMatrix();
  rotate(radians(m));
  fill(10,158,201);
   noStroke();
   rect(0,230,10,60);
   popMatrix();
 }
 
  //Stundenzeiger
  float hrs = map(hour(),0,12,0,2*PI);
  pushMatrix();
  rotate(hrs);
  rect(0,-50,10,120);
  popMatrix();
  
  ellipse(0,0,45,45);
  
  fill(22,58,134);
  noStroke();
  
  //Minutenzeiger
  float min = map(minute(),0,59,0,2*PI);
  pushMatrix();
  fill(22,58,134);
  noStroke();
  rotate(min);
  rect(0,-75,8,170);
  popMatrix();
  
  ellipse(0,0,30,30);
  
  //Sekundenzeiger
  float sec = map(second(),0, 59, 0, 2*PI);
  pushMatrix();
  fill(255,183,0);
  noStroke();
  rotate(sec);
  rect(0,-60,3,160);
  popMatrix();
  
  noStroke();
  ellipse(0,0,15,15);
  
}  
