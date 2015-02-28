

class Ball {
  float xpos;
  float ypos;
  float rayon;

  float speed_y;  
  float speed_x;

  boolean inside;

  color c = color(random(255),random(255),random(255));

  Ball(float x, float y, float w) {
    xpos = x;
    ypos = y;
    rayon = w;

    speed_y = random(-1,2);
    speed_x = random(-2, 2);

    inside = true;
  }

  void vitesse() {
    speed_y += gravity;

    if ( ypos > height ) { // rebond bas
    
      if(speed_y < -1 || speed_y > 1) { // si la boule peut encore rebondir
        speed_y = speed_y * -0.85;
      }
      else { // sinon elle disparait
        inside = false;
      }
    }
    
    if ( xpos > width || xpos < 0 ) {
     speed_x *= -1;
    }

    ypos += speed_y;
    xpos += speed_x;
  }

  void dessiner() {
    if(inside) {
      smooth();
      stroke(c);
      fill(c);
      ellipse( xpos, ypos, rayon, rayon);
    }
  }
}


