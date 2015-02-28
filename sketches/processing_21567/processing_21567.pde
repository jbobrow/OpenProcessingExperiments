
float noiseCount = 0;
float x, y, r;
PShape metro_m;
PImage metro_m2;
float padding = 120;
float maxradius;
float angle;
float centerx = 240;
float centery = 216;
float radius;



void setup() {
  size(480, 640);
  colorMode(RGB);
  smooth();
  //strokeWeight(5);
 fill(0);
  
  metro_m2 = loadImage ("metro_m2.png");
  //metro_m = loadShape ("metro_m.svg");
}

void draw() {
  maxradius = dist (centerx,centery,mouseX, mouseY);
  
  background(255);
  

  for (int i=0; i<100; i++) {
    //float x = i * 50 + 25;

    //float n = noise(noiseCount + (x/width));
    //float a = map(n, 0, 1, -15, 15);
    
    radius = random (maxradius + padding);
    angle = radians (random(360));
    

  pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,4,4);
  popMatrix();
  

  pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,10,10);
  popMatrix();
  

  pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,10,10);
  popMatrix();
  

   pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,10,10);
  popMatrix();
  
    fill(0,255);
  pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,4,4);
  popMatrix();
  

  pushMatrix();
  x = centerx + (radius) * cos(angle);
  y = centery + (radius) * sin(angle);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  ellipse(10,10,4,4);
  popMatrix();
  
 
  pushMatrix();


  image(metro_m2,0,0);
  tint(255,255,255,(1-(maxradius/320))*255);
  popMatrix();

//    pushMatrix();
//    translate(x, height);
//    rotate(radians(a));
//    ellipse(10, 10, 10, -200);
//    popMatrix();
  }

  noiseCount += 0.75;







}

