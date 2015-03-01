

void setup()
{

  size(500, 500);
  background(255);
  smooth();
 
  
  
}

void draw()
{
   
  background(255);
  stroke(0);
  strokeWeight(2);
  ellipse(width/2, height/2, 30, 30);
  fill(100);
  float stunde1 = map(hour(), 0.0, 12, 0, 360);
  float sekunde1 = map(second(), 0, 60, 0, 360);
  float minute1 = map(minute(), 0.0, 60, 0, 360); 

  //innere Konturenellipse 
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(250, 250, 100, 100);
  //äußere Konturenellipse
  ellipse(250, 250, 300, 300);
  strokeWeight(0);

  //Stundenzeiger
  pushMatrix();
  translate(width/2, height/2);
  fill(0);

  rotate(radians(stunde1));
  rect(0, -120, 7, 60);
  popMatrix();
  //Sekundenzeiger  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(sekunde1));
  rectMode(CENTER);
  rect(0, -105, 2.5, 90);
  popMatrix();
  //Minutenzeiger
  pushMatrix();
  fill(0);
  translate(width/2, height/2);
  rotate(radians(minute1));
  rect(0, -110, 5, 80);
  noFill();
  popMatrix();
  
  //Skala
  pushMatrix();
  translate(250,250);
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
  rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
   rotate(radians(30));
  fill(100,0,10);
  ellipse(0,-160,10,10);
  
  popMatrix();
}

