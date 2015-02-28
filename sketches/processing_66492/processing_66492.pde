
PVector l;
PVector v;
PVector g;
PFont BaskOldFace;
PFont PFDinDisplayProMedium;
int d = 25;
int c = d*2;
int t = 30;
int w = 160;
int value = #FFFFFF;
int bg = #000000;
boolean lose = false;
boolean welcome = true;
boolean restart = false;
int loser = 1;

void cube() {
  fill(value);
  rectMode(CENTER);
  rect(width/2, height/2, w, w);
  fill(bg);
  textFont(PFDinDisplayProMedium);
  textAlign(CENTER);
  text("WORMHOLE",width/2,height/2+8);
}

void pad() {
  fill(value);
  rectMode(CENTER);
  rect(mouseX, height-t/2, w, t);
}

void ball() {
  if (l.x < width/2 && g.x > 0) {
    g.x = g.x * -1;
  }
  if (l.x > width/2 && g.x < 0) {
    g.x = g.x * -1;
  }
  if (l.y > height/2 && g.y < 0) {
    g.y = g.y * -1;
  }
  if (l.y < height/2 && g.y > 0) {
    g.y = g.y * -1;
  }
  l.add(v);
  v.add(g);
  //  bouce on wall
  if (l.x >= width-d) {
    v.x = v.x * -1.1 * random(0.9,1.1);
    v.y = v.y * 1.1 * random(0.9,1.1);
    l.x = width-d;
    value = #000000;
    bg = #FF0000;
  }
  if (l.x <= d) {
    v.x = v.x * -1.1 * random(0.9,1.1);
    v.y = v.y * 1.1 * random(0.9,1.1);
    l.x = d;
    value = #000000;
    bg = #00FF00;
  }
  if (l.y <= d) {
    v.y = v.y * -1.1 * random(0.9,1.1);
    v.x = v.x * 1.1 * random(0.9,1.1);
    l.y = d;
    value = #000000;
    bg = #0000FF;
  }
  //  bounce on pad.
  if (l.y + d >= height - t) {
    if (l.x + d > mouseX - w/2 && l.x < mouseX - w/2 && v.x > 0) {
      v.x = v.x * -1 * random(0.9,1.1);
      v.y = v.y * -1 * random(0.9,1.1);
      l.y = height-d-t;
      value = #FFFF00;
      bg = #000000;
    }
    if (l.x >= mouseX - w/2 && l.x <= mouseX + w/2) {
      v.y = v.y * -0.9;
      v.x = v.x * 0.9;
      l.y = height-d-t;
      value = #000000;
      bg = #FFFFFF;
    }
    if (l.x > mouseX + w/2 && l.x + d < mouseX +w/2 && v.x < 0) {
      v.x = v.x * -1;
      v.y = v.y * -1;
      l.y = height-d-t;
      value = #00FFFF;
      bg = #000000;
    }
  }

  //  black hole
  if (l.x + d >= width/2 - w/2 && l.x - d <= width/2 + w/2 && l.y + d >= height/2 - w/2 && l.y - d <= height/2 +w/2) {
    //    #NW
    if (v.x > 0 && v.y > 0) {
      v.x = v.x * random(0.8, 1.1);
      v.y = v.y * random(1, 1.1);
      value = round(random(#000000, #FFFFFF));
      bg = round(random(#000000, #FFFFFF));
/*
   //    #NW_1
       if (l.x + d = width/2 - w/2 && l.y + d = height/2 - w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NW_2
       if (l.x + d >= width/2 - w/2 && l.y < width/2 - w/2 && l.y + d > height/2 - w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NW_3
       if (l.y + d >= height/2 - w/2 && l.x + d > width/2 - w/2 && l.x < width/2 - w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NW_4
       if (l.y >= height/2 - w/2 && l.y < height/2 + w/2 && l.x + d >= width/2  - w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NW_5
       if (l.x >= width/2 - w/2 && l.x <= width/2 + w/2 && l.y + d >= height/2 - w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
 */
    }
    //    #SW
    if (v.x > 0 && v.y < 0) {
      v.x = v.x * random(1, 1.1);
      v.y = v.y * random(0.8, 1);
      value = round(random(#000000, #FFFFFF));
      bg = round(random(#000000, #FFFFFF));
/*
   //    #SW_1
       if (l.x + d = width/2 - w/2 && l.y - d = height/2 + w/2) {
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SW_2
       if (l.y - d <= height/2 + w/2 && l.x + d > width/2 - w/2 && l.x < width/2 - w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SW_3
       if (l.x + d >= width/2 -w/2 && l.y - d <= height/2 + w/2 && l.y > height/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SW_4
       if (l.y + d <= height/2 + w/2 && l.x >= width/2 - w/2 && l.x <= width/2 + w/2) {
       v.x = v.x * 1;
       v.y = v.y * -1;
       l.y = height/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SW_5
       if (l.x + d >= width/2 - w/2 && l.y <= height/2 +w/2 && l.y >= height/2 - w/2) {
       v.x = v.x * 1;
       v.y = v.y * -1;
       l.x = width/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
 */
    }
    //    #SE
    if (v.x < 0 && v.y < 0) {
      v.x = v.x * random(0.8, 1);
      v.y = v.y * random(0.8, 1.1);
      value = round(random(#000000, #FFFFFF));
      bg = round(random(#000000, #FFFFFF));
/*
   //    #SE_1
       if (l.x - d = width/2 + w/2 && l.y - d = height/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SE_2
       if (l.y - d <= height/2 + w/2 && l.x + d > width/2 - w/2 && l.x < width/2 - w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SE_3
       if (l.y - d <= height/2 + w/2 && l.x - d < width/2 + w/2 && l.x > width/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SE_4
       if (l.x - d <= width/2 + w/2 && l.y <= height/2 + w/2 && l.y >= height/2 - w/2) {
       v.x = v.x * -1;
       v.y = v.y * 1;
       l.x = width/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #SE_5
       if (l.y - d <= height/2 + w/2 && l.x <= width/2 + w/2 && l.x >= width/2 + w/2) {
       v.x = v.x * 1;
       v.y = v.y * -1;
       l.y = height/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
 */
    }
    //    #NE
    if (v.x < 0 && v.y > 0) {
     v.x = v.x * random(0.8,1.2);
     v.y = v.y * random(0.8,1);
     value = round(random(#000000, #FFFFFF));
     bg = round(random(#000000, #FFFFFF));
/*
   //    #NE_1
       if (l.x - d = width/2 + w/2 && l.y + d = height/2 - w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NE_2
       if (l.y + d >= height/2 - w/2 && l.x - d < width/2 + w/2 && l.x > width/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NE_3
       if (l.x - d <= width/2 + w/2 && l.y + d > height/2 - w/2 && l.y > height/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * -1;
       l.x = width/2 + w/2;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NE_4
       if (l.y + d >= height/2 - w/2 && l.x <= width/2 + w/2 && l.x >= width/2 - w/2) {
       v.x = v.x * 1;
       v.y = v.y * -1;
       l.y = height/2 - w/2;
       value = #000000;
       bg = #FFFFFF;
       }
       //    #NE_5
       if (l.x - d <= width/2 + w/2 && l.y >= height/2 - w/2 && l.y <= width/2 + w/2) {
       v.x = v.x * -1;
       v.y = v.y * 1;
       l.x = width/2 + w/2;
       value = #000000;
       bg = #FFFFFF;
       }
 */
    }
    if (v.x < 4.75 && v.x > -4.75) {
      v.x = v.x * 2;
    }
    if (v.y < 4.75 && v.y > -4.75) {
      v.y = v.y * 2;
    }
    if (v.x > 12.75 || v.x < -12.75) {
      v.x = v.x * 0.5;
    }
    if (v.y > 12.75 || v.y < -12.75) {
      v.y = v.y * 0.5;
    }
  }

  //  ball shape & color
  fill(value);
  ellipseMode(CENTER);
  ellipse(l.x, l.y, c, c);
}

void setup() {
  size(1280, 720);
  smooth();
  l = new PVector(c, c);
  v = new PVector(5, 5);
  g = new PVector(0.005, 0.005);
  BaskOldFace = loadFont("BaskOldFace-48.vlw");
  PFDinDisplayProMedium = loadFont("PFDinDisplayPro-Medium-16.vlw");
}

void keyPressed() {
  if (welcome) {
    welcome = false;
  }
  if (restart && loser <= 5) {
    lose = false;
    restart = false;
    loser++;
  }
}

void draw() {
  if (welcome) {
    background(255);
    fill(0);
    textFont(BaskOldFace,48);
    textAlign(CENTER);
    text("AERO PONG", width/2, height/2);
    fill(220);
    textFont(PFDinDisplayProMedium,16);
    text("Press Any Key on Your Keyboard to Start The Game", width/2, height - 16);
  }
  else {
    if (!lose) {
      background(bg);
      ball();
      //  lose the game
      if (l.y >= height-d) {
        lose = true;
      }
      pad();
      cube();
    }
    else {
      background(0);
      fill(255);
      if (loser == 1) {
        textFont(BaskOldFace,48);
        text("TRY AGAIN, YOUNG APPRENTICE!", width/2, height/2);
      }
      if (loser == 2) {
        textFont(BaskOldFace,48);
        text("ASK DADDY TO TEACH YOU HOW TO PLAY~", width/2, height/2);
      }
      if (loser == 3) {
        textFont(BaskOldFace,48);
        text("MAMA LOVES YOU!", width/2, height/2);
      }
      if (loser == 4) {
        textFont(BaskOldFace,48);
        text("HUH, ONE LAST CHANCE!", width/2, height/2);
      }
      if (loser == 5) {
        textFont(BaskOldFace,48);
        text("IT IS TIME TO MOVE ON TO...ANOTHER GAME.", width/2, height/2);
      }
      if (loser <= 4 ) {
      textFont(PFDinDisplayProMedium,16);
      text("press any key to restart", width/2, height - 30);
      l = new PVector(c, c);
      restart = true;
      }
    }
  }
}


