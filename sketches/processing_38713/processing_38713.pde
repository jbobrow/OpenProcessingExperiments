
void setup() {
  size(480,120);
  smooth();
}

void draw(){
  if (mousePressed){
    fill(200);
  }else{
    fill(80);
  }
  rect(mouseX,mouseY,50,90);
}

