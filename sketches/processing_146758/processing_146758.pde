
/* Concept: Boiling pot. Created from scratch by Fatima Zahrah Rashid for Interactivity 1. 
Uses variables, custom shapes, mouse location, key strokes, mouse 
clicks and the random feature.*/ 

float r = 0; // variable for red colour for bubbles
float g = 0; // variable for green colour for bubbles
float b = 0; // variable for blue colour for bubbles
float z = 255; // variable for alpha for bubbles
float t = 50; // variable for bubble size
float a = 20; // variable for bubble size
float c = 25; // variable for bubble size
float d = 30; // variable for bubble size
float e = 35; // variable for bubble size
float f = 40; // variable for bubble size
float h = 45; // variable for bubble size
float i = 50; // variable for bubble size
float j = 55; // variable for bubble size
float ra = 255; // variable for red colour for pot
float ga = 0; // variable for green colour for pot
float ba = 0; // variable for blue colour for pot

void setup() {
  size (400,600);
  smooth();
  stroke(0,100);
  frameRate (20);  
}


void draw() {
  fill(0);
  rect(0,0,width,height); // background
  fill (50,40,40);
ellipse (width/2,400, 200, 50); // top of pot
  
  fill(r,g,b,z); // bubble colour
    ellipse(random (100,300),random (0,450), a, a); //bubbles
    ellipse(random (100,300), random (0,450), c, c); //bubbles
    ellipse(random (100,300), random (0,450), d, d); //bubbles
    ellipse(random (100,300), random (0,450), e, e); //bubbles
    ellipse(random (100,300), random (0,450), f, f); //bubbles
    ellipse(random (100,300), random (0,450), h, h); //bubbles
    ellipse(random (100,300), random (0,450), i, i); //bubbles
    ellipse(random (100,300), random (0,450), j, j); //bubbles

  if(mouseX<width/2 && mouseY>height/2) { // make bubbles red 
                                          // and grow if mouse is on the left
     r = 255;
     b = 0;
     z = 255;
     a += 1;
     c += 1;
     d += 1;
     e += 1;
     f += 1;
     h += 1;
     i += 1;
     j += 1;
  }
  else if (mouseX>width/2 && mouseY>height/2) { // make bubbles blue and
                                          // shrink if mouse is on the right
     r = 0;
     b = 255;
     z = 255;
     a -= 1;
     c -= 1;
     d -= 1;
     e -= 1;
     f -= 1;
     h -= 1;
     i -= 1;
     j -= 1;
  }
      else if (mouseY<height/2) { // if mouse is above width/2, no bubbles, 
                                  // and burner goes off
     z = 0;
  }
  
  if(a>100) { // bubbles don't go bigger than 100 
     a = 100;
  }
  if (a<0) { // bubbles don't go smaller than 0
     a = 0;
  }
  if(c>100) { // bubbles don't go bigger than 100
     c = 100;
  }
  if (c<0) { // bubbles don't go smaller than 0
     c = 0;
  }
  if(d>100) { // bubbles don't go bigger than 100
     d = 100;
  }
  if (d<0) { // bubbles don't go smaller than 0
     d = 0;
  }
  if(e>100) { // bubbles don't go bigger than 100
     e = 100;
  }
  if (e<0) { // bubbles don't go smaller than 0
     e = 0;
  }
  if(f>100) { // bubbles don't go bigger than 100
     f = 100;
  }
  if (f<0) { // bubbles don't go smaller than 0
     f = 0;
  }
  if(h>100) { // bubbles don't go bigger than 100
     h = 100;
  }
  if (h<0) { // bubbles don't go smaller than 0
     h = 0;
  }
  if(i>100) { // bubbles don't go bigger than 100
     i = 100;
  }
  if (i<0) { // bubbles don't go smaller than 0
     i = 0;
  }
  if(j>100) { // bubbles don't go bigger than 100
     j = 100;
  }
  if (j<0) { // bubbles don't go smaller than 0
     j = 0;
  }

stroke(r,g,b,z); // the burner
noFill();
 ellipse(width/2,550, 170, 41); // the burner
 ellipse(width/2,550, 190, 45); // the burner
 ellipse(width/2,550, 210, 49); // the burner
noStroke();
fill(ra,ga,ba); // the pot
 ellipse(width/2,550, 150, 37);
 beginShape(); // the pot
  vertex(125, 550); 
  vertex(100, 400);
  vertex(300, 400);
  vertex(275,550);
    endShape();
 }

void mouseClicked(){ // change colour of pot if mouse is clicked
ra = random(0,255);
ga = random(0,255);
ba = random(0,255);
}



