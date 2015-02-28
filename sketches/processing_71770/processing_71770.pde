
//something that i entended for this program was for the shapes to loop around individualy
//if anyone has any sugestions for how to work that, the hekp would be apreciated.




float x, y;
float a = 20.0;
float s = 20.0;
float dim = 200.0;
void setup() {
  size(420, 420);
  // Create the font
  textFont(createFont("Times New Roman", 12));
}

void draw() {
  background(0,0,255);
   textAlign(LEFT);
  drawType(width * .01);
  
  x = x + 4;
  
  if (x > width + dim) {
    x = -dim;
  } 
  
  translate(x, height/2-dim/2);
  fill(255);
  ellipse(-dim/2, -dim/2, dim, dim);
  ellipse(210, 210, dim, dim);
  fill(150);
  ellipse(-dim/2, dim-210, dim, dim);
  fill(0,250, 0);
  triangle(-dim/2, -dim/2, -dim/2, dim, dim, dim);
  translate(x, height/2-dim/1);
  fill(120, 0, 120);
  triangle(-dim/2, -dim/2, dim, dim, dim, -dim/2);
  fill(250, 12, 100);
  triangle(-dim/2, -dim/2, -dim/2, dim, dim, dim);
  fill(72);
  translate(x,x);
  ellipse(-dim/2, -dim/2, dim, dim);
  triangle(-dim/2, dim, -dim/2, dim, -dim/2, dim);
 

  translate(x, -x);
  fill(0);
  rect(-dim/2, -dim/2, dim, dim);
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s);
    fill(0,200, 0);
  rect(0, 0, 50, 50);
 
}


void drawType(float x) {
  fill(0);
  text("Windows ", x, 24);
  text("An error has occurred. To continue: ", x, 50);
  text("Press Enter to return to Nova, or ", x, 66);
  text("Press CTRL+ALT+DEL to restart your computer. if you do this, ", x, 82);
  text("you will lose any unsaved information in all open applications. ", x, 100);
  text("Error: 0E : 016F : BFF9B3D4 ", x, 124);
  text("Press any key to continue ", x, 150);
  text("something that i entended for this program was for the shapes to loop around individualy", x, 380);
  text("if anyone has any sugestions for how to work that, the hekp would be apreciated.", x, 400);
}

