
/*
CLOCK
Simon Wiscombe
This is a clock that shows the time as if we were staring straight up at the sky,
laying down, feet facing the ocean on the west coast. Let time go.

As time passes, the sky colors slowly change from sunrise to day, sunset to
  night, and back again, gradually changing with the minutes each hour.
The number of clouds is the hour count.
They move slightly to the right each second, and take a minute to completely
  cycle from the left to the right.
The sun and the moon move through the sky, moving a little bit each hour.
The sun is out during the day.
The moon is out at night.
The stars in the sky is equal to the month number * the day number.

-----
Notes:
There are some variables that I used for testing but then got rid of. Meh!
-----
*/

float hourRatio;
float minRatio;
float secRatio;
float milRatio; // Counting milliseconds. Runs from 0 to 1.
float timeRatio; // The fraction for the entire day.

int cMillis;
int cHour;
int cMin;
int cSec;
int cMonth;
int cDay;

float[] cloudPosX = new float[24];
float[] cloudPosY = new float[24];
float cloudAlpha;

float[] starPosX = new float[372];
float[] starPosY = new float[372];
float starAlpha;
int starCount;

float moonAlpha;

// float[] starPosX = new float[year()

PImage cloud;
PImage umbrella;

void setup()
{
  size(450, 700);
  smooth();
  noStroke();
  
  println(hour());
  println(minute());
  println(second());
  println(day());
  
  imageMode(CENTER);
  cloud = loadImage("cloud.png");
  umbrella = loadImage("umbrella.png");
  cloudAlpha = 255;
  
  cloudDistribution();
  starDistribution();
}

void draw()
{
  cHour = hour();
  cMin = minute();
  cSec = second();
  cMillis = millis();
  cMonth = month();
  cDay = day();
  
  starCount = cMonth*cDay;
  
  hourRatio = norm(hour(), 0, 24);
  minRatio = norm(minute(), 0, 60);
  secRatio = norm(second(), 0, 60);
  milRatio = norm(cMillis, 0, 1000);
  
  timeRatio = (cHour*3600 + cMin*60 + cSec)/86400; // this is more for my reference.
  
  // Dealing with time.
  if(cHour < 5) { // (morning) night time (12 AM - 5 AM)
    background(0);
    
    starAlpha = 255;
    moonAlpha = 255;
    cloudAlpha = 25;
    
    drawStars(starAlpha);
    drawMoon(moonAlpha);
  }
  else if (cHour < 6) { // morning sunrise (5 AM - 6 AM)
    background(242*minRatio,101*minRatio,34*minRatio);
    
    starAlpha = 255*(1-minRatio);
    moonAlpha = 255 - 225*minRatio;
    cloudAlpha = 25 + 25*minRatio;
    
    drawStars(starAlpha);
    drawMoon(moonAlpha);
  }
  else if (cHour < 7) { // morning sunrise to blue (6 AM - 7 AM)
    background(242 - 133*minRatio, 101 + 106*minRatio, 34 + 212*minRatio);
    cloudAlpha = 50 + 100*minRatio;
    
    drawSun();
  }
  else if (cHour < 16) { // sunny blue sky (7 AM - 5 PM)
    background(109, 207, 246);
    cloudAlpha = 150;
    
    drawSun();
  }
  else if (cHour < 18) { // evening blue to sunset (5 PM - 6 PM)
    background(109 + 133*minRatio, 207 - 106*minRatio, 246 - 212*minRatio);
    cloudAlpha = 150 - 100*minRatio;
    
    drawSun();
  }
  else if (cHour < 19) { // evening sunset (6 PM - 7 PM)
    background(242*(1 - minRatio),101*(1 - minRatio),34*(1-minRatio));
    
    starAlpha = 255*minRatio;
    cloudAlpha = 50 - 25*minRatio;
    moonAlpha = 25 + 225*minRatio;
    
    drawStars(starAlpha);
    drawMoon(moonAlpha);
  }
  else { // night to midnight (7 PM - 12 AM)
    background(0);
    starAlpha = 255;
    cloudAlpha = 25;
    moonAlpha = 255;
    
    drawStars(starAlpha);
    drawMoon(moonAlpha);
  }
  
  drawClouds(cHour, cloudAlpha);
  drawUmbrella();
}

void cloudDistribution()
{
  for (int i = 0; i < 24; i++) {
    cloudPosX[i] = random(-cloud.width/2,width+cloud.width/2);
    cloudPosY[i] = random(0, height);
  }
}

void drawClouds(int cloudNum , float alphaVal)
{
  for (int i = 0; i < cloudNum; i++) {
    pushMatrix();
    float xPos = cloudPosX[i] + (width+cloud.width)*(secRatio);
    
    if (xPos >= width + cloud.width/2) {
      xPos -= (width + cloud.width);
    }
    
    translate(xPos, cloudPosY[i]);
    tint(255,alphaVal);
    image(cloud, 0, 0);
    popMatrix();
  }
}

void starDistribution()
{
  for (int i = 0; i < 372; i++) {
    starPosX[i] = random(width);
    starPosY[i] = random(height);
  }
}

void drawStars(float alphaVal)
{
  for (int i = 0; i < starCount; i++) {
    pushMatrix();
    translate(starPosX[i], starPosY[i]);
    fill(255, alphaVal);
    ellipse(0, 0, 2, 2);
    popMatrix();
  }
}

void drawMoon(float alphaVal)
{
  int tempHour = cHour;
  if (tempHour > 12) {
    tempHour -= 24;
  }
  
  float normMoon = norm(tempHour, -6, 6);
  pushMatrix();
  fill(255, alphaVal);
  translate(width/2, height*(normMoon));
  ellipse(0,0, 15, 15);
  popMatrix();
}

void drawSun()
{
  float normSun = norm(cHour, 6, 18);
  pushMatrix();
  fill(255, 245, 104, 255);
  translate(width/2, height*(normSun));
  ellipse(0, 0, 14, 14);
  popMatrix();
}

void drawUmbrella()
{
  pushMatrix();
  translate(width+30, -30);
  rotate(radians(157.5 + 45*minRatio));
  
  if(cHour < 5 || cHour >= 18) {
    tint(100);
  }
  else if(cHour < 6) {
    tint(100 + 142*minRatio, 100 + 1*minRatio, 100 - 66*minRatio);
  }
  else if(cHour < 7) {
    tint(242 - 133*minRatio, 101 + 106*minRatio, 34 + 212*minRatio, 255*(1-minRatio));
  }
  else if(cHour < 16) {
    noTint();
  }
  else if(cHour < 17) {
    tint(109 + 133*minRatio, 207 - 106*minRatio, 246 - 212*minRatio, 255*(minRatio));
  }
  else{
    tint(242 - 142*minRatio, 101 - 1*minRatio, 34 + 66*minRatio);
  }
  
  image(umbrella, 0, 0);
  popMatrix();
}

