
void setup (){
  size(500,500);                              // setting the canvas size
  noFill();                                   // taking the fill ouut of the object
  smooth();                                   // setting the stroke to smooth
}

void draw(){
}
void mousePressed(){                          // when you press the mouse it draws a music note
  strokeWeight(random(10));                   // setting the stroke weight to random to a thickness of 10
  
  note((int)random(455),(int)random(455));    // making the note appear randomly on canvas
}

void note (int x, int y){                     
  fill(random(255),random(255),random(255));  // setting the color to random
  rect(75+x,10+y,2,100);                      // left vertical bar
  ellipse(50+x,100+y,50,50);                  // first circle (left side)
  rect(75+x,10+y,75,2);                       // horizontal bar
  rect(150+x,10+y,2,100);                     // right vertical bar
  ellipse(125+x,100+y,50,50);                 // second circle (right side)
  }
  
void keyPressed(){                            // taing a screen shot
  save("screenshot.png");                     // saving the screenshot
}

