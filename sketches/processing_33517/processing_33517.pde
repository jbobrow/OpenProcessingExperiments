
/*
Jennifer Kaye
 jenniferkaye7@gmail.com
 Copyright 2011
 Parsons MFA D+T Bootcamp
 Homework 8/9/11: Simple Drawing App
 
 Image credits:
 Andy Warhol
 http://appleadayproject.wordpress.com/
 http://appleadayproject.wordpress.com/
 */

PImage apple;
PImage banana;
PImage crepe;
PFont helvetica;


void setup () {
  size (900, 700);
  background (255, 255, 160);
  apple = loadImage("apple.png");
  banana = loadImage("banana.png");
  crepe = loadImage("crepe.png");
  
  fill (115, 70, 50);//Instructions
  helvetica = loadFont("Helvetica-Bold-48.vlw");
  textFont(helvetica, 13);
  text ("Draw by dragging your mouse.", 30, 50);
  text ("Pick a brush: A, B, C are surprise images,", 30, 70);
  text ("D, E and F are graphic brushes of different colors.", 30, 90);
  text ("Delete with Backspace. Go nuts!", 30, 110);
  frameRate (10);
}

void draw () {
}

void keyPressed () {
  if (key == BACKSPACE) {
  background (255, 255, 160);
 }
}

void mousePressed () {
  if (key == 'a') {
    image (apple, mouseX, mouseY);
  }
  else if (key == 'b') {
    image (banana, mouseX, mouseY);
  }
  else if (key == 'c') {
    image (crepe, mouseX, mouseY);
  }
  else if (key == 'd') {
    fill (115, 70, 50);
    stroke (255, 255, 88);
    rect (mouseX, mouseY, 40, 10);
  }
  else if (key == 'e') {
    fill (255, 255, 88);
    stroke (115, 70, 50);
    rect (mouseX, mouseY, 40, 10);
    }
  else if (key == 'f') {
    fill (random(256), random(256), random(256));
    stroke (0);
    rect (mouseX, mouseY, 40, 10);
    }
  else {
    fill (255, 255, 88);
    stroke (115, 70, 50);
    rect (mouseX, mouseY, 40, 10);
  }
}

  void mouseDragged () {
    if (key == 'a') {
      image (apple, mouseX, mouseY);
    }
    else if (key == 'b') {
      image (banana, mouseX, mouseY);
    }
    else if (key == 'c') {
      image (crepe, mouseX, mouseY);
    }
    else if (key == 'd') {
      fill (115, 70, 50);
      stroke (255, 255, 88);
      rect (mouseX, mouseY, 40, 10);
  }
   else if (key == 'e') {
      fill (255, 255, 88);
      stroke (0);
      rect (mouseX, mouseY, 40, 10);
    }
    
   else if (key == 'f') {
    fill (random(256), random(256), random(256));
    stroke (0);
    rect (mouseX, mouseY, 40, 10);
    }
    else {
      fill (255, 255, 88);
      stroke (115, 70, 50);
      rect (mouseX, mouseY, 40, 10);
    }
  }
  


