
class Bibitte {
  PImage img;
  float x;
  float y;
  float angle;
  float angleCible;
  float v;

  Bibitte(float x, float y, PImage img) {
    this.x = x;
    this.y = y;
    v = random(4,8);
    angle = random(PI*2);
    angleCible = random(PI*2);
    this.img = img;
  }

  void draw() {

    // Determiner si la bibitte de direction
    if ( random(100) < 5 ) {
      angleCible = random(PI*2);
    }

    // Deplacer la bibitte
    float angle_difference = angleCible - angle;

    angle_difference = angle_difference  % (PI * 2);

    if (angle_difference > PI) {
      angle_difference = angle_difference- PI * 2;
    } 
    else if (angle_difference < -PI) {
      angle_difference = angle_difference + PI * 2;
    }

    angle = angle_difference * 0.1 + angle;

    x = x + cos(angle) * v;
    y = y + sin(angle) * v;

    if ( x > width + 10) x = - 10;
    else if ( x < -10) x = width + 10;
    else if ( y > height + 10) y = - 10;
    else if ( y < -10) y = height + 10;

    // Dessiner la bibitte
    pushMatrix();
    translate(x,y);
    rotate(angle);
    translate(-img.width/2,-img.height/2);
    image(img,0,0);
    popMatrix();
  }
}


