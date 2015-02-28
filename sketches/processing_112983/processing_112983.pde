
float angle = 0.0;
float timer = 0.0;
float hue = 0;
float b = 0.0;
float c = 0.0;
float d = 0.0;
float z = 0.0;
float w = 0.0;
//float s = 1;
//float sa = 0.05;

void setup()
{
  size(500,500);
  background(0,0,0);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  angle += 0.1;
  timer = timer + 0.0167;
  hue = hue + 1;
  
  if(hue >= 360)
  {
    hue = 0;
  }
  if(timer > 10 && timer < 18)
  {
    drawGradient();
  }
  if(timer >= 19 && timer < 30)
  {
  drawCircle(150);
  drawCircle(50);
  drawCircle(100);
  drawCircle(200);
  }
  if(timer > 10 && timer < 18)
  {
    drawEllipse();
    drawRect();
  }
  
  if(timer < 10)
  {

  //FIRST PHASE, ROTATING RECTANGLES
  rectMode(CENTER);
  pushMatrix();
  translate(250,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();

  rectMode(CENTER);
  pushMatrix();
  translate(250,250);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  rectMode(CENTER);
  pushMatrix();
  translate(250,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(152,152);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(348,348);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(348,152);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(152,348);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(54,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(54,250);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(54,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(446,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(446,250);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(446,250);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(250,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(250,54);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(250,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(250,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(250,446);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(250,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(54,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(54,54);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(54,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(54,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(54,446);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(54,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(446,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(446,54);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(446,54);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  translate(446,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  translate(446,446);
  rotate(angle);
  fill(0);
  rect(0,0,60,60);
  popMatrix();
  
  pushMatrix();
  translate(446,446);
  rotate(angle);
  fill(#FFFFFF);
  rect(0,0,30,30);
  popMatrix();
  }
}

//SECOND PHASE, GRADIENT AND FLOATING EYEBALLS
void drawGradient()
{
 if(timer > 10 && timer < 17)
 {
  for(int a = 0; a < width; a = a + 1)
  {
    float gradPercent = a / (float)width;
    stroke(hue, 100, 100 * gradPercent);
    line(a, 0, a, height);
  }
 }
  if(timer >= 17 && timer < 19)
  {
    background(0,0,0);
  }
}

float eX = 0.0;
void drawEllipse()
{
  eX += 1.4;
  //if (ellipseX > width)
  //{
    //ellipseX = 0;
  //}
  float b = 10;
  float c = 70;
  float d = radians(eX * b);
  float eY = sin(d) * c;
  
  eY = cos(d) * c;
  fill(#FFFFFF);
  ellipse(eX, height/2 + eY, 100, 100);
  fill(#E7E84B);
  ellipse(eX, height/2 + eY, 60, 60);
  fill(#000000);
  ellipse(eX, height/2 + eY, 30, 30);
  fill(#FFFFFF);
  ellipse(height/2 + eY, eX, 100, 100);
  fill(#E7E84B);
  ellipse(height/2 + eY, eX, 60, 60);
  fill(#000000);
  ellipse(height/2 + eY, eX, 30, 30);
  //float d = radians(b*2);
  //b += 10;
  //c = 100 + cos(d)*20;
  //rotate(radians(5));
  //ellipse(b,c,100,100);
}

void drawRect()
{
  pushMatrix();
  rotate(radians(5));
  scale(angle, angle);
  fill(#8FE89E);
  rect(z,w,100,100);
  angle = radians(z/2);
  z += 10;
  w = 100 + sin(angle)*100;
  popMatrix();
}

//THIRD PHASE, REALLY QUICK "NOISY" CIRCLE
void drawCircle(float radius) 
{ 
  int centX = width / 2; 
  int centY = height / 2; 

  float x, y; 
  float lastx = centX + (radius * cos(0)); 
  float lasty = centY + (radius * sin(0)); 
  
  for (float ang = 0; ang <= 360; ang += 5)  
  {     
    float rad = radians(ang);    

    x = centX + (radius * cos(rad)) + random(-10, 10); 
    y = centY + (radius * sin(rad)) + random(-2, 2); 
    line(lastx, lasty, x, y); 
    lastx = x; 
    lasty = y; 
  } 
}


