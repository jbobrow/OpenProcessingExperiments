
void setup(){
 smooth(); 
}


void draw() {
  if (mousePressed == true) {
    //point(mouseX,mouseY);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("giuliabella-######.png");
  }
  if (key == 'b') {
    background(random(255), random(255), random(255));
    draw_top_line();
  }
  if (key == 'l') {
    stroke(random(255), random(255), random(255));
    draw_top_line();
  }
}
void draw_top_line() {
    strokeWeight(7);
    line(0,0, width, 0);
    strokeWeight(2);
}

