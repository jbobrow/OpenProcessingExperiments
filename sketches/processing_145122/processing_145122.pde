
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/1249*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

int timer;

void setup(){
  size(640,480);
}

void draw(){
  if (millis() - timer >= 2000) {
    drawTree();
    timer = millis();
  }
}


void drawTree(){
    background(0,0,0,255);
    translate(320,300);
    int depth = 11;
    strokeWeight(depth*1.1);
    stroke(255,255,255,255);
    line(0,200,0,0);
    branch(depth);
}
  
void branch(int depth){
  pushMatrix();                    // store the old state
  rotate(radians(random(0,45)));   // rotate
  subBranch(depth);                // and draw one branch
  popMatrix();                     // go back to old state
  rotate(radians(random(-45,-0))); // rotate the other way
  subBranch(depth);                // and draw another branch
}

void subBranch(int depth) {
  scale(0.8);
  int len = (int) random(0,100);
  translate(0,-len);
  strokeWeight(depth*1.5);
  line(0,len,0,0);
  if(depth == 0) {ellipse(0,0,70,70);}
  if(depth > 0) branch(depth-1);
}


