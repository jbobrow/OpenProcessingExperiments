
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

float xGrid = width/5;
float yGrid = width/5;

//int currentCount;

void setup() {
  size(700, 700);
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
  //textMode(SHAPE);

  aniChars = new ArrayList<AniCharacter>();

  smooth(8); // enable antialiasing
}


void draw() {

  //background(255);

  for (int i = aniChars.size()-1; i >= 0; i--) {
    AniCharacter tempObj = aniChars.get(i);
    tempObj.run(); // run each char
  }
}


void keyReleased() {

  if (8 == int(key) && aniChars.size() > 0) {
    println("c");
    aniChars.remove(aniChars.size()-1);
  }else{ 
    aniChars.add( new AniCharacter(random(width), random(height), key, xGrid, yGrid) );
  }
    xGrid = xGrid+width/10;
    
    if (xGrid > width){
      xGrid = 0;
      yGrid = yGrid+width/10;
    }
    
    if (yGrid > height){
      yGrid = 0;
    }


}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y, xMove, yMove;
  //float nOff_x;
  //float nOff_y;
  float dynamic;
  float dynamic_c;
  //float size_font;
  //float size_shape;
  char letter;


  AniCharacter(float x_, float y_, char c_, float xMove_, float yMove_) {

    x = x_;
    y = y_;
    xMove = xMove_;
    yMove = yMove_;
    //nOff_x = random(3000);
    //nOff_y = random(3000);

    letter = c_;
    //size_font = random(50, 200);
    //size_shape = size_font + random(10, 50);
    dynamic_c = random(-0.1, 0.1);
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

    // speed of motion
    //nOff_x += 0.0005;
    //nOff_y += 0.0003;

    x = lerp(x, xMove, 0.1);
    y = lerp(y, yMove, 0.1);

    visual();
  }

  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {

    textSize(width/25);
    float textWidth =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':
      fill(#cc0000);
      text(letter, x-textWidth/2, y+ascent/2);
      break;
      
    case 'e':
      fill(#cc0000);
      text(letter, x-textWidth/2, y+ascent/2);
      break;
    
    case 'i':
      fill(#cc0000);
      text(letter, x-textWidth/2, y+ascent/2);
      break;
    
    case 'o':
      fill(#cc0000);
      text(letter, x-textWidth/2, y+ascent/2);
      break;
    
    case 'u':
      fill(#cc0000);
      text(letter, x-textWidth/2, y+ascent/2);
      break;  

    default:
      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);
      break;
    }

    //ellipse(x, y, 10, 10);
  }
}



