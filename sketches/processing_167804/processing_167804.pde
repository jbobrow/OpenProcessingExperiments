

boolean isMousePressed = false;
float col1;
float col2;
float col3;

void setup(){
  size(500, 500);
  background(255);
  smooth();
  rectMode(CORNER);
  drawButtons(210, 300, 80, 30);
}

void draw(){
}
  void mousePressed(){
    isMousePressed = true;
    drawButtons(210, 300, 80, 30);
  }
  void mouseReleased(){
    isMousePressed = false;
    drawButtons(210, 300, 80, 30);
  }
  


void drawButtons(int myX, int myY, int myWidth, int myHeight){
  if(isMousePressed){
  if(mouseX > myX && mouseX < myX + myWidth && mouseY > myY && mouseY < myY + myHeight){
    fill(0);
    col1 = random(255);
    col2 = random(255);
    col3 = random(255);
    background(col1, col2, col3);
    String color1 = nf(col1, 3, null);
    String color2 = nf(col2, 3, null);
    String color3 = nf(col3, 3, null);
    textSize(20);
    text("R..."+color1, 400, 380);
    text("G..."+color2, 400, 420);
    text("B..."+color3, 400, 460);
  }else{fill(255);}
  }else{fill(255);}
  
  rect(myX, myY, myWidth, myHeight);
  fill(255, 0, 0);
  textSize(25);
  text("Button", 210, 323);
}




