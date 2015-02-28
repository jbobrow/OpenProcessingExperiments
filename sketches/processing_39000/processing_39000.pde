
// Pattern by using Function  
// variation of the object under the rule 
void setup () {
  size (400, 400);
  smooth ();
  background (0);
  colorMode (RGB);
  
  //setup back ground here
  stroke (255);
  rectMode (CENTER);
  noFill();
  rect (width/2, height/2, 100, 100);
  line (0, 0, 150, 150);
  line (width, 0, 250, 150);
  line  (0, height, 150, 250);
  line (width, height, 250, 250);
}

void draw () {
  for (int a = 0; a < width; a +=33) {                                              // Didstance among objects 
    for (int b = 0; b < height; b+=33) {       
      lightbulb (a, b);                                                             // Functioned objects 
      noLoop();
    }
  }
}

// Function

void lightbulb (float x, float y) {
  fill (random (width), random (width), random (width), random (width));
  ellipse (x, y, random (30+3), random (30-3));                                    //random color ovals
  fill (random (width), random (width), random (width));  
  ellipse (x, y, 10, 10);                                                          //random color central circles
}


