
PFont font;
PImage t_spr;
PImage t_sum;
PImage t_fall;
PImage t_dec;
int x = 60;

void setup() {
  size(660,120);
  
  font = loadFont("Dialog-70.vlw");
  textFont(font, 70);
  
  t_spr = loadImage("sapling_sm.png");
  t_sum = loadImage("youngtree_sm.png");
  t_fall = loadImage("adulttree_sm.png");
  t_dec = loadImage("christmas_sm.gif");
}

void draw() {
  int d = day();
  int m = month();

  if (m <= 11) {
    background(255);
    if (m == 1) {
      fill(#535542);
      text("January", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_spr, a, x+30);
      }
    }

    if (m == 2) {
      fill(#BAD623);
      text("Feburary", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_spr, a, x+30);
      }
    }

    if (m == 3) {
      fill(#EAC158);
      text("March", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_spr, a, x+30);
      }
    }

    if (m == 4) {
      fill(#E5F58F);
      text("April", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_spr, a, x+30);
      }
    }

    if (m == 5) {
      fill(#F56AEC);
      text("May", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_sum, a, x+30);
      }
    }

    if (m == 6) {
      fill(#AAEA58);
      text("June", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_sum, a, x+30);
      }
    }

    if (m == 7) {
      fill(#19FA9E);
      text("July", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_sum, a, x+30);
      }
    }

    if (m == 8) {
      fill(#FA5919);
      text("August", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_sum, a, x+30);
      }
    }

    if (m == 9) {
      fill(#CE7836);
      text("September", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_fall, a, x+30);
      }
    }

    if (m == 10) {
      fill(#757E9D);
      text("October", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_fall, a, x+30);
      }
    }

    if (m == 11) {
      fill(#3F62E8);
      text("November", 20, x);
      for(int a=20; a < 20+(d*20); a=a+20) {
        image(t_fall, a, x+30);
      }
    }
  }

  if (m == 12) {
    background(255);
    fill(#E52A2A);
    text("December", 20, x);
    for(int a=20; a < 20+(d*20); a=a+20) {
      image(t_dec, a, x+30);
    }
  }
}


