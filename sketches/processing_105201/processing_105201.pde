
void setup(){
size(400,400);
}

void draw(){
  int posX = mouseX;
  int posY = mouseY;
  background(100);
  rectMode(CENTER);
  fill(0);
  stroke(255);
  rect(150,150,100,100);
  rect(150,250,100,100);
  rect(250,150,100,100);
  rect(250,250,100,100);
  
  if (posX <= 200 && posY <=200){
    fill(255);
    rect(150,150,100,100);
  }
  if (posX <= 200 && posY >=200){
    fill(255);
    rect(150,250,100,100);
  }
  if (posX >= 200 && posY <=200){
    fill(255);
    rect(250,150,100,100);
  }
  if (posX >= 200 && posY >=200){
    fill(255);
    rect(250,250,100,100);
  }
}
