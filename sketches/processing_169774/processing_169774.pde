
void setup()
{
  size(500,500);
  background(#C5C0D6);
  noStroke();
}

void draw()
{
  background(#C5C0D6);

  translate(width/2,height/2);
  
  //Kreis
  pushMatrix();
  stroke(#D1CCE3);
  strokeWeight(2);
  noFill();
  ellipse(0,0,300,300);
  popMatrix();
  
  //5-Minuten-Ellipsen
  for (int i=0;i<360;i+=30) 
  {
    pushMatrix();
    rotate(radians(i));
    translate(0,150);
    noStroke();
    fill(#584E76);
    ellipse(0,0,10,15);
    popMatrix();
  }
  
  //Minuten-Ellipsen
  for (int i=0;i<360;i+=6) 
  {
    pushMatrix();
    rotate(radians(i));
    translate(0,150);
    noStroke();
    fill(#584E76);
    ellipse(0,0,3,8);
    popMatrix();
  }

  float sekunde_j = map(second(),0,60,0,2*PI);
  float minute_j = map(minute(),0,60,0,2*PI);
  float stunde_j = map(hour(),0,12,0,2*PI);

  //Sekunde
  pushMatrix();
  rotate(sekunde_j);
  translate(0,120);
  noStroke();
  fill(255);
  ellipse(0,0,10,10);
  popMatrix();
  
  //Minute
  pushMatrix();
  rotate(minute_j);
  translate(0,-50);
  noStroke();
  fill(#D5CEF0);
  ellipse(0,0,3,100);
  popMatrix();

  //Stunde
  pushMatrix();
  rotate(stunde_j);
  translate(0,-75/2);
  noStroke();
  fill(0);
  ellipse(0,0,3,75);
  popMatrix();
  
  //Mittelpunkt
  pushMatrix();
  fill(#584E76);
  ellipse(0,0,15,15);
  popMatrix();
  
}
