
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

  for (int i = aniChars.size()-1; i >= 0; i--) {
    AniCharacter tempObj = aniChars.get(i);
    if(i%3==0){
    tempObj.run_1(); // run_1 each char  
    }
    else{
    tempObj.run_2(); // run_2 each char
    }
  }
}

void keyReleased() {

  if (8 == int(key) && aniChars.size() > 0) {
    println("c");
    aniChars.remove(aniChars.size()-1);
  }else{ 
    aniChars.add( new AniCharacter(random(width), random(height), key) );
  }


}

// AniCharacter class
//
// 
class AniCharacter {

  float x, y;
  float nOff_x;
  float nOff_y;
  float dynamic;
  float dynamic_c;
  float size_font;
  float size_shape;
  char letter;


  AniCharacter(float x_, float y_, char c_) {

    x = x_;
    y = y_;
    nOff_x = random(3000);
    nOff_y = random(3000);

    letter = c_;
    size_font = random(50, 200);
    size_shape = size_font + random(10, 50);
    dynamic_c = random(-0.1, 0.1);
  }

  void run_1() {

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
    nOff_x += 0.0005;
    nOff_y += 0.0003;

    x = width*noise(nOff_x);
    y = height*noise(nOff_y);
    visual_1();
  }

  void run_2() {

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
    float dx = sin(0.1);
    float dy = cos(0.1);
    float temp_x=0;
    float temp_y=0;

    temp_x=x+dx;
    temp_y=y+dy;

    x = lerp(x, 350, 0.001);   
    y = lerp(y, 350, 0.001);


    visual_2();
  }


  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual_1() {

    textSize(size_font);
    float textWid =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':

      fill(0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      stroke(0);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      break;

    case 'c':
      fill(0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(0);
      stroke(0);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;

    case 'e':
      rectMode(CENTER);
      fill(0);
      rect(x, y, textWid, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);
      break;

    case 'i':
      fill(0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      stroke(0);
      fill(255);
      ellipse(x, y, size_font, size_font);
      break;

    case 'o':
     
      fill(0);
      stroke( 0);
      rectMode(CENTER);
      rect(x, y, size_font, size_font, 7);
      fill(255);
      stroke(255);
      text(letter, x-textWid/2, y+ascent/2);
      break;
       
    case 'b':
      float tempx_ = x + size_shape*cos(dynamic*0.5);
      float tempy_ = y + size_shape*sin(dynamic*0.5);
      fill(0, 255, 0);
      noStroke();
      rectMode(CENTER);
      rect( x, y, textWid + 10, ascent + 50);
      fill(0);
      text(letter, x-textWid/2, y+ascent/2);
      break;

    case 'm':
      //fill(0);
      //text(letter, x-textWid/2, y+ascent/2);
      float Tempx = x + 10*cos(1);
      float Tempy = y + 10*sin(1);
      fill(0);
      noStroke();
      text(letter, Tempx, Tempy);

      break;

    default:
      fill(0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);
      break;
    }
  }

  void visual_2() {

    textSize(size_font);
    float textWid =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':

      fill(0, 255, 0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      stroke(0, 255, 0);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      break;

    case 'c':
      fill(255, 0, 0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(255, 0, 0);
      stroke(255, 0, 0, 140);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;

    case 't':
      rectMode(CENTER);
      fill(0, 200, 0);
      rect(x, y, textWid, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);
      break;

    case 'i':
      fill(255, 0, 0);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      stroke(255, 0, 0);
      fill(255, 255, 0, 50);
      ellipse(x, y, size_font, size_font);
      break;

    case 'o':
      fill(0, 0, 255);
      noStroke();
      text(letter, x-textWid/2, y+ascent/2);

      fill(0, 0, 255, 50);
      stroke( 0, 0, 255, 140);
      rectMode(CENTER);
      rect(x, y, size_font, size_font, 7);
      break;

    case 'b':
      float tempx_ = x + size_shape*cos(dynamic*0.5);
      float tempy_ = y + size_shape*sin(dynamic*0.5);
      fill(0, 200, 255);
      noStroke();
      rectMode(CENTER);
      rect( x, y, textWid + 10, ascent + 50);
      fill(0, 0, 255);
      text(letter, x-textWid/2, y+ascent/2);
      break;




    default:
      fill(0, lerp(255, 200, 1), size_font);
      noStroke();
      text(letter, (x-textWid/2), lerp((y+ascent/2), y, 0.1));
      break;
    }
  }
}



