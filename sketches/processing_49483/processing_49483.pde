
// class and properties for my enemies (called them bubbles)

class Bubble {

    float x;
    float y;
    float xspeed;
    float yspeed;
    float circleSize;
    float r;
    float d = dist(x, y, r, r);
    float rotation;
  float spin;
   
    boolean clicked;
    


    //constructor
    Bubble  (float xpos, float ypos, float radius) {
      x = xpos;
      y = ypos;
      r = radius;

      xspeed = random(-3, 5);
      yspeed = random(-3, 5);
      clicked = false;
      
//      I hoped to rotate the enemies and although I got them rotating
//      It messed up my game a little so I decided against this.
//      rotation = random(0,100);
//      spin = random(20, 20); 
    }

    void updateBubbles() {

      x = x + xspeed;
      y = y + yspeed;
      
//       rotation += spin;
       
    }

// stops the bubbles going off the screen
    void checkCollision() {


      if ((x<r/2) || ( x> width - r/2)) {
        xspeed = -xspeed;
      }
      if ((y<r/2) || ( y > height - r/2)) {
        yspeed = -yspeed;
      }
    }

// draws the bubbles.
    void drawCircle() {

//      imageMode (CENTER);
//      pushMatrix();
//    //saves the current state
//    //translate(x, y);
//    // translates the coordinates to be at the designated x and y point (because we've already stated that x and y are in the centre int eh screen
//    rotate(radians(rotation));
// image(particleImage, x, y, r, r);
// popMatrix();

      fill( 155);
      ellipse (x, y, r, r);
      fill (200);
      ellipse (x, y, r/1.3, r/1.3);
      fill(0);
      ellipse (x-15, y, r/5.2, r/5.2);
      ellipse (x+15, y, r/5.2, r/5.2);
    }
}


