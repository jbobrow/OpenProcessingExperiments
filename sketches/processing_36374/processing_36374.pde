
void setup () {
  size(300, 300);
  background(0);
}


int rectA = 0; //this is controlling the direction of the downward animation
int rectB = 0; //this is controlling the direction of the upward animation

void draw () {
  if (mouseY < height/2) { //animation when the cursor is hovering in the top half of the composition
    fill (4, 32, 183);
    rect(width/4-10, rectA, 10, 10);
    rect(width/4, rectA, 10, 10);
    rect(width/4+20, 300+rectB, 10, 10);
    rect(width/4+43, rectA, 10, 10);
    rect(width/4+50, rectA, 10, 10);
    rect(width/4+60, 300+rectB, 10, 10);
    rect(width/4+85, 300+rectB, 10, 10);
    rect(width/4+100, rectA, 10, 10);
    rect(width/4+120, 300+rectB, 10, 10);
    rect(width/4+143, rectA, 10, 10);
    rect(width/4+150, rectA, 10, 10);
    rect(width/4+160, 300+rectB, 10, 10);
    rect(width/4+185, 300+rectB, 10, 10);
    rect(width/4+200, 300+rectB, 10, 10);
    rectA++;
    rectB--;


    if (mouseY > height/2) {  //multiple static compositions when the cursor is hovering in the bottom half of the composition
      rect(width/3, rectA, 10, 10);
      rect(width/3, rectB, 10, 10);
      }
    }
    fill(90, 183, 4); //this keeps the red and green "stop" "go" indicators on top of the animation
    noStroke();
    rect(0, 0, width/6, height/2);
    fill(183, 4, 4);
    rect(0, 150, width/6, height/2);
  }


