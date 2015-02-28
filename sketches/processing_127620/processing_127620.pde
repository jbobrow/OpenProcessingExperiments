
// software by theodoros papatheodorou
// released under GPL v3
// http://artech.cc
/////////////////////////////////

float[] noiseArray;
int totalRays = 90;
float angleStep = 360.0/totalRays;
boolean organicMode=true;

void setup()
{
  size(750, 750);
  background(0);
  frameRate(60);
   noiseArray = new float[totalRays];
   
   for (int x=0; x<totalRays; x++)
   {
     noiseArray[x]=(random(1000));
   }
}

void draw()
{
  background(0);
  if (organicMode) organicSun();
  else mathSun();
 
  fill(255);
  text("click mouse\nto switch mode", 10, 15);
}

void mousePressed()
{
  organicMode = !organicMode; 
}

void organicSun()
{
  fill(253, 184, 19);
  noStroke();
  
  pushMatrix();
  translate(width/2, height/2);
  float constRad = 200;

  beginShape();
  for (int x=0; x<totalRays; x++)
  {
    float rad = constRad + noise(noiseArray[x]) * 150;
    float startX = 0;
    float startY = 0;
    float endX = startX + rad * sin(radians(x*angleStep));
    float endY = startY + rad * cos(radians(x*angleStep));
    vertex(endX, endY);
    noiseArray[x]+=0.0075;
  }
  endShape(CLOSE);

  fill(255,215,13);
  ellipse(0,0,400,400);
  popMatrix(); 
}

void mathSun()
{
  pushMatrix();
  translate(width/2, height/2);
  float constRad = 200;

  beginShape();
  for (int x=0; x<totalRays; x++)
  {
    float rad = constRad + noise(noiseArray[x]) * 150;
    float startX = 0;
    float startY = 0;
    float endX = startX + rad * sin(radians(x*angleStep));
    float endY = startY + rad * cos(radians(x*angleStep));
    vertex(endX, endY);
    strokeWeight(1);
    stroke(255);
    line(startX, startY, endX, endY);
    fill(255);
    ellipse(endX, endY, 5, 5);
    ellipse(startX, startY, 5, 5);

    float lettersX = startX + rad * 1.07 * sin(radians(x*angleStep));
    float lettersY = startY + rad * 1.07 * cos(radians(x*angleStep));
    
    String locString = "" + int(rad-constRad);
    if (endX > 0) text(locString, lettersX-textWidth(locString)/2, lettersY);
    else text(locString, lettersX-textWidth(locString)/2, lettersY);

    noiseArray[x]+=0.0075;
  }
  stroke(253, 184, 19, 170);
  noFill();
  strokeWeight(3);
  endShape(CLOSE);

  fill(0);
  stroke(255);
  strokeWeight(1);
  ellipse(0,0,400,400);
  popMatrix();  
}

