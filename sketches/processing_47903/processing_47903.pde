
void setup()  {
  background (#000000);
  smooth();
  size(800, 600);
}

float LineX;
float LineY;
float BLineX;
float BLineY;
float CR;
float Counter;

void draw()  {
  LineX = random(800);
  LineY = random(600);
  CR = random(1,255);
  frameRate(20);
  
  if (mousePressed)  {
  stroke(255,255,255,63);
  fill(255,255,255,63);
  strokeWeight(20);
  line(LineX,LineY,400,300);
  strokeWeight(0);
  ellipse(LineX,LineY,80,80);
  }
  
}


                                
