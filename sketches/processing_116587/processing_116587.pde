
int xpos = 10; //position of square.
int ypos = 20; //position of square.

void setup() {
  size(800,450);
  background(231,174,83); 
  stroke(255,0,0);
  PFont headerfont;
  headerfont = loadFont("Courier-14.vlw");
  textFont(headerfont);
  text("Processing Workshop 2",10,20);
}

void draw() {
  background(231,174,83); //redraw background each time.
  
  fill(255,255,255, xpos); 
  text("Processing Workshop 2",10,20);
  
  noFill();
  stroke(214,0,0);
//  rect(mouseX,mouseY,20,20); //(position then size)
  rect(xpos,ypos,20,20); //(position then size)
  xpos +=5; //add 5 pixels to position of square each time.
 
  if (xpos > width) {
    xpos=0; 
    ypos +=40;
  }
}
