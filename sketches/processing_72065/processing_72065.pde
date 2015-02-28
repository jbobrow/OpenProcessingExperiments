
// Assignment 02
 // Name:        Anisa Ali Salat
 // E-mail:      asalat@brynmawr.edu
 // Course:      CS 110 - Section 001
 // Submitted:   9/25/2012
 // description: Design of an interactive sketch that has;
 // a random background using iteration and randomness,
 // redrawal of backgound with key presses and with an object that
 // changes in size when the mouse is clicked.
  

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

float s;

  
  void setup() {    
    size(500,500);    
    drawBackground();
  }


  void draw() { /* remains empty */ }


  void mousePressed() {
  
  s = random (70,100);
  fill(mouseX, 0 , mouseY);
  strokeWeight(7);
  stroke (0);
  ellipse(mouseX, mouseY, s, s);
  //eyes
  fill (mouseX,0,mouseY);
  ellipse(mouseX-13, mouseY-20 , s *(0.1), s *(0.3));
  fill (mouseX,0,mouseY);
  ellipse(mouseX+13, mouseY-20 , s *(0.1), s *(0.3));
  //bezier
  fill (255);
  stroke (0);
  bezier(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY, mouseX, mouseY);

  }



  void keyPressed() {
    // Call the drawBackground() method
    drawBackground ();
  }


  // clear the entire image and redraw the background
  void drawBackground() {
    // Each time through draw(), new random numbers are picked for a new ellipse.
    // Use values to draw an ellipse
  for (int i = 0; i < 1000; i++) {
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    x = random(width);
    y = random(height/1.5,height);
    noStroke();
    fill(r,g,b,a);
    ellipse(x,y,10,10);}

    {fill (r);
    noStroke ();
    rect (0,250,150,80);}
    {fill (b);
    noStroke ();
    rect (150,180,200,150);}
    {fill (g);
    noStroke ();
    rect (280,100,250,230);
  }
  fill (r,g,b,a);
  ellipse (250,250,x,y);
  }
