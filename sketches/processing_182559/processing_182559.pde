
void setup(){
size(600,600);
}
void draw() {
  if (mousePressed == true) {
    //point(mouseX,mouseY);
    strokeWeight(random(3,13));
    stroke(random(250), random(200), random(200));
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}

void keyPressed() {
  if (key == 's') {
    save("my_drawing.png");
  }
  //if (key == 'b') {
    //background(random(255), random(255), random(255));
    //draw_top_line();
 // }
 // if (key == 'c') {
   // stroke(random(255), random(255), random(255));
   // draw_top_line();
 // }
//}
//void draw_top_line() {
  //  strokeWeight(7);
   // line(0,0, width, 0);
   // strokeWeight(2);
}


