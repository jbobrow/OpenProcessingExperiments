
class Creature {
  float r, xPos, yPos, xVel, yVel;
  int sides, inst;
  color c;
  String[] mutations;
  Creature(float _r, float _xVel, float _yVel, color _c) {
    c = _c;
    r = _r;
    xVel = _xVel;
    yVel = _yVel;
    xPos = random(width);
    yPos = random(500);
    sides = 4;
    mutations = new String[4];
    mutations[0] = "size";
    mutations[1] = "speed";
    mutations[2] = "sides";
    mutations[3] = "color";
    inst = 1; // Piano
  }

  void move() {
    if (xPos>=width || xPos <=0) {
      xVel = -xVel;
      mutate();
      if (audioOn) {
        playNote(inst, yPos, 500);
      }
    }
    if (yPos>=500 || yPos<=0) {
      yVel = -yVel;
      mutate();
      if (audioOn) {
        playNote(inst, xPos, width);
      }
    }
    xVel = constrain(xVel, -50, 50);
    yVel = constrain(yVel, -50, 50);    
    xPos = constrain((xPos+xVel), 0, width);
    yPos = constrain((yPos+yVel), 0, 500);
    if (sides <= 2) {
      ellipse(xPos, yPos, r*2, r*2);
    } 
    else {
      beginShape();
      float x;
      float y;
      for (int i=0;i<sides;i++) {
        x = xPos + (float)(r*Math.sin((i+1) * ((2*PI) / sides)));
        y = yPos + (float)(r*-Math.cos((i+1) * ((2*PI) / sides)));
        vertex(x, y);
      }
      endShape();
    }
  }

  void mutate() {
    int roll = (int)random(0, 4);
    if (roll == 0) {
      inst = 5;
      if (random(20)<=(siz*20*.01)) {
        r += 5;
      } 
      else {
        r = constrain(r-5, 5, 400);
      }
    } 
    else if (roll == 1) {
      inst = 12;
      if (random(20)<=10) { // decide random 1/2 odds between x and y
        if (random(20)<=(speed*20*.01)) { // use probability var to skew fast/slow
          if (xVel>0) {
            xVel += random(0, 5);
          } 
          else {
            xVel -= random(0, 5);
          }
        } 
        else {
          if (xVel>0) {
            xVel -= random(0, 5);
          } 
          else {
            xVel += random(0, 5);
          }
        }
      } 
      else {
        if (random(20)<=(speed*20*.01)) {
          if (yVel>0) {
            yVel += random(0, 5);
          } 
          else {
            yVel -= random(0, 5);
          }
        }
        else {
          if (xVel>0) {
            yVel -= random(0, 5);
          } 
          else {
            yVel += random(0, 5);
          }
        }
      }
    }
    else if (roll == 2) {
      inst = 21;
      if (random(20)<=(sids*20*.01)) {
        sides++;
      } 
      else {
        if (sides>3) {
          sides--;
        }
      }
    }
    else if (roll == 3) {
      inst = 46;
      float r1 = random(20); 
      float r2 = random(20); 
      float r3 = random(20);
      float roff;
      float boff;
      float goff;
      if (r1<=10) {
        roff = random(0, 20);
      } 
      else {
        roff = 0;
      }
      if (r2<=10) {
        goff = random(0, 20);
      } 
      else {
        goff = 0;
      }
      if (r3<=10) {
        boff = random(0, 20);
      } 
      else {
        boff = 0;
      }
      if (random(20)<=(col*20*.01)) {
        c = color(red(c)+roff, green(c)+goff, blue(c)+boff);
      } 
      else {
        c = color(red(c)-roff, green(c)-goff, blue(c)-boff);
      }
    }
  }

  void playNote(int inst, float pos, float maxpos) {
    score.instrument(inst);
    int step = (int)map(pos, 0, maxpos, 0, (thiskey.length*3));
    int multiple = (step/thiskey.length);
    int remainder = step%thiskey.length;
    int midi = allscales[k][remainder] + 36 + (multiple*12);
    score.playNote(midi, 100, 300);
  }
}


