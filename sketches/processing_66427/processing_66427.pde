
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/66414*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

PFont font;
  
void setup(){
  size(400,400);
  font = loadFont ("Cracked-48.vlw");
}

void draw(){
  background(255);
  fill(0);
  stroke(0);
  text("Don't put your mouse in the box", 100, 200);
  
  noFill();
  rectMode(CENTER);
  rect(200, 275, 30, 30);
  
  if (mouseX >= 185 && mouseX <= 215 && mouseY >= 260 && mouseY <= 290){
    background(0);
    fill(255);
    textFont(font);
    text("You have failed.", 86, height/2);
    noLoop();
  }
}

