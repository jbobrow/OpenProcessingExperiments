
class Birdie {
  // Birdie's variables
  float x, y, w, h;
  color c1, c2;
  
  // Birdie Constructor
  Birdie(float x_, float y_, float w_, float h_, color c1_, color c2_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c1 = c1_;
    c2 = c2_;
    }

    // Move Big Birdie 
    void jiggle(float speed) {
      x += random(-1, 1)*speed;
      y += random(-1,1)*speed;
    }
    
    // Fly Birdies
    void fly(float speed, float gravity) {
      x += speed;
      y += (speed*gravity)*-1;
    }

    // Display Birdie
    void displayBody() {
      // Set to CENTER mode
      rectMode(CENTER);
      ellipseMode(CENTER);
    
      // BIRD BODY
      // draw bird beak
      fill(c2);
      triangle(x, y-h/1.2, x+w/2, y-h/1.6, x, y-h/2.5);
        
      // draw bird head
      noStroke();
      fill(c1);
      ellipse(x, y-h/1.5, w/2, h/2);
          
      // draw bird eye 
      fill(0);
      ellipse(x+w/10, y-h/1.4, w/10, h/10);
          
      // draw bird tail
      fill(c1);
      quad(x, y, x+w/2, y+h/2, x, y+h/1.2, x-w/2, y+h/2); 
     }

      // BIRD WINGS 1 (ON STATE)
     void displayWings1 () {
      // draw bird wings
      fill(c1);
      quad(x, y-h/2, x+w, y-h/3, x, y+h/2, x-w, y-h/3);
     }  
    
     // BIRD WINGS 2 (OFF STATE)
     void displayWings2 () {    
    
      // draw bird wings
      fill(c1);
      quad(x, y-h/2, x+w, y, x, y+h/2, x-w, y);
     }
     
     void ease() {
        float easing = .1;
        float targetX = mouseX;
        float targetY = mouseY;
        float dx = targetX - x;
        float dy = targetY - y;
         
        if (abs(dx) > 1) {
          x += dx * easing;
        }
        if (abs(dy) > 1) {
          y += dy * easing;
  }
     
     }
}

