
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
  background(0);
  
  translate(250,250);
  
  //Kreis
  pushMatrix();
  noFill();
  ellipse(0,0,300,300);
  stroke(255);
  popMatrix();
  
  //Variable Sekunde
  float sek = map(second(), 0, 60, 0, 2*PI);
  println(sek);
  
  pushMatrix();
  //Sekundenzeiger
  pushMatrix();
  //translate(width/2,width/2);
  rotate(sek);
  rectMode(CENTER);
  stroke(255,0,0);
  strokeWeight(1);
  line(0,0,0,-140);
  popMatrix();
  
  //Variable Minute
  float min = map(minute(), 0, 59, 0, 2*PI);
  
  //Minutenzeiger
  pushMatrix();
  //translate(width/2,width/2);
  rotate(min);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  line(0,0,0,-100);
  popMatrix();
  
  //Variable Minute
  float stund = map(hour(), 0, 12, 0, 2*PI);
  
  //Stundenzeiger
  pushMatrix();
  //translate(width/2,width/2);
  rotate(stund);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(3);
  line(0,0,0,-50);
  popMatrix();
  
  popMatrix();
  
  //Skala
  pushMatrix();
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  rotate(radians(30));
  line(0,-150,0,-125);
  
  popMatrix();
}
