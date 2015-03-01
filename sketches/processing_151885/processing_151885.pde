


void setup() {  //setup function called initially, only once
  size(250, 250);
  ellipseMode(CENTER);
}

void draw() {  //draw function loops 
    background(0);
    randomSeed(129);
    for (int i = 0; i < 10; ++i) {
       float x = random(width);
       float y = random(height);
       float r = random(min(x, y));
       fill(255, 255, 255);
       ellipse(x, y, r, r);   
       
       dx = mouseX - x;
       dy = mouseY - y;
       r2 = 0.5*r;
       d = mag(dx, dy);
       dx = (r - r2)*(dx / d);
       dy = (r - r2)*(dy / d);
       
       fill(0, 0, 0);
       ellipse(x + dx/2, y + dy/2, r2, r2);     
    }
}
