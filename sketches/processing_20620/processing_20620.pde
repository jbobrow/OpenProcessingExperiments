

int threshold = 1000;
float prevMillis = 0.0;

void setup()
{
  smooth();
  size (1000, 200);
  frameRate(60);
}

void draw()
{
  int s = second();
  int m = minute();
  //int h = hour();

  float seColor = map(s, 0,59,0,255);
  float secEllipse = map(s, 0, 59, 0, 120);
  float minEllipse = map(m, 0, 59, 0, 800);
 // float hourEllipse = map(h, 0, 23, 0, 1000);

  float arcDraw = map(s, 0, 59, 0,2*PI );

  // float secondRing = map(millis(), 0, 1000, 0, 100);


  background(0); 

  ////////////////////////////MINUTE RING SHELL
  noFill();
  stroke(255, 50);
  strokeWeight(10);
  ellipse(width/2, height/2, 800, 800);

  //min RING
  fill(255,64,83, 45);
  stroke(255,75);
  strokeWeight(5);
  ellipse(width/2, height/2, minEllipse, minEllipse); 

  ////////////////////////////SECOND RING SHELL
  noFill();
  stroke(255,50);
  strokeWeight(10);
  ellipse(width/2, height/2, 120, 120);

  //sec RING
  fill(136,60,255, 45);
  stroke(255,75);
  strokeWeight(5);
  ellipse(width/2, height/2, secEllipse, secEllipse);

  arc(width/2, height/2, 800, 800, 0, arcDraw);


  println(s);
}


