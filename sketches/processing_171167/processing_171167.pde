
void setup()
 
{
  size (300,300);
  background(40,0,0);
}
 
void draw()
{
  //background(40,0,0);
   
  //sekunde Ã�Â¤uÃ�ï¿½erer Kreis
  float sekunde_2 = map(millis(), 0, 59, 0, 8*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde_2);
  fill(random (255), random(255) ,(255));
  ellipse(75 , 90, 15, 15);
  popMatrix();
   
  //sekunde innerer Kreis
  float sekunde_3 = map(millis(), 0, 59, 0, -8*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde_3);
  fill(random (255), random(255) ,(255));
  ellipse(55 , 70, 15, 15);
  popMatrix();
  
  float sekunde_4 = map(millis(), 0, 59, 0, 8*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde_4);
  fill(random (255), random(255) ,(255));
  ellipse(55 , 20, 15, 15);
  popMatrix();
  
  float sekunde_5 = map(millis(), 0, 59, 0, 8*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde_5);
  fill(random (255), random(255) ,(255));
  ellipse(30 , 0, 15, 15);
  popMatrix();
  
  float sekunde_6 = map(millis(), 0, 59, 0, 8*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde_6);
  fill(random (255), random(255) ,(255));
  ellipse(5 , 0, 15, 15);
  popMatrix();
}
