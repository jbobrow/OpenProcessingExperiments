

void setup ()
{
  size (500, 500);
  background (139,105,105);
  smooth();
}

void draw ()
{
 //background (139,105,105);

pushMatrix();
  ellipseMode(CENTER);

  strokeWeight(10);
  stroke(255);
  noFill();
  ellipse (width/2, height/2, 250, 250);
  stroke (238,180,180);
  ellipse (width/2,height/2, 270,270);
  stroke (205,155,155);
  ellipse (width/2,height/2,290,290);
  strokeWeight(1);
  stroke(255);
  ellipse (width/2,height/4-40,10,10);
  ellipse (width/4-40,height/2,10,10);
 ellipse (width/2,height/2+165,10,10);
 ellipse (width/2+165,height/2,10,10);
  popMatrix();

  pushMatrix();
  noFill();
  stroke(255,228,225);
  strokeWeight(1);
  float sekundeNOW = map(second(), 0, 59, 0, 2*PI);
  println(sekundeNOW);


  translate(width/2, height/2);
  rotate (sekundeNOW);
  line (0, 0, 0, -100);
  stroke(238, 59, 59);
  popMatrix();
  
  
  float minuteNOW = map(minute(),0,59,0,2*PI);
  println (minuteNOW);
  
  pushMatrix();
  translate  (width/2,height/2);
  rotate (minuteNOW);
  stroke(205,16,118);
  strokeWeight(2);
  //line (0,0,0,-125);
  stroke(205,16,118);
  ellipse(0,-125,20,20);
  //rotate (minuteNOW);
  
  popMatrix();
  
  
  float stundeNOW = map(hour(),0,23,0,2*PI);
  println (stundeNOW);
  
  pushMatrix();
  translate (width/2, height/2);
rotate (stundeNOW);
  stroke(205,96,144);
  strokeWeight(5);
  //line(0,0,0,-125);
 ellipse(0,-125,50,50);
   
  popMatrix();
}

