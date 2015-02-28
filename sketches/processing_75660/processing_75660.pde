
float value = 0;

void setup() {
  size(1200,600);
  background(0);
}

void draw() {

}

void mouseMoved() {
  stroke(255, 0, value);
  line(0, 0, mouseX, mouseY);
  line(1200, 0, mouseX, mouseY);
  stroke(value, 255, 0);
  line(1200, 600, mouseX, mouseY);
  line(0, 600, mouseX, mouseY);
}

void mousePressed(){
 if(value == 0){
   value = 255;
 }
 else{
   value = 0;
 }
}

void keyPressed() {
  if (key == 's') {
    save("omarCheikhali.png");
  }
}
