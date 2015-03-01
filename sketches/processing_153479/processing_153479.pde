
/*
 * Creative Coding
 * Week 5, 05 - Text agents
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch creates a simple agent-based simulation using text and objects
 * The sketch reads in characters from the keyboard and dynamically creates
 * new objects for each character.
 *
 */
ArrayList<AniCharacter> aniChars;

PFont myFont;
PFont otherFont;

int currentCount;
float wordHue;
float wordSat;
float wordBright;
float wordOpaque;
float wordX;
float wordY;
float wordDx;
float wordDy;

void setup() {
  size(700, 700);
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  otherFont = loadFont("Frutiger65-Bold-200.vlw");
  textFont(myFont);
  colorMode(HSB);
  //textMode(SHAPE);

  randomSeed(hour() + minute() + second() * millis());
  wordHue = random(360);
  wordSat = random(128, 255);
  wordBright = random(128, 192);
  wordOpaque = random(128, 192);
  wordX = width/2+0.67*random(-width/2, width/2);
  wordY = width/2+0.67*random(-height/2, height/2);
  wordDx = abs(randomGaussian());
  wordDx = abs(randomGaussian());

  aniChars = new ArrayList<AniCharacter>();

  smooth(8); // enable antialiasing
}


void draw() {

  background(255);

  for (int i = aniChars.size ()-1; i >= 0; i--) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.run(); // run each char
  }
}


void keyReleased() {

  if (8 == int(key) && aniChars.size() > 0) {
    println("c");
    aniChars.remove(aniChars.size()-1);
  } else {
    if (key == ' ') {
      wordHue = (wordHue+random(60, 150)) % 360;
      wordSat = random(128, 255);
      wordBright = random(128, 192);
      wordOpaque = random(128, 192);
      wordX = width/2+0.67*random(-width/2, width/2);
      wordY = height/2+0.67*random(-height/2, height/2);
      wordDx = abs(randomGaussian());
      wordDx = abs(randomGaussian());
    }
    color letterColour = color(wordHue, wordSat, wordBright, wordOpaque);
    float charX  = abs(wordX+randomGaussian()*width/6) % width;
    float charY  = abs(wordY+randomGaussian()*height/6) % height;
    aniChars.add( new AniCharacter(charX, charY, key, letterColour, wordX, wordY, wordDx, wordDy) );
    wordSat--;
    wordBright--;
    wordOpaque--;
    wordHue = (wordHue+2) % 360;
  }
}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float nOff_x;
  float nOff_y;
  float locus_x;
  float locus_y;
  float locus_offset_x;
  float locus_offset_y;
  float dx;
  float dy;
  float dynamic;
  float dynamic_c;
  float size_font;
  float size_shape;
  int locus_stage;
  color colour;
  char letter;


  AniCharacter(float x_, float y_, char c_, color colour_, float locus_x_, float locus_y_, float dx_, float dy_) {

    x = x_;
    y = y_;
    locus_x = locus_x_;
    locus_y = locus_y_;
    locus_offset_x = locus_x - x;
    locus_offset_y = locus_y - y;
    dx = dx_;
    dy = dy_;
    nOff_x = random(3000);
    nOff_y = random(3000);

    letter = c_;
    size_font = random(50, 200);
    size_shape = size_font + random(10, 50);
    dynamic_c = random(-0.1, 0.1);
    colour = colour_;
    locus_stage = 0;
  }

  void run() {

    switch(letter) {
    case 'a':
      dynamic -= dynamic_c;
      break;
    case 'c':
      dynamic += dynamic_c;
      break;
    case 'e':
      dynamic += dynamic_c;
      break;
    case 'h':
      dynamic += dynamic_c;
      break;
    case 'i':
      dynamic += dynamic_c;
      break;
    case 'm':
      dynamic += dynamic_c;
      break;
    case 'o':
      dynamic += dynamic_c;
      break;
    case 'r':
      dynamic += dynamic_c;
      break;
    case 's':
      dynamic += dynamic_c;
      break;
    case 't':
      dynamic += dynamic_c;
      break;
    case 'v':
      dynamic += dynamic_c;
      break;
    }

    // speed of motion
    nOff_x += 0.0005;
    nOff_y += 0.0003;

    x = abs((x + dx * 0.001*locus_offset_x*noise(nOff_x)) % width);
    y = abs((y + dy * 0.001*locus_offset_y*noise(nOff_y)) % height);
    locus_offset_x = locus_x - x;
    locus_offset_y = locus_y - y;

    visual();
  }

  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {

    textSize(size_font);
    float tWidth =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':

      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);

      stroke(colour);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      break;

    case 'c':
      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(0);
      stroke(0, 140);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;

    case 'd':
      textFont(otherFont);
      textSize(size_font);
      tWidth =  textWidth(letter);
      ascent = textAscent() * 0.75;
      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);
      textFont(myFont);
      break;

    case 'e':
      rectMode(CENTER);
      fill(colour);
      rect(x, y, tWidth, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);
      break;

    case 'h':
      pushMatrix();
      translate(x-tWidth/2, y+ascent/2);
      shearX((TWO_PI / size_shape) * 8 * sin(dynamic));
      fill(colour);
      noStroke();
      text(letter, 0, 0);
      popMatrix();
      break;

    case 'i':
      float tempX = (size_shape * dynamic/8) % size_shape;
      noFill();
      stroke(0, 140);
      line(x-tempX, y-tempX, x-tempX, y+tempX);
      line(x+tempX, y-tempX, x+tempX, y+tempX);

      fill(colour);
      text(letter, x-tWidth/2, y+ascent/2);
      break;

    case 'm':
      pushMatrix();
      translate(x-tWidth/2, y+ascent/2);
      shearY((TWO_PI / size_shape) * 12 * sin(dynamic));
      fill(colour);
      noStroke();
      text(letter, 0, 0);
      popMatrix();
      break;

    case 'o':
      float oRadius = size_shape * cos(dynamic*0.25);
      noFill();
      stroke(0, 140);
      ellipse(x, y, oRadius/3, oRadius/3);
      ellipse(x, y, oRadius*2/3, oRadius*2/3);
      ellipse(x, y, oRadius, oRadius);

      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);
      break;      

    case 'r':
      pushMatrix();
      translate(x-tWidth/2, y+ascent/2);
      scale(1, size_shape / size_font * abs(sin(dynamic * 0.5)));
      fill(colour);
      noStroke();
      text(letter, 0, 0);
      popMatrix();
      break;

    case 's':
      pushMatrix();
      translate(x, y+ascent/2);
      scale(size_shape / tWidth * abs(sin(dynamic)), 1);
      fill(colour);
      noStroke();
      text(letter, -tWidth/2, 0);
      popMatrix();
      break;

    case 't':
      pushMatrix();
      translate(x-tWidth/2, y+ascent/2);
      rotate(sin(TWO_PI / size_shape * (10 * dynamic)) * PI / 4);
      fill(colour);
      noStroke();
      text(letter, 0, 0);
      popMatrix();
      break;

    case 'v':
      tempX = (size_shape * dynamic/4) % size_shape;
      noFill();
      stroke(0, 140);
      beginShape();
      vertex(x-tempX, y-size_shape);
      vertex(x, y+size_shape);
      vertex(x+tempX, y-size_shape);
      endShape();

      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);
      break;

    default:
      fill(colour);
      noStroke();
      text(letter, x-tWidth/2, y+ascent/2);
      break;
    }

    //ellipse(x, y, 10, 10);
  }
}



