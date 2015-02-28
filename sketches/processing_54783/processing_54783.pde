
int x=5;
float b=400;

void setup (){
  size(600,600);
  background(255,0,0);
}
void draw(){
  if (mousePressed) {
    fill(255,b,255);
  } else {
    fill(255,0,0);
  }
  textSize(200);
  text("STOP",mouseX,mouseY);
}

