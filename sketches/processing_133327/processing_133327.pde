
int pingos=300;
float [] chuvax;
float [] chuvay;

void setup() {
  size(400, 400);
  strokeWeight(3);
  //  frameRate(10);
  stroke(150);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(-150, 200));
    chuvay[i] = floor(random(height));
  }
}

void draw() {
  scale (2);

  background(100, 100, 255);
  stroke(200);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+ 0.2;
    chuvax[i]=chuvax[i]+0.2;
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(-200, 200));
      chuvay[i] = 0;//floor(random(height));
    }
  }

  fill (140, 157, 124);
  rect (0, 178, 200, 100);
  fill (240, 242, 237);
  stroke (0);
  strokeWeight (1);
  ellipse (90, 150, 55, 55);
  ellipse (90, 120, 47, 47);
  ellipse (90, 90, 35, 35);
  strokeWeight(2);
  pushMatrix ( ); 
  translate (70, 115);
  rotate (radians (mouseX));
  line (0, 0, 45-70, 125-115); 
  popMatrix ( ); 
  pushMatrix ();
  translate (110,115);
  rotate (radians (-mouseX));
  line (0, 0, 135-110, 125-115);
  popMatrix ();
  point (85, 85);
  point (95, 85);
  noStroke ();
  fill (234, 99, 14);
  ellipse (90, 93, 5, 5);
}

