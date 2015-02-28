
float recRad = 0.0;
float recScale = 1.0;
float timer = 0.0;
float scaleSpeed = 0.001;
float startScale = 1.0;
  
void setup()
{
  size(500,500);
  background(#000000);
  colorMode(RGB, 255, 255, 255);
  frameRate(30);
}
  
void draw()
{
  recRad = recRad + 0.2;
  recScale = recScale + 0.01;
  timer = timer + (1.0/30.0);
  startScale = startScale + scaleSpeed;

  pushMatrix();
    noStroke();
    fill(random(255),random(255),random(255),random(50,100)); 
    translate(width/2, height/2);
    rotate(recRad);
    scale(recScale);
    
    rectMode(CORNER);
    rect(0, 0, 100, 100);
    rectMode(CENTER);
    rect(0, 0, 50, 50);
  popMatrix();
}


