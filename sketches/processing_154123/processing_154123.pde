
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
/* @pjs font="GOTHIC.ttf"; */ 
 
ArrayList<AniCharacter> aniChars;

PFont myFont;

int currentCount;

void setup() {
  size(700, 700);
  myFont = createFont("GOTHIC.ttf");
  textFont(myFont);
  //textMode(SHAPE);

  aniChars = new ArrayList<AniCharacter>();

  smooth(8); // enable antialiasing
}


void draw() {

  background(255);

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
    nOff_x = random(8000);
    nOff_y = random(8000);

    letter = c_;
    size_font = random(50, 200);
    size_shape = size_font + random(10, 50);
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
    case 'd':
      dynamic -= dynamic_c;
      break;
    case 'e':
      dynamic += dynamic_c;
      break;
   case 'h':
      dynamic -= dynamic_c;
      break;
    case 'i':
      dynamic += dynamic_c;
      break;
    case 'l':
      dynamic += dynamic_c;
      break;
    case 'm':
      dynamic += dynamic_c;
      break;
    case 'n':
      dynamic -= dynamic_c;
      break;
    case 'r':
      dynamic += dynamic_c;
      break;
    case 's':
      dynamic -= dynamic_c;
      break;
    case 't':
      dynamic += dynamic_c;
      break;
    case 'u':
      dynamic -= dynamic_c;
      break;
    case 'w':
      dynamic += dynamic_c;
      break;

    }

    // speed of motion
    nOff_x += 0.0005;
    nOff_y += 0.0003;

    x = width*noise(nOff_x);
    y = height*noise(nOff_y);

    visual();
  }

  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {

    textSize(size_font);
    float textW =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':

      fill(0);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);

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
      text(letter, x-textW/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(255, 0, 0);
      stroke(255, 0, 0, 140);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;
      
    case 'd':

      fill(0);
      stroke(0);
      strokeWeight(4);
      text(letter, x-textW/2, y+ascent/2);

      
      noFill();
      pushMatrix();
      translate(x, y);
      rotate((dynamic/5)*2);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      strokeWeight(1);
      break;

    case 'e':
      rectMode(CENTER);
      fill(0);
      rect(x, y, textW, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
    case 'h':
      rectMode(CENTER);
      fill(0);
      rect(x, y, textW, size_shape*sin( radians(dynamic) ));


      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
   case 'i':
      fill(0);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);

      float tempx2 = x + size_shape*cos(dynamic*0.5);
      float tempy2 = y + size_shape*sin(dynamic*0.5);
      fill(255, 0, 0);
      strokeWeight(1);
      stroke(255, 0, 0, 140);
      line(x, y, tempx2, tempy2);
      noStroke();
      ellipse(tempx2, tempy2, 10, 10);
      
      float tempx3 = x - size_shape*cos(dynamic*0.3);
      float tempy3 = y - size_shape*sin(dynamic*0.3);
      fill(255, 0, 0);
      stroke(255, 0, 0, 140);
      line(x, y, tempx3, tempy3);
      noStroke();
      ellipse(tempx3, tempy3, 13, 13);
      break;
      
    case 'l':
      rectMode(CENTER);
      fill(0);
      rect(x, y, textW+3, ascent+3);
      rectMode(CORNER);
      
      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
    case 'm':
      stroke(0);
      for (int i = 0; i < 8; i++){
      strokeWeight(1);
      line(x -(textW/2), y - (ascent/(i*2)+4),  x +(textW/2), y - (ascent/(i*2)+4));
      line(x -(textW/2), y - (ascent/(i*2)+7),  x +(textW/2), y - (ascent/(i*2)+7));
      line(x -(textW/2), y - (ascent/(i*2)),  x +(textW/2), y - (ascent/(i*2)));
      line(x -(textW/2), y + (ascent/(i*2)),  x +(textW/2), y + (ascent/(i*2)));
      }
      strokeWeight(2);
      line(x -(textW/2), y ,  x +(textW/2), y );

      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
    case 'n':
    strokeCap(SQUARE);
      stroke(0);
      for (int i = 0; i < 10; i++){
      strokeWeight(1);
      line(x -(textW/2) + i*3, y - ascent/2,  x -(textW/2) + i*3, y + ascent/2);
      line(x +(textW/2) - i*3, y - ascent/2,  x +(textW/2) - i*3, y + ascent/2);
      }
      strokeWeight(ceil(textW/18));
      line(x, y - ascent/2,  x, y + ascent/2);

      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;

    case 'r':
      noStroke();
      ellipseMode(CENTER);
      fill(0);
      ellipse(x, y, textW + 10, ascent);


      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
   
    case 's':
      stroke(0);
      for (int i = 0; i < 8; i++){
      strokeWeight(1);
      line(x -(textW/2), y - (ascent/(i*2)),  x +(textW/2), y - (ascent/(i*2)));
      line(x -(textW/2), y + (ascent/(i*2)),  x +(textW/2), y + (ascent/(i*2)));
      }
      strokeWeight(2);
      line(x -(textW/2), y ,  x +(textW/2), y );

      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
    case 't':

      fill(0);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);

      stroke(255, 0, 0);
      strokeWeight(8);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      strokeWeight(1);
      break;
      
    case 'u':
    strokeCap(SQUARE);
      stroke(0);
      for (int i = 0; i < 10; i++){
      strokeWeight(1);
      line(x -(textW/2) + i*3, y - ascent/2,  x -(textW/2) + i*3, y + ascent/2);
      line(x +(textW/2) - i*3, y - ascent/2,  x +(textW/2) - i*3, y + ascent/2);
      }
      strokeWeight(ceil(textW/18));
      line(x, y - ascent/2,  x, y + ascent/2);

      fill(255);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
      
    case 'w':
      fill(0);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);

      float tempx4 = x + size_shape*cos(dynamic*0.5);
      float tempy4 = y + size_shape*sin(dynamic*0.5);
      fill(0);
      stroke(0);
      strokeWeight(1);
      line(x, y, tempx4, tempy4);
      noStroke();
      ellipse(tempx4, tempy4, 5, 5);

      stroke( 0);
      strokeWeight(1);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, PI, PI+HALF_PI);
      popMatrix();
      strokeWeight(1);
      break;
      

    default:
      fill(0);
      noStroke();
      text(letter, x-textW/2, y+ascent/2);
      break;
    }
    }
    //ellipse(x, y, 10, 10);
  }




