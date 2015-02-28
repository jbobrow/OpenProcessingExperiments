
float [] x = new float [1000];
float angle = 0.0;

void setup()
{
  frameRate (30);
  size(600,600);
  background(0);
  smooth();
  
  float a = random(0, 255);
  float b = random(0, 255);
  float c = random(0, 255);
  fill( a, b, c);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(-2000, 250);
  }
}

void draw() {
  
   for (int i = 0; i < x.length; i++) {
    strokeWeight(4);
    x[i] += 0.5;
    float y = i * 0.8;
    ellipse (x[i], y, 10, 20);
  }
  
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      
    float y = random(0,150);
    float x = random(600);
    float a = random(255);
    float b = random(255);
    float c = random(255);
    float d = random(600);
    float e = random(40);
    float f = random(90);
    
    stroke(0);
    strokeWeight(4);
    translate( x, d);
    rotate(angle);
    fill(a, b, c);
    ellipse(-y, -e, e, f);
    fill(a, b, c);
    rect(-e, f, e, e*2);
    angle +=0.5;
    
    } else {
    
    float y = random(0,150);
    float x = random(500);
    float a = random(255);
    float b = random(255);
    float c = random(255);
    float d = random(500);
    
    stroke( a, b, c, 255);
    strokeWeight(8);
    translate( x, d);
    rotate (angle);
    line(-y,y,y,-y);
    stroke(0);
    strokeWeight(6);
    fill( a, b, c);
    triangle( x, d, x + random(20, 60), d - random(10, 50), x + random(35, 75), d);
    angle += 0.5;
    }
  }
}

