
float[] coswave; 
int totalPts=300;
float steps=totalPts+1;
float a= 0.0;
float s = 0.0;

void setup() 
{
  size(640, 360);
  stroke(255);
  frameRate(10);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  coswave = new float[width];
  for (int i = 0; i < width; i++) 
  {
    float amount = map(i, 0, width, 0, PI);
    coswave[i] = abs(cos(amount));
  }
  background(255);
  loop();
}

void draw() 
{
  loop();
  background(0);
 
  int y1 = 0;
  int y2 = height/3;
  for (int i = 0; i < width; i+=2) 
  {
    stroke(coswave[i]*255);
    line(i, y1, i, y2);
 }

  y1 = y2;
  y2 = y1 + y1;
  for (int i = 0; i < width; i+=2) 
  {
    stroke(coswave[i]*255 / 4);
    line(i, y1, i, y2);
 }
  
  y1 = y2;
  y2 = height;
  for (int i = 0; i < width; i+=2) 
  {
    loop();
    stroke(255 - coswave[i]*255);
    line(i, y1, i, y2);
  }  
  float rand= 0;
  for  (int i = 1; i < steps; i++) 
  {
    point( (width/steps) * i, (height/2) + random(-rand, rand) );
    rand += random(-5, 5);
    stroke(310,0,99);
    frameRate(1);
  }

frameRate(30);
  a = a + 0.04;
  s = cos(a)*2;
  noStroke();
  
  translate(width/2, height/2);
  scale(s); 
  fill(51);
  rect(0, 0, 40, 40); 
  
  translate(75, 0);
  fill(255);
  scale(s);
  ellipse(0, 0, 40, 40);
}


