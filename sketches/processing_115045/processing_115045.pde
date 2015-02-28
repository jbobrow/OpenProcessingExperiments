
PImage [] lightbulb = new PImage[23];

String[] questions = {
  "Do", "you", "hear", "me?", //3
  "Are", "you", "listening?", //6
  "Do", "you", "even", "care?", //10
  "Is", "this", "okay?", //13
  "Should", "I", "stop?", //16
  "Can", "I", "see", "them?", //20 
  "Were", "you", "lying?", //23
  "Do", "we", "have", "to?", //27
  "Why", "don't", "you", "understand?", //31 
  "Are", "you", "sure?", //34
  "Why", "did", "you", "stop?", //38 
  "Will", "you", "let", "me", "try?", //43 
  "Do", "I", "even", "matter", "to", "you?", //49 
  "Do", "they", "know", "about", "me?", //54
  "Am", "I", "important", "to", "you?" //59
};

float y = height/2;
float directiony = 0;
float x = width/2;
float directionx = width/4;
int lastSecond;


void setup() {
  size(900, 600);

  PFont font;
  font = loadFont("AndaleMono-150.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  lightbulb[0] = loadImage("lightbulb.jpg");
  lightbulb[1] = loadImage("lightbulbdark.jpg");
  lightbulb[2] = loadImage("lightbulbeveblighter.jpg");
  lightbulb[3] = loadImage("lightbulblessdark.jpg");
  lightbulb[4] = loadImage("lightbulblighter.jpg");
  lightbulb[5] = loadImage("lightbulbrullight.jpg");
  lightbulb[6] = loadImage("lightbulb copy12.jpg");
  lightbulb[7] = loadImage("lightbulb copy13.jpg");
  lightbulb[8] = loadImage("lightbulb copy14.jpg");
  lightbulb[9] = loadImage("lightbulb1.jpg");
  lightbulb[10] = loadImage("lightbulb copy.jpg");
  lightbulb[11] = loadImage("lightbulb copy1.jpg");
  lightbulb[12] = loadImage("lightbulb copy2.jpg");
  lightbulb[13] = loadImage("lightbulb copy3.jpg");
  lightbulb[14] = loadImage("lightbulb copy4.jpg");
  lightbulb[15] = loadImage("lightbulb copy5.jpg");
  lightbulb[16] = loadImage("lightbulb copy6.jpg");
  lightbulb[17] = loadImage("lightbulb copy7.jpg");
  lightbulb[18] = loadImage("lightbulb copy8.jpg");
  lightbulb[19] = loadImage("lightbulb copy9.jpg");
  lightbulb[20] = loadImage("lightbulb copy10.jpg");
  lightbulb[21] = loadImage("lightbulb copy11.jpg");
  lightbulb[22] = loadImage("lightbulb copy12.jpg");
}

void draw() {
  //  background(0);
  image(lightbulb[int(random(23))], 0, 0, width, height);
  y += directiony;
  int m = minute();
  int h = hour();
  int s = second();
  //  int size = m*2+20;
  int size = 30;


  //  background(0);
  textMode(MODEL);
  textSize(size);
  fill(int(random(255)));
  text(questions[s], width/2-15, height/4);
  if (y > 3*height/4+size) {
    y = 0;
    background(0);
  }
  //words("hi", 50);
  if (m == 0 || mouseButton == LEFT) {
    image(lightbulb[1], 0, 0, width, height);
    fill(random(255));
    text(questions[0], random(width-size), random(height-size));
    text(questions[4], random(width-size), random(height-size));
    text(questions[7], random(width-size), random(height-size));
    text(questions[11], random(width-size), random(height-size));
    text(questions[14], random(width-size), random(height-size));
    text(questions[17], random(width-size), random(height-size));
    text(questions[20], random(width-size), random(height-size));
    text(questions[24], random(width-size), random(height-size));
    text(questions[28], random(width-size), random(height-size));
    text(questions[32], random(width-size), random(height-size));
    text(questions[35], random(width-size), random(height-size));
    text(questions[39], random(width-size), random(height-size));
    text(questions[44], random(width-size), random(height-size));
    text(questions[50], random(width-size), random(height-size));
    text(questions[55], random(width-size), random(height-size));
  }


  //  if (s != lastSecond) {
  //    x += directionx;
  //    lastSecond = s;
  //  }

  // Simple clock
  String r = h + ":" + m + ":" + s;
  println(r);
}

//void words(String text, int xpos) {
//  y += directiony;
//  int s = second();
//  text(questions[s], xpos, y);
//}



