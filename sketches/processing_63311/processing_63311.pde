
void setup() {
  size(500, 500);
}

void draw() {

  background(50, 150, 250);

  stroke(250);
  strokeWeight(3);
  line(250, 0, 250, 500);

  stroke(250);
  strokeWeight(3);
  line(0, 250, 500, 250); 

  if (mouseX < width/2 && mouseY < height/2) {
    fill(150);
    rect(0, 0, width/2, height/2);
  } /* else {
   fill(0);
   rect(100,0,width/2, height/2);
   }
   
   if (mouseX > width/2 && mouseY > height/2) {
   fill(0);
   rect(100,100,width/2,height/2);
   } else {
   fill(0);
   rect(0,100,width/2, height/2);
   }*/

  if (mouseX > width/2 && mouseY < height/2) {
    rect(250, 0, width/2, height/2);
  }

  if (mouseX > width/2 && mouseY > height/2) {
    rect(250, 250, width/2, height/2);
  }

  if (mouseX < width/2 && mouseY > height/2) {
    rect(0, 250, width/2, height/2);
  }

}
  void keyPressed () {

    saveFrame("shit.png");
  }


