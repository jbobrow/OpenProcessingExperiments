
class Fortune {

  float x, y;
  float x1 = 120;
  float x2 = 220;
  float x3 = 320;
  float x4 = 420;
  float y1 = 55;
  int state = 1;
  PFont font1;

  Fortune() {
    textAlign(CENTER);
    font1 = loadFont("ARESSENCE-20.vlw");
    textFont(font1);

    x = width/2;
    y = 200;
  }

  void displayWords() {
    fill(255);

    if (state == 1) {
      text("May", x1, y1);
      text("Your", x2, y1);
      text("A", x3, y1);
      text("Soon", x4, y1);
    }
    else if (state == 2) {
      text("fame", x1, y1);
      text("friends", x2, y1);
      text("time", x3, y1);
      text("life", x4, y1);
    }
    else if (state == 3) {
      text("bring", x1, y1);
      text("find", x2, y1);
      text("grant", x3, y1);
      text("reward", x4, y1);
    }
    else if (state == 4) {
      text("love", x1, y1);
      text("riches", x2, y1);
      text("opportunity", x3, y1);
      text("pleasure", x4, y1);
    }
    else if (state == 5) {

      //displays fortunes in state 5.
      if (mouseX > 0 && mouseX < width/2 && mouseY < height/2) {
        textSize(100);
        fill(random(255), 0, 0);
        if (may) {text("MAY", random(width), random(height));}    
        if (your) {text("YOUR", random(width), random(height));}
        if (a) {text("A", random(width), random(height));}
        if (soon) {text("SOON", random(width), random(height));}
        textSize(20);
      }
      if (mouseX > 0 && mouseX < width/2 && mouseY > height/2) {
        textSize(100);
        fill(0,random(255), 0);
        if (fame) {text("FAME", random(width), random(height));}    
        if (friends) {text("FRIENDS", random(width), random(height));}
        if (time) {text("TIME", random(width), random(height));}
        if (life) {text("LIFE", random(width), random(height));}
        textSize(20);
      }
      if (mouseX > width/2 && mouseX < width && mouseY < height/2) {
        textSize(100);
        fill(0,0,random(255));
        if (bring) {text("BRING", random(width), random(height));}   
        if (find) {text("FIND", random(width), random(height));}
        if (grant) {text("GRANT", random(width), random(height));}
        if (reward) {text("REWARD", random(width), random(height));}
        textSize(20);
      }
      if (mouseX > width/2 && mouseX < width && mouseY > height/2) {
        textSize(100);
        fill(random(200,255), random(200,255), 0);
        if (love) {text("LOVE", random(width), random(height));}    
        if (riches) {text("RICHES", random(width), random(height));}
        if (opportunity) {text("OPPORTUNITY", random(width), random(height));}
        if (pleasure) {text("PLEASURE", random(width), random(height));}
        textSize(20);
      }
    }
  }
}


