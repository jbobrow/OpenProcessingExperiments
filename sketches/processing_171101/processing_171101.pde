
void setup()
{
  size(500, 500);
}


void draw()
{
  pushMatrix();
  //background(0);
  translate(width/2, height/2);
  //fill(255, 193, 37); 
  fill(150,millis()/200.0,millis()/150.0);
  noStroke();
  ellipse(0, 0, 70, 70);
  noFill();
  stroke(255, 70);
  ellipse(0, 0, 450, 450);
  ellipse(0,0,360,360);
  ellipse(0,0,280,280);
  popMatrix();


  float sekunde = map(second(), 0, 60, 0, 2*PI);
  println(sekunde);

  pushMatrix();
  translate(width/2, height/2);
  //fill(176, 48, 96);
  fill(150,millis()/200.0,millis()/150.0);
  noStroke();
  rotate(sekunde);
  ellipse(0, -225, 15, 20);
  popMatrix();

  float minute1 = map(minute(), 0, 60, 0, 2*PI);
  println(minute1);

  pushMatrix();
  translate(width/2, height/2);
  //fill(0, 154, 205);
 fill(150,millis()/200.0,millis()/150.0);
  noStroke();
  rotate(minute1);
  ellipse(0, -180, 30, 40);
  popMatrix();
  
    float stunde1 = map(hour(), 0, 24, 0, 4*PI);
  println(stunde1);

  pushMatrix();
  translate(width/2, height/2);
  //fill(46, 139, 87);
  fill(150,millis()/200.0,millis()/150.0);
  noStroke();
  rotate(stunde1);
  ellipse(0, -140, 30, 60);
  popMatrix();
}

