
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

int currentCount;

void setup() {
  size(700, 700);
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
  //textMode(SHAPE);

  aniChars = new ArrayList<AniCharacter>();

  smooth(8); // enable antialiasing
}


void draw() {

  background(255);

if(aniChars.size()>0){
  aniChars.get(0).run(); //run first character
}
  for (int i = aniChars.size()-1; i >= 1; i--) {
    AniCharacter tempObj = aniChars.get(i);
    AniCharacter lastChar = aniChars.get(i-1);
    
    tempObj.x = lerp(tempObj.x, lastChar.x, 0.01);
    tempObj.y = lerp(tempObj.y, lastChar.y, 0.01);
    tempObj.visual();
    //tempObj.follow(); // run each char
  }
}


void keyReleased() {

  if (8 == int(key) && aniChars.size() > 0) {
    println("c");
    aniChars.remove(aniChars.size()-1);
  }else{ 
    aniChars.add( new AniCharacter(random(100, width-100), random(100,height-100), key) );
  }


}

//    void follow() {
//
//      AniCharacter.setDynamic();
//
////lerp towards previous character
//prevChar =
//float x1
//x= lerp(x, 
////float dx, dy;
//// dx = cos(radians(direction)) * speed;
////    dy = sin(radians(direction)) * speed;
////    x += dx;
////    y += dy;
//        checkBounds();
//
//
//    AniCharacter.visual();
 // }
// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float dynamic;
  float dynamic_c;
  float size_font;
  float size_shape;
  char letter;
  float speed;
  float direction;


  AniCharacter(float x_, float y_, char c_) {

    x = x_;
    y = y_;

    letter = c_;
    size_font = random(50, 60);
    size_shape = size_font + random(10, 50);
    dynamic_c = random(-0.1, 0.1);
    speed = random(0.1,1);
    direction = random(360);
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
    }
// set speed
float dx, dy;
 dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
        checkBounds();


    visual();
  }
  

 void checkBounds() {
    if (x <= textWidth(letter)/2 || x >= width-(textWidth(letter)/2) || y <= size_font/2 || y >= height-(size_font/2)) {
      direction += 60;
      direction = direction % 360;
    }
  }
  void setDynamic(){
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
    }
  }
  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {

    textSize(size_font);
    float textWidthW =  textWidth(letter);
    float ascent = textAscent() * 0.75;


      fill(0);
      noStroke();
      text(letter, x-textWidthW/2, y+ascent/2);

    }

    //ellipse(x, y, 10, 10);
  }




