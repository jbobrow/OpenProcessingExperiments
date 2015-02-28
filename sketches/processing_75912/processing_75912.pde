
void setup(){
  size(800,800);
  noFill();
  smooth();
  stroke(.1);
}

void draw(){
  background(255);
for(int i = 50; i < 200; i++){
 ellipse(width/2,height/2,i*6,i*6);
}
for(int i= 0; i < 200; i++){
  ellipse(mouseX,mouseY,i*6,i*6);
}
}

  int value = 0;

void mousePressed() {
  if (value == 0) {
    value = 255;
for(int i = 0; i < 100; i++){
  textSize(60);
  text("HELLO",100,70, i*1);
}  
} else {
    value = 0;
  }
}
