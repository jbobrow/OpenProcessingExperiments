
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
 * Backspace removes the last character added to the screen
 * LEFT arrow clears the screen
 * RIGHT arrow  saves an image of the current screen
 *
 */
ArrayList<AniCharacter> aniChars;

PFont myFont;
int saved;

int currentCount;

void setup() {
  saved = 0;
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
    tempObj.run(); // run each char
  }
}


void keyReleased() {
  if (keyCode == RIGHT) {
    saved++;
       saveFrame("w5_05" + saved + ".jpg");
        println("RIGHT pressed");
  }
  if (keyCode == LEFT){
    println("LEFT pressed");
    background(255);
    aniChars = new ArrayList<AniCharacter>();
    }
  if (8 == int(key) && aniChars.size() > 0) {
    println("c");
    aniChars.remove(aniChars.size()-1);
  }
  
  else {
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
      case 'o':
      dynamic  = sqrt(dynamic * dynamic);      // force a positive value of dynamic
      dynamic += 10 * dynamic_c * dynamic_c;   // force a positive value of dynamic_c
    //  dynamic += 5 * dynamic_c ;
      break;
      case '3':
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
    float textWidth =  textWidth(letter);
    float ascent = textAscent() * 0.75;
    float descent = textDescent()* 0.75;
    float textHeight = ascent + descent;

    switch(letter) {
    case 'a':

      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);

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
      text(letter, x-textWidth/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(255, 0, 0);
      stroke(255, 0, 0, 140);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;

    case 'e':
      rectMode(CENTER);
      fill(0, 255, 0);
      rect(x, y, textWidth, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);
      break;
      
      
      case 'o':
      rectMode(CORNER);
      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);
      ellipseMode(CENTER);
      
    //  fill(0, 255, 0);
      fill(map(x-textWidth, 0,200, 0,255),  0, 140);
    //  ellipse(x, y, textWidth, size_shape*sin( radians(dynamic) ));
       ellipse(x, y, textWidth - size_shape*sin( radians(dynamic)), textWidth - size_shape*sin( radians(dynamic)));
      fill(map(x-textWidth, 0,200, 0,255),  map(x-textWidth, 0,200, 255, 0), 140);
      ellipse(x, y, 0.7 *(textWidth - size_shape*sin( radians(dynamic))), 0.7 *(textWidth - size_shape*sin( radians(dynamic))));
       fill(map(x-textWidth, 0,200, 0,255),  map(x-textWidth, 0,200, 255, 0),50);
      ellipse(x, y, 0.3 *(textWidth - size_shape*sin( radians(dynamic))), 0.3 *(textWidth - size_shape*sin( radians(dynamic))));
      rectMode(CORNER);
   //   println("dynamic = " + dynamic + "textWidth - size_shape*sin( radians(dynamic )" + (textWidth - size_shape*sin( radians(dynamic)) ));

      
      break;

case '3':
      rectMode(CENTER);
      fill(map(size_shape, 0, 255,250, 40), map(textWidth, 0, 255,250, 40), map(frameCount%255, 0, 255, 100, 250)  );
     // fill(map(size_shape, 0, 255,250, 40), map(frameCount%140, 0, 255,250, 40), map(frameCount%255, 0, 255, 100, 250)  );
      rect(x, y - descent/2,  size_shape*sin( radians(dynamic) ), textHeight + descent);
      rectMode(CORNER);

      fill(255);
      noStroke();
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



