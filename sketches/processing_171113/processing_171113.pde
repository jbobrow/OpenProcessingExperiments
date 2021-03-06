
void setup ()
{
  size (700, 700);
  background (0);
  smooth ();
  //ellipseMode(CENTER);

}

void draw ()
{
  //Sekunde außen
background(0);
  float sekundeNOW = map(second (), 0, 59, 0, 2*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(-sekundeNOW);
   strokeWeight (60);
  stroke (120);
  noFill();
  //ellipse (0, 0, 400, 400);
  for (int i=0; i<60; i++)
  {
    fill(150);
    textSize(10);
    text(i, 0, -250); 
    rotate (2*PI/60);
  }
 
  popMatrix();
  
  // Minute Mitte
  
 float minuteNOW = map(minute(),0,59,0,2*PI);
 pushMatrix();
 translate(width/2,height/2);
 rotate (-minuteNOW);
    strokeWeight (100);
  stroke (120);
  noFill();
  //ellipse (0, 0, 300, 300);
  for (int i=0; i<60; i++)
  {
    fill(170);
    textSize(15);
    text(i, 0, -200); 
    rotate (2*PI/60);
  }
 
  popMatrix();
 


  
  // Stunde innen
  
 float stundeNOW = map(hour(),0,23,0,4*PI);
 pushMatrix();
 translate(width/2,height/2);
 rotate (-stundeNOW);
    strokeWeight (100);
  stroke (60);
  noFill();
  //ellipse (0, 0, 200, 200);
   rotate (2*PI/12);
  for (int i=1; i<13; i++)
  {
    fill(255);
    textSize(35);
    text(i, 0, -120); 
    rotate (2*PI/12);
  }
 
  popMatrix();
  
    noFill();
    strokeWeight(0.5);
  stroke(90);
  rectMode(CENTER);
  rect (350,0,5,170);
 
}
