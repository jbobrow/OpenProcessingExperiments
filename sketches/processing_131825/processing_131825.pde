
//global variables


void setup() {  //setup function called initially, only once
  size(500, 500);

}

void draw() {  //draw function loops 
    //draw a white ellipse that follows the mouse
    fill(255, 255, 255);
     ellipseMode(CENTER);
     ellipse(mouseX, mouseY, 100, 100);
}

void mouseClicked() {
    //draw a red rectangle when the mouse is clicked
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(mouseX, mouseY, 100, 100);

}
