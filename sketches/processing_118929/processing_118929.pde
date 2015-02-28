
//praticeM,by chen, wu-zhi
//flower and flowerpot...
//free Rose...When the flowers blooming,Necessary picked fast

//reference "a rose"http://www.openprocessing.org/sketch/4412
//OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/4412*@* */
//the drawing is so beautiful...


float customNoise(float value) {
  int count = int(value);
  float retValue=pow(sin(value), count);
  return retValue;
}
float a=0;

void setup() {
  size(900, 900, P3D);
  background(100);
  //noLoop();
  //frameRate(20);
}

void draw() {
  noStroke();
  fill(250, 200, 135, random(0, 100));    
  ellipse(random(width), random(height), random(5, 10), random(5, 10));  

  drawFlower1();
  drawFlower3();
  drawFlower2();
  drawClock();
  drawRose();
  drawCenterA();
  if (mousePressed) {
    //saveFrame("ROSE-###.jpg");
    background(100);
  }
}

void drawFlower1() {
  stroke(random(255), random(255), random(255), random(10));  
  strokeWeight(1); 
  noFill();
  //fill(random(255), random(255), random(255), random(2));
  float radius = random(100); 
  float centX = width/2; 
  float centY = height/2; 
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise1 = random(width)-width/2;
  float radiusNoise2 = random(height)-height/2;
  for (float ang=0; ang<=360; ang+=5) {                   
    float rad = radians(ang);
    radiusNoise1 += 0.01; 
    radiusNoise2 += 0.01;    
    x = centX + (radius * sin(rad))+radiusNoise1; 
    y = centY + (radius * tan(rad))+radiusNoise2; 
    rect(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

void drawFlower2() {
  //background(255); 
  strokeWeight(0.05); 
  float radius = 100; 
  int centX = width/2; 
  int centY = height/2; 
  // draw the filled circle using "shape"
  stroke(random(255), random(255), random(255), random(30)); 
  float x, y; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  float radiusNoise1 = random(width)-450;
  float radiusNoise2 = random(height)-450;
  fill(random(255), random(255), random(255), random(10)); 
  for (float ang=0; ang<=360; ang+=1) {
    radiusNoise1 += 0.05; 
    radiusNoise2 += 0.1;
    noiseval += 0.1; 
    radVariance=30*customNoise(noiseval);
    thisRadius = radius+radVariance; 
    rad = radians(ang); 
    x = centX + (thisRadius * tan(rad))+radiusNoise1; 
    y = centY + (thisRadius * tan(rad))+radiusNoise2; 
    line( 100*x-noise(900), 100*y+noise(900), 100*x+noise(900), 100*y+noise(900));
  }
}

void drawFlower3() {
  radius = 10;
  linecol = color(255);
  fillcol = color(random(255), random(255), random(255));
  alph = random(5);
  strokeWeight(10);
  stroke(fillcol, alph);
  //fill(fillcol);
  float radius = 100;
  //float lastx = -999;
  //float lasty = -999;
  float radiusNoise = random(10);
  int x, y;
  int centX = random(width);
  int centY = random(height);
  int alph;

  for (float ang=0; ang<=360*10; ang+=5) {
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*50) - 200;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    line(centX, centY, x, y);
    //ellipse(centX,centY,X,Y);
  }
}

void drawClock() {
  int s=second();
  strokeWeight(1);
  stroke(random(255), random(255), random(255), random(10));  
  fill(random(255), random(255), random(255), random(1));
  ellipse(450, 450, 20*s, 20*s);
}

void drawRose() {
  translate(450, 450);
  strokeWeight(10);
  rotateY(cos(a));
  stroke(229, 0, 54, 20);
  rotateZ(sin(a));
  fill(75, 20);
  //box(320-a*8);
  a+=0.005;
  if (a>40) {
    a=40;
  }
}

void drawCenterA() {
  fill(75, 20);
  stroke(229, 0, 54, 20);
  ellipse(150, -900, 50+a*10, 50);
  ellipse(150, -750, 50+a*10, 50);
  ellipse(150, -600, 50+a*10, 50);
  ellipse(150, -450, 50+a*10, 50);
  ellipse(150, -300, 50+a*10, 50);
  ellipse(150, -150, 50+a*10, 50);
  ellipse(150, 0, 50+a*10, 50);
  ellipse(150, 150, 50+a*10, 50);
  ellipse(150, 300, 50+a*10, 50);
  ellipse(150, 450, 50+a*10, 50);
  ellipse(150, 600, 50+a*10, 50);
  ellipse(150, 750, 50+a*10, 50);
  ellipse(150, 900, 50+a*10, 50);
  stroke(229, 200, 54, 20);
  line(150, -900, 50+a*10, 50);
  line(150, -750, 50+a*10, 50);
  line(150, -600, 50+a*10, 50);
  line(150, -450, 50+a*10, 50);
  line(150, -300, 50+a*10, 50);
  line(150, -150, 50+a*10, 50);
  line(150, 0, 50+a*10, 50);
  line(150, 150, 50+a*10, 50);
  line(150, 300, 50+a*10, 50);
  line(150, 450, 50+a*10, 50);
  line(150, 600, 50+a*10, 50);
  line(150, 750, 50+a*10, 50);
  line(150, 900, 50+a*10, 50);
}



