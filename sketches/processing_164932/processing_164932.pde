
//sets up font to load
/* @pjs font= "CenturyGothic.ttf"; */

//sets up things that only happen once
void setup() {
  //sets the size
  size(500, 500);
  //ends void setup
}

//sets up things that coninuously draw
void draw() {
//sets up if statement for if q is pressed
  if (key=='q') {
    //tells program that if q is pressed, run textreadability
    textreadability();
    //ends if statement
  }
  //sets up if statement for if w is pressed
  if (key == 'w') {
    //tells program that if q is pressed, run colorseparation
    colorseparation();
    //ends if statement
  }
  //sets up if statement for if e or any keys used inside colorcontrast are pressed
  if (key == 'e' || key == 'r' || key == 't' || key == 'y' || key == 'u' || key == 'i' || key == 'o' || key == 'p' || key == 'a' || key == 's' || key == 'd' || key == 'f' || key == 'g' || key == 'h' || key == 'j' || key == 'k' || key == 'l' || key == 'z' || key == 'x' || key == 'c') {
    //tells program that if q is pressed, run colorcontrast
    colorcontrast();
    //ends if statement
  }
  //ends void draw
}

//sets up custom function textreadability
void textreadability() { 
  //sets the baground (r,g,b)
  background(random(0, 255), random(0, 255), random(0, 255));
  //sets fill
  fill(255);
  //makes fonts possible?
  PFont CG;
  //loads a font from the sketch's data folder and names it CG
  CG = createFont("CenturyGothic.ttf",48);
  //sets the font to CG, size 30
  textFont(CG, 30);
  //types this text starting at (x,y)
  text("Programming is hard sometimes.", 20, 50);

  //sets the font to CG, size 12
  textFont(CG, 12);
  //types this text starting at (x,y)
  text("(A POEM BY KAILEE)", 20, 80);

  //sets the font to CG, size 16
  textFont(CG, 16);
  //types this text starting at (x,y)
  text("Especially when you cannot convert from char to boolean.", 20, 130);

  //sets the text alignment to right
  textAlign(RIGHT);
  //sets the font to CG, size 7
  textFont(CG, 7);
  //types this text starting at (x,y)
  text("And when you don't know what that means", 450, 160);
  //types this text starting at (x,y)
  text("Or when you don't know how to make lines of text.", 450, 170);
  //types this text starting at (x,y)
  text("Make lines without making a new text section, that is.", 450, 180);

  //sets the font to CG, size 15
  textFont(CG, 15);
  //types this text starting at (x,y)
  text("What does PFont REALLY mean?", 450, 200);
  //types this text starting at (x,y)
  text("And why do I need it?", 450, 220);
  //types this text starting at (x,y)
  text("I forgot a semicolon again.", 450, 240);

  //sets the text alignment to right
  textAlign(LEFT);
  //sets the font to CG, size 12
  textFont(CG, 18);
  //types this text starting at (x,y)
  text("Changing the font was hard (so hard it never happened).", 20, 320);

  //sets the font to CG, size 28
  textFont(CG, 28);
  //types this text starting at (x,y)
  text("IT WAS NOT EXTREMELY FUN.", 20, 400);
  //types this text starting at (x,y)
  text("IT WAS NOT EXTREMELY EASY.", 20, 430);
  //types this text starting at (x,y)
  text("IT WAS NOT EXTREMELY SHORT.", 20, 460);
  //types this text starting at (x,y)
  text("IT WAS NOT TERRIBLE THOUGH.", 20, 490);
  //ends text readability
}

//sets up custom function colorseparation
void colorseparation() {
  //runs the cutom function separate
  separate();
  //sets the stroke to none
  noStroke();
  //sets the fill to black
  fill(0);
  //draws a rectangle (x,y,w,h)
  rect(150, 0, 200, 500);
  //sets up an if statement for if the mouse is pressed
  if (mousePressed) {
    //tells the program that if the mouse is pressed, run the function separate
    separate();
    //ends if statement
  }
  //ends colorseparation
}

//sets up custom function separate
void separate() {
  //sets the brackground to black
  background(0);
  //sets stroke to none
  noStroke();

  //sets fill (r,g,b)
  fill(100, 0, 80);
  //draws rectangle (x,y,w,h)
  rect(50, 0, 200, 100);
  //sets fill (r,g,b)
  fill(93, 0, 80);
  //draws rectangle (x,y,w,h)
  rect(250, 0, 200, 100);

  //sets fill (r,g,b)
  fill(0, 215, 255);
  //draws rectangle (x,y,w,h)
  rect(50, 100, 200, 100);
  //sets fill (r,g,b)
  fill(0, 200, 235);
  //draws rectangle (x,y,w,h)
  rect(250, 100, 200, 100);

  //sets fill (r,g,b)
  fill(0, 200, 30);
  //draws rectangle (x,y,w,h)
  rect(50, 200, 200, 100);
  //sets fill (r,g,b)
  fill(0, 190, 20);
  //draws rectangle (x,y,w,h)
  rect(250, 200, 200, 100);

  //sets fill (r,g,b)
  fill(240, 200, 0);
  //draws rectangle (x,y,w,h)
  rect(50, 300, 200, 100);
  //sets fill (r,g,b)
  fill(230, 180, 0);
  //draws rectangle (x,y,w,h)
  rect(250, 300, 200, 100);

  fill(255, 90, 0);
  //draws rectangle (x,y,w,h)
  rect(50, 400, 200, 100);
  //sets fill (r,g,b)
  fill(225, 80, 0);
  //draws rectangle (x,y,w,h)
  rect(250, 400, 200, 100);
  //ends separate function
}

//sets up custom function colorcontrast
void colorcontrast() {
  //sets stroke to none
  noStroke(); 
  //runs custom function contrast when red is 255 and green is 3
  contrast (255, 3);
  //sets up if statement for if r is pressed
  if (key == 'r') {
    //tells program that if r is pressed, set the stroke to 1
    stroke(1);
    //tells program that if r is pressed, run the contrast function when red is 255 and green is 3
    contrast (255, 3);
    //ends if statement
  }
  //sets up if statement for if t is pressed
  if (key == 't') {
    //tells program that if t is pressed, set the stroke to none
    noStroke(); 
    //tells program that if t is pressed, run the contrast function when red is 0 and green is 150
    contrast (0, 150);
    //ends if statement
  }
  //sets up if statement for if y is pressed
  if (key == 'y') {
    //tells program that if y is pressed, set the stroke to 1
    stroke(1);
    //tells program that if y is pressed, run the contrast function when red is 0 and green is 150
    contrast (0, 150);
    //ends if statement
  }

  //sets up if statement for if u is pressed
  if (key == 'u') {
    //tells program that if u is pressed, set the stroke to none
    noStroke(); 
    //tells program that if u is pressed, run the contrast function when red is 255 and green is 255
    contrast (255, 255);
    //ends if statement
  }
  //sets up if statement for if i is pressed
  if (key == 'i') {
    //tells program that if i is pressed, set the stroke to 1
    stroke(1);
    //tells program that if i is pressed, run the contrast function when red is 255 and green is 3
    contrast (255, 255);
  }   

  //sets up if statement for if o is pressed
  if (key == 'o') {
    //tells program that if o is pressed, set the stroke to none
    noStroke(); 
    //tells program that if o is pressed, run the contrast function when red is 0 and green is 255
    contrast (0, 255);
    //ends if statement
  }
  //sets up if statement for if p is pressed
  if (key == 'p') {
    //tells program that if p is pressed, set the stroke to 1
    stroke(1);
    //tells program that if p is pressed, run the contrast function when red is 0 and green is 255
    contrast (0, 255);
    //ends if statement
  }

  //sets up if statement for if a is pressed
  if (key == 'a') {
    //tells program that if a is pressed, set the stroke to none
    noStroke(); 
    //tells program that if a is pressed, run the contrast function when red is 0 and green is 0
    contrast (0, 0);
    //ends if statement
  }
  //sets up if statement for if s is pressed
  if (key == 's') {
    //tells program that if s is pressed, set the stroke to 255
    stroke(255);
    //tells program that if s is pressed, run the contrast function when red is 0 and green is 0
    contrast (0, 0);
    //ends if statement
  }

  //sets up if statement for if d is pressed
  if (key == 'd') {
    //tells program that if d is pressed, set the stroke to none
    noStroke(); 
    //tells program that if d is pressed, run the contrast function when red is 255 and green is 100
    contrast (255, 100);
    //ends if statement
  }
  //sets up if statement for if f is pressed
  if (key == 'f') {
    //tells program that if f is pressed, set the stroke to 1
    stroke(1);
    //tells program that if f is pressed, run the contrast function when red is 255 and green is 100
    contrast (255, 100);
    //ends if statement
  }

  //sets up if statement for if g is pressed
  if (key == 'g') {
    //tells program that if g is pressed, set the stroke to none
    noStroke(); 
    //tells program that if g is pressed, run the contrast function when red is 150 and green is 150
    contrast (150, 150);
    //ends if statement
  }
  //sets up if statement for if h is pressed
  if (key == 'h') {
    //tells program that if h is pressed, set the stroke to 1
    stroke(1);
    //tells program that if h is pressed, run the contrast function when red is 150 and green is 150
    contrast (150, 150);
    //ends if statement
  }

  //sets up if statement for if j is pressed
  if (key == 'j') {
    //tells program that if j is pressed, set the stroke to none
    noStroke(); 
    //tells program that if j is pressed, run the contrast function when red is 50 and green is 50
    contrast (50, 50);
    //ends if statement
  }
  //sets up if statement for if k is pressed
  if (key == 'k') {
    //tells program that if k is pressed, set the stroke to 1
    stroke(1);
    //tells program that if k is pressed, run the contrast function when red is 50 and green is 50
    contrast (50, 50);
    //ends if statement
  }

  //sets up if statement for if l is pressed
  if (key == 'l') {
    //tells program that if l is pressed, set the stroke to none
    noStroke(); 
    //tells program that if l is pressed, run the contrast function when red is 255 and green is 155
    contrast (255, 155);
    //ends if statement
  }
  //sets up if statement for if z is pressed
  if (key == 'z') {
    //tells program that if z is pressed, set the stroke to 1
    stroke(1);
    //tells program that if z is pressed, run the contrast function when red is 255 and green is 155
    contrast (255, 155);
    //ends if statement
  }

  //sets up if statement for if x is pressed
  if (key == 'x') {
    //tells program that if x is pressed, set the stroke to none
    noStroke(); 
    //tells program that if x is pressed, run the contrast function when red is 120 and green is 0
    contrast (120, 0);
    //ends if statement
  }
  //sets up if statement for if c is pressed
  if (key == 'c') {
    //tells program that if c is pressed, set the stroke to 1
    stroke(255);
    //tells program that if c is pressed, run the contrast function when red is 120 and green is 0
    contrast (120, 0);
    //ends if statement
  }
  //ends color contrast
}

//makes a custom function named contrast with the arguments red and green
void contrast (float red, float green) {
  //sets up a for loop involving integer i, starting at i=0, going until i hits 500, increasing i by 10 each time
  for (int i = 0; i <= 500; i = i+10) {
    //sets the fill to red, green, i/2 (whatever you enter for red, whatever you enter for green, and the current amount of i divded by 2)
    fill(red, green, i/2);
    //draws a bunch of rectangles with the for loop that have the current i as their x coordinate, y as 0, a wdith of 10, and a height of 100
    rect(i, 0, 10, 500);
    //ends the for loop
  }
  //sets the fill to red, green, 250/2 (whatever you enter for red, whatever you enter for green, and blue at 250/2 always)
  fill(red, green, 250/2);
  //draws one rectangle starting at 30,200 with a width of 450 and a height of 100
  rect(30, 200, 450, 100);
  //ends custom function contrast
}



