
class Robot {
  float x;
  float y;
  float s;
  float fillcolor;
  float r;
  float g;
  float b;
  float es;
  float er;
  float eg;
  float eb;
  float lc;
  float nmc;
  float mouthWidth = 80;
  float mouthMovement = random(2,5);
  float yspeed = random(2, 5);
  float ydir = 1;
  float speed = random(1, 5);
  
  
  Robot(float xcoord, float ycoord, float scalar, float eyesize, float bodycolorr, float bodycolorg, float bodycolorb,
        float eyecolorr, float eyecolorg, float eyecolorb, int linecolor, int nosemouthcolor) {
        x = xcoord;
        y = ycoord;
        s = scalar;
        r = bodycolorr;
        g = bodycolorg;
        b = bodycolorb;
        er = eyecolorr;
        eg = eyecolorg;
        eb = eyecolorb;
        es = eyesize;
        lc = linecolor;
        nmc = nosemouthcolor;
        }
        
  void move() {
      //x += random(-speed, speed);
      //x = constrain(x, 0 , width);
      //y += random(-speed, speed);
      //y = constrain(y, 0, height);
      y += yspeed *ydir;
      if ((y > 420) || (y < 20)) {
      ydir *= -1;
      }
  }
  
  void display() {
    pushMatrix();
    stroke(0);
    scale(s);
    fill(r, g, b);
    rect(x, y, 150, 120);
    //ears
    rect(x-20, y+25, 20, 60);
    rect(x+150,y+25, 20, 60);
    strokeWeight(4);
    stroke(lc, lc, 0);
    line(x+85, y-8, x+120, y-60);
    line(x+65, y-8, x+30, y-60);
    strokeWeight(1);
    stroke(0);
    arc(x+75, y, 50, 20, PI, TWO_PI);
    //eyes
    fill(er, eg, eb);
    stroke(er, eg, eb);
    ellipse(x+40, y+35, es, es);
    ellipse(x+110, y+35, es, es);
    //nose and mouth
    fill(nmc, 0, nmc);
    stroke(nmc, 0 , nmc);
    triangle(x+75, y+40, x+85, y+75, x+65, y+75);
    arc(x+75,y+90, mouthWidth, 30, 0, PI);
    popMatrix();
  }
  
  void flashyeyes() {
   if(frameCount % 30 == 0) {
   //for (int i = 0; i > -1; i += 10) {
   er = random(0, 255);
   eg = random(0, 255);
   eb = random(0, 255); 
   }
  }
  
  void moveMouth() {
  mouthWidth += mouthMovement;
    if(mouthWidth < 5 || mouthWidth > 80) {
      mouthMovement =- mouthMovement;
    }  
  }
}

