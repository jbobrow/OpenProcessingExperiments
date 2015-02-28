
class Star {
  float x;
  float y;
  float s;
  float cs;
  float ch;
  float speed; 

  Star(float tmpX, float tmpY, float tmpS, float tmpCs) {
    x = tmpX;
    y = tmpY;
    s = tmpS;
    cs = tmpCs;
    speed = (5- s) * 0.8;
  }

  void move() {
    y += speed;

    if (y > height - 100) {
      x = random(width);
      y =  - 60 * s +100;
      cs = random(20, 60);
    }
  }

  void display() {
    ch = x * (1/(width/360.0));    

    //枠
    fill(ch, 86, 50); //24
    star_shape(x, y, s);
    //枠内
    fill(ch, cs, 100);
    star_shape(x, y+3*s*0.8, s*0.8);
  }


  void star_shape(float x, float y, float s) {
    tri(x, y, 0, s);
    tri(x, y+20*s, 180, s);
  }

  void tri(float x, float y, int t, float s) {
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(radians(t));
    beginShape(TRIANGLES);
    vertex(0, -30*s);
    vertex(-32.5*s, 30*s);
    vertex(32.5*s, 30*s);
    endShape();
    popMatrix();
  }
}


