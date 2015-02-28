
class spring {
  float Xpos;
  float Ypos;
  float Xvel;
  float Yvel;
  float Pxpos;
  float Pypos;
  float colorness;
  spring(int tempXpos, int tempYpos) {
   Xpos = tempXpos;
   Ypos = tempYpos;
  }
  
  void render() {
    Xpos = (Xpos + Xvel);
    Ypos = (Ypos + Yvel);
    stroke(0,130,196,55);
    strokeWeight(15);
    line(width, height, Pxpos, Pypos);
     stroke(252,177,47,55);
        strokeWeight(5);
    line(width-180, height, Pxpos-10, Pypos);
      stroke(255,255,255,55);
             strokeWeight(5);
    line(width-220, height, Pxpos-40, Pypos);
             stroke(10,9,9,65);
           strokeWeight(5);
    line(width-360, height, Pxpos-120, Pypos);
                 stroke(1,164,83,65);
            strokeWeight(5);
    line(width-400, height, Pxpos-200, Pypos);
                     stroke(238,27,46,65);
               strokeWeight(5);
    line(Xpos-30, Ypos, Pxpos-30, Pypos);
    Pxpos = Xpos;
    Pypos = Ypos;
  }
  
  void calc() {
    Xvel = Xvel + (12000 / dist(width, height, Xpos, Ypos) * ((0.29 * (width - Xpos))) / 25);
    Yvel = Yvel + (15050 / dist(width, height, Xpos, Ypos) * ((0.49 * (width - Ypos))) / 50);
  }
}

