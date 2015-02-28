

float[] yTop = new float[4];
char[] post = {'P', '0', 'S', 'T'};
char[] analog = {'A', 'N', 'A', 'L', 'O', 'G'};
char[] gibberish = {'@', '#', '!', '%', '&', '['};
PFont fontA;
float[] roff = new float[5];
float[] roff2 = new float[7];

PImage book;
PImage screen1;

int myMax = int(random(gibberish.length));

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
  book = loadImage("book.png");
  screen1 = loadImage("screen.png");
  imageMode(CENTER);
}

void draw() {
  background(0);
  int mv = int(map(mouseX, 0, width, 0, gibberish.length));
    for (int i = 0;i<mv;i++) {
    roff[i] = random(-10, 10);
    if (i<post.length) {
      int temp = int(random(6));
      post[i] = gibberish[temp];
    }
  }
   for (int i = 0;i<mv;i++) {
    roff2[i] = random(-10, 10);
    if (i<analog.length) {
      int temp = int(random(6));
      analog[i] = gibberish[temp];
    }
  }
  float mw = map(mouseX, 0, width, 0, 255);
  tint(100, mw); 
 if(mouseX < 300) {
  image(book, width/2, height/2);
 }else if (mouseX > 300){
     tint(100, mw-100); 
  image(screen1, width/2, height/2);
}
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

//void mousePressed() {
//  for (int i = 0;i<5;i++) {
//    roff[i] = random(-10, 10);
//    if (i<post.length) {
//      int temp = int(random(6));
//      post[i] = gibberish[temp];
//    }
//    println(i+":"+roff[i]);
//  }
//  for (int i = 0;i<roff2.length;i++) {
//    roff2[i] = random(-10, 10);
//    if (i<analog.length) {
//      int temp = int(random(6));
//      analog[i] = gibberish[temp];
//    }
//    println(i+":"+roff2[i]);
//  }
//}


