
/*
Shark Week by Elan Kesilman-Potter
This program adapts the shark from my second assignment to where the user can create a sea of sharks by clicking the mouse on the screen. Once the user has achieved the desired effect, he or she may capture a screenshot. There is also the capability to erase the screen and start over.
*/

//Global variables
color[] bubbles = {#09085D, #7E7DD8, #525281, #1B5ABC, #297BFC};

//Setting up the blank screen per instructions
void setup() {
  size (1000, 600);
  background (#FFFFFF);
  smooth();
}

//Mouse input per instructions
void draw() {
  if(mousePressed){
    stroke(#000000);
    strokeWeight(1);
    fill(#AAAAAA);
    beginShape();
    vertex(mouseX-100, mouseY);
    vertex(mouseX+50, mouseY-50);
    vertex(mouseX+100, mouseY-100);
    vertex(mouseX+125, mouseY-40);
    vertex(mouseX+200, mouseY);
    vertex(mouseX+300, mouseY-75);
    vertex(mouseX+250, mouseY+5);
    vertex(mouseX+275, mouseY+50);
    vertex(mouseX+200, mouseY+10);
    vertex(mouseX+75, mouseY+30);
    vertex(mouseX+25, mouseY+100);
    vertex(mouseX, mouseY+30);
    vertex(mouseX-100, mouseY);
    endShape();
    line(mouseX+25, mouseY, mouseX, mouseY+25);
    line(mouseX+50, mouseY, mouseX+25, mouseY+25);
    line(mouseX+75, mouseY, mouseX+50, mouseY+25);
    stroke(#FFFFFF);
    strokeWeight(3);
    fill(#000000);
    ellipse(mouseX-50, mouseY, 10, 10);
    strokeWeight(random(5)); 
    noFill();
    strokeWeight(int(random (1,5)));
    stroke(bubbles [int(random(0,5))]);
    float x = random(width);
    float y = random(height);
    ellipse(x, y, 50, 50);
  }
}

//Screenshot capture per instructions and ability to erase and start over with keyboard interaction per instructions
void keyReleased(){
  if(key == DELETE || key == BACKSPACE) background(#FFFFFF);
  if(key == 's' || key == 'S') saveFrame("screenshot.png");
}
  


