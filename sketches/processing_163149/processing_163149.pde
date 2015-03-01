
PImage img;

float r = 190;

float a = 0;

float xx = 395;
float xxx = 405;

float y = 150;
float s = 0.8;
float colo = 0;
float c = 1;

float i = 0;
float is = 1;

void setup() {
  
  // Images must be in the "data" directory to load correctly
  img = loadImage("solareclipse.jpg");
  size(800, 800);

  smooth();
}

void draw() {

  image(img, 0, 0);

  
  i += is;    
  fill(0, i);
  rect(0, 0, width, height);
  
  if (i > 255) {
    i = -1;
  }
  if (i < -20) {
    i = 1;
  }
  
  float x = r * cos(a);
  float y = r * sin(a);

  noStroke();
  fill(255);
  ellipseMode(CENTER);
  ellipse(width/2 + x , height/2 + y -8, 18, 18);
  
  a += 0.01;
  
  
float colorR = random(255);
float colorB = random(255);


colo = colo + c;

    noFill();  //2 * TRIANGLE
  stroke(colo);
  strokeWeight(1);
  triangle(400, 302, 315, 449, 485, 449);
  triangle(400, 499, 315, 351, 487, 351);
  triangle(400, 275, 293, 461, 509, 461);
  triangle(400, 525, 293, 339, 509, 339);

  
  if (colo > 255) {
    c = -2;
  }
  if (colo < 0) {
    c = 2;
  }
  
  noStroke(); // zhedang bufen
  fill(0);
  rect(344, 340, 150, 11);
  rect(344, 450, 150, 11);
  quad(339.5, 383, 350.5, 387, 334.5, 415, 323.5, 411);
  quad(454, 393, 465, 387, 479.5, 412, 468.5, 418);
  

  
    
    fill(255, 60); // TWO CIRCLES IN THE CENTER
  noStroke();
  ellipse(xxx, 400, 40, 40);
  
  fill(30, 144, 255, 70);
  ellipse(xx, 400, 40, 40);
  
   if ( mouseX < 400) {
    xx = 396;
    xxx = 404;
}
else if (mouseX > 400) {
  xx = 404;
  xxx = 396;
  

  
}
}


