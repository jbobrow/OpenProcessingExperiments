
float angle = 0.0;
float x;
float y;
float targetX, targetY;
float easing = 0.05;
float transparency = 200;

void setup() {
  size(800, 600);
  background(155);
  smooth();
}

void draw() {
  
  if (mousePressed) {
    
      if (mouseButton == LEFT) {
        translate(mouseX, mouseY);
          float scalar = sin(angle) + 2;
          scale(scalar);
          strokeWeight(1.0 / scalar);
          transparency = random(-100, 100);
          rotate(angle);
          angle += 0.01;
            fill(255, 255, 255, transparency);
            rect(15, 15, 50, 50);
            translate(10, 10);
            fill(240, 240, 240, transparency);
            rect(-15, -15, 30, 30);
            translate(20, 20);
            fill(255, 255, 255, transparency);
            rect(-15, -15, 15, 15);
           angle += 0.1;
      }
      
        if (mouseButton == RIGHT) {
            translate(mouseX, mouseY);
            float scalar = sin(angle) + 2;
            scale(scalar);
            strokeWeight(1.0 / scalar);
            transparency = random(-50, 50);
            rotate(angle);
            angle += 0.01;
              fill(50, 50, 50, transparency);
              rect(15, 15, 50, 50);
              translate(10, 10);
              fill(30, 30, 30, transparency);
              rect(-15, -15, 30, 30);
              translate(20, 20);
              fill(50, 50, 50, transparency);
              rect(-15, -15, 15, 15);
             angle += 0.1;
    }
  }

  
  if (keyPressed) {
    background(200);
  }
  
}

