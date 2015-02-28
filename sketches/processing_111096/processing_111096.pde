
void setup() {
  size(800, 600);
  background(0);
}

void draw() {

  //top row
  //green circle
  if (( mouseX<= width/4)&&(mouseY<=height/3)) {
    stroke(0);
    fill(0, 100, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //first row
  //red circle
  if ((mouseX>=width/4)&&(mouseX<=width-400)&&(mouseY<=height/3)) {
    stroke(0);

    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  // blue circle
  if ((mouseX>=width/2)&&(mouseX<=width-200)&&(mouseY<=height/3)) {
   stroke(0);

    fill(0, 0, 255);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //yellow circle
  if ((mouseX>=width-200)&&(mouseY<height/3)) {    
    stroke(0);

    fill(255, 255, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //second row
  //purple circle
  if ((mouseX<=width/4)&&(mouseY>=height/3)&&(mouseY<=height-200)) {
    stroke(0);

    fill(160, 32, 240);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //orange circle
  if ((mouseX>=width/4)&&(mouseX<=width-400)&&(mouseY>=height/3)&&(mouseY<=height-200)) {
    stroke(0);

    fill(255, 140, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //pink circle
  if ((mouseX>=width/2)&&(mouseX<width-200)&&(mouseY>height/3)&&(mouseY<=height-200)) {
    stroke(0);

    fill(255, 0, 100);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //gray circle
  if ((mouseX>=width-200)&&(mouseY>=height/3)&&(mouseY<=height-200)) {
    stroke(0);

    fill(100);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //bottom row
  //turquoise
  if ((mouseX<=width/4)&&(mouseY>height-200)) {
    stroke(0);

    fill(0, 250, 154);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //white circle
  if ((mouseX>width/4)&&(mouseX<=width-400)&&(mouseY>=height-200)) {
    stroke(0);

    fill(255);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  //black circle
  if ((mouseX>=width/2)&&(mouseX<=width-200)&&(mouseY>=height-200)) {

    fill(0);
    stroke(255);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
  if ((mouseX>=width-200)&&(mouseY>=height-200)) {

    stroke(0);
    fill(127, 255, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    noStroke();
    ellipse(mouseX+20, mouseY-20, 25, 25);
  }
}
