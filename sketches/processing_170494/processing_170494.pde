
//define varables
float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(600, 600); //canvas size to 600 by 600
  background(0); // background color is set to black
  fill(255); //shape’s color is set to white
}

void draw() {
  background(r, g, b); //continuously sets the background to “r”, “g” and “b”
  floatingCircles();  //the function that is defined is called to use

//changes the color when the mouse is in the portion where the x-position is less than 300 and the y-position is greater than 300  
  if (mouseX < 300 && mouseY > 300) {
    r=r+10;
    g=g+10;
    b=b+10;
  } else {
    r=r-10;
    g=g-10;
    b=b-10;
  } 
// sets the max to these numbers and the minimum to 0.
  r = constrain(r, 0, 113); 
  g = constrain(g, 0, 176);
  b = constrain(b, 0, 255);
}

// random colors are provided for the circle when the mouse is pressed
void mousePressed() {
  fill(random(0, 255), random(0, 255), random(0, 255)); 
  floatingCircles();
}

// defines the function for “floatingCircles”
void floatingCircles() {
  ellipseMode(CENTER);
  ellipse(mouseX+70, mouseY-50, 70, 70);
  ellipse(mouseX-70, mouseY-50, 70, 70);
} 

//creates drawings of the trianlges at random places when the key is pressed
void keyPressed() {
  for (int i=0; i<50; i+=10) {
    triangleDrawing(random(0,width/2), random(0,height/2));
  }
}

// x and y is placed wherever the number is defined when it is called
void triangleDrawing(float x, float y) {
  triangle(x,y,x+100,y+200,x+300,y+400); // the first point is where x and y is and then the next two points are just adding however much to the x and y
}

