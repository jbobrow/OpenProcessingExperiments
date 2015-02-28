
float radius = 100;//tweak here
int resolution = 400;//tweak here
float circleX = 0;
float circleY = 0;
int m=0;

void setup()
{
  size(1200, 700);
  background(255);
  //frameRate(5);
  smooth();
}

void draw()
{
  //background(150, 150, 150);
if(mousePressed == true)
{
  circleX=mouseX;
  circleY=mouseY;
}
else{}
  
  m++;
  if(m>=150)
  {
    m=0;
  }
  radius = m;//tweak here

  beginShape();

  stroke(50+m, 50+m, 50+m);
  strokeWeight(0.75);
  noFill();
  //fill(50, 150, 150, 10);

  for (int i=0; i<=resolution; i=i+1)
  {
    float waveAngle = map(i, 0, resolution, 0, TWO_PI*20);//tweak here
    //float waveAngle = map(i, 0, resolution, 0, TWO_PI*5.5);
    float waveOffset = sin(waveAngle)*30;//tweak here
    // drawing around the circle
    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circumPointX = (waveOffset + radius)*cos(angle);
    float circumPointY = (waveOffset + radius)*sin(angle);
    //drawing points for the shape.
    float x = circleX + circumPointX;
    float y = circleY + circumPointY;
    //ellipse(x, y, 10, 10);
    vertex(x, y);
  }
  endShape(CLOSE);


}
