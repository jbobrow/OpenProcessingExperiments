
void setup(){
  size(200,200);
}
void draw(){
  stroke(0);
     fill(mouseX, 5, mouseY, 5);
for (int i = 0; i < 200; i += 20) {

    bezier(mouseX-(i/2.0), mouseY-(40+i), 41, 20, 44, 30, 24-(i/16.0), 30+(i/8.0));
  fill(mouseX, 2, mouseY, 5);
  ellipse(mouseX, mouseY, 60,60);
  ellipse(10,10,10,10);
  ellipse(mouseX,mouseY,60,60);
  ellipse(5,5,5,5);

  }
}
