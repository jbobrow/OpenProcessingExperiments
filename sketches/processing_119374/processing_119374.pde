
//Flowering Flowers
//one flower will follow the mouse,and another one will rotate at (250,250)
//The other one will randomly appear.
//Chiming lu

void setup() {
  size(800, 500);
  frameRate(3);
}

void draw() {
   float a1=random(10);
  int b1=int(random(width));
  int c1=int(random(height));

  Flower(100, 250, 250);
  Flower(a1,mouseX,mouseY);
  
  Flower(a1, b1, c1);
}

void Flower(float r, int a, int b) {
  fill(255, 100);
  rect(-10, -10, width+10, height+10);
  //stroke(20, 50, 70); 
  stroke(255, 48, 48); 
  r = 10;
  float x, y; 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise = random(10);
  for (float ang=0; ang<=360*3; ang+=0.5) {
    radiusNoise += 0.05;
    r += 0.05;    

    float thisRadius = r + (noise(radiusNoise)*200) - 100;
    float rad = radians(ang);                                   
    x = a + (thisRadius * cos(rad)); 
    y = b + (thisRadius * sin(rad)); 


    if (lastx > -999) { 
      line(x, y, lastx, lasty);
    } 
    lastx = x; 
    lasty = y;
  }
}

void mousePressed() {
  redraw();
  saveFrame("Flower####.png");
}



