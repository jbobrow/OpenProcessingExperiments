
float[] yTop = new float[4];
char[] post = {
  'P', '0', 'S', 'T'
};
char[] analog = {
  'A', 'N', 'A', 'L', 'O', 'G'
};
char[] [] gibberish = {
  {
    'A', '@', '#', '!', '%', '&', '['
  }
  , {
    'N', '@', '#', '!', '%', '&', '['
  }
  , {
    'A', '@', '#', '!', '%', '&', '['
  }
  , {
    'L', '@', '#', '!', '%', '&', '['
  }
  , {
    'O', '@', '#', '!', '%', '&', '['
  }
  , {
    'G', '@', '#', '!', '%', '&', '['
  }
};
char[] [] gibberish2 = {
  {
    'P', '@', '#', '!', '%', '&', '['
  }
  , {
    'O', '@', '#', '!', '%', '&', '['
  }
  , {
    'S', '@', '#', '!', '%', '&', '['
  }
  , {
    'T', '@', '#', '!', '%', '&', '['
  }
};
PFont fontA;
float[] roff = new float[5];
float[] roff2 = new float[7];

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
  println(yTop[0]);
  println(post[2]);
  frameRate(10);
}

void draw() {
  background(0);
  // draw shape with 2 params:
  //p1: stroke weights
  //p2: offset
  //p3: scalar
  drawShape(5);
  drawShape2(5);
}

void drawShape(int sw) {
  strokeWeight(sw);
  stroke(31, 0, 100);
  pushMatrix();
  translate(0, 150);
  for (int i = 0;i<4;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(post[i], xpos, roff[i+1]);
    }
    else {
      text(post[i], xpos, roff[i+1]);
      line(xpos-50, roff[i], xpos-5, roff[i+1]);
    }
  }
  popMatrix();
}

void drawShape2(int sw) {
  strokeWeight(sw);
  stroke(31, 0, 100);
  pushMatrix();
  translate(0, 250);
  for (int i = 0;i<6;i++) {
    int xpos = 80*(i+1);

    if (i==0) {
      text(analog[i], xpos, roff2[i+1]);
    }
    else {
      text(analog[i], xpos, roff2[i+1]);
      line(xpos-50, roff2[i], xpos-5, roff2[i+1]);
    }
  }
  popMatrix();
}

void mousePressed() {
  for (int i = 0;i<5;i++) {
    roff[i] = random(-10, 10);
    println(i+":"+roff[i]);
    if (i<post.length) {
      int temp = int(random(4));
      post[i] = gibberish2[temp][temp];
    }
  }
  for (int i = 0;i<roff2.length;i++) {
    roff2[i] = random(-10, 10);
    if (i<analog.length) {
      int temp = int(random(6));
      for ( int f = 0; f<temp; f++) {
        for ( int g = 0; g<temp; g++) {
          analog[i] = gibberish[temp][temp];
        }
      }
      println(i+":"+roff2[i]);
    }
  }
}


