
Boid[] boids = new Boid[96];
int colorCombo = floor(random(8));
//float[] moveRatio = {random(0.1,1),random(1,2),random(0.1,1),random(1,2)};

void setup() {
  size(480, 240);
  background(16);
   
  for (int i = 0; i < boids.length; i++) {
    boids[i] = new Boid(width/2, height/2);
  }
  
  fill(128);
  text("Click to generate a new network", 8, height - 8);
}

void draw() {  
  for (int i = 0; i < boids.length; i++) {
    boids[i].move();
    boids[i].display();    
  }  
  
}

void mouseReleased() {
  colorCombo = floor(random(8));
  fill(floor(random(2))*255);
  rect(-8,-8,width + 8, height + 8);
  for (int i = 0; i < boids.length; i++) {
    boids[i] = new Boid(mouseX, mouseY);
    }
}

class Boid {
  float x;
  float y;
  float startX;
  float startY;
  float dir = random(0, 6.28);
  float noise = random(2, 4);
  float col = random(96, 200);
  float limit = random(16,160);
  float offset = random(-96, 96);
  
  Boid(float _x, float _y) {
    x = _x;
    startX = _x;
    y = _y;
    startY = _y;
  }
  
  void move() {
    x += cos(dir + (random(noise) - noise/2) ) * map(dist(x,y, startX, startY), 0, limit, 0.1, 2);
    y += sin(dir + (random(noise) - noise/2) ) * map(dist(x,y, startX, startY), 0, limit, 0.1, 2);
    /*
    if (x > width) {x = 0;}
    if (x < 0) {x = width;}
    if (y > height) {y = 0;}
    if (y < 0) {y = height;}
    */
    if (x > startX + limit) {x = startX - limit;}
    if (x < startX - limit) {x = startX + limit;}
    if (y > startY + limit) {y = startY - limit;}
    if (y < startY - limit) {y = startY + limit;}
  }
  
  void display() {
    float alpha = map(dist(x,y, startX, startY), 0, limit, 128 + offset, 0);
    //float alpha = abs(cos(millis()/2000)*255);
    float toneStart = map(dist(x,y, startX, startY), 0, limit + offset, 255, 0);
    float toneEnd = map(dist(x,y, startX, startY), 0, limit, 0, 255);
    switch(colorCombo) {
       case 0: stroke(toneStart,0,toneEnd,alpha); break;
       case 1: stroke(toneEnd,0,toneStart,alpha); break;
       case 2: stroke(toneStart,toneEnd,0,alpha); break;
       case 3: stroke(toneEnd,toneStart,0,alpha); break;
       case 4: stroke(0,toneStart,toneEnd,alpha); break;
       case 5: stroke(0,toneEnd,toneStart,alpha); break;
       case 6: stroke(toneEnd,toneEnd,toneStart,alpha); break;
       case 7: stroke(toneStart,toneStart,toneEnd,alpha); break;               
    }
    
    point(x, y);
  }
}
