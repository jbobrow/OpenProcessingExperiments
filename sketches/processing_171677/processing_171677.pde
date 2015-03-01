

int numClicked = 0;
float posY;
void setup(){
  size(800, 600);
  posY = height/2;
}

void draw(){
  background(255);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("You clicked the first button " + numClicked + " times.", width/2, posY);
  textSize(10);
  buttonDisplay(10, 20, 150, 100, color(#F02C2C), color(#BF2525), "Click counter");
  buttonDisplay(210, 20, 150, 100, color(#F02C2C), color(#BF2525), "Reset counter");
  buttonDisplay(width - 150, 20, 120, 50, color(#4296FA), color(#285D9D), "Move text up");
  buttonDisplay(width - 150, 80, 120, 50, color(#4296FA), color(#285D9D), "Move text down");
}


void  mousePressed(){
  if(mouseOnButton(10, 20, 150, 100)){
    numClicked++;
  }else if(mouseOnButton(210, 20, 150, 100)){
    numClicked = 0;
  }else if(mouseOnButton(width - 150, 20, 120, 50)){
    posY -= 10;
  }else if(mouseOnButton(width - 150, 80, 120, 50)){
    posY += 10;
  }
}


boolean mouseOnButton(float left_, float top_, float width_, float height_){
  return mouseX > left_ && mouseX < left_ + width_ && mouseY > top_ && mouseY < top_ + height_;
}

void buttonDisplay(float left_, float top_, float width_, float height_, color color1_, color color2_, String caption_){
  rectMode(CORNER);
  if(mouseOnButton(left_, top_, width_, height_)){
    fill(color2_);
  }else{
    fill(color1_);
  }
  rect(left_, top_, width_, height_);
  textAlign(CENTER, CENTER);
  fill(0);
  text(caption_, left_ + width_ / 2, top_ + height_ / 2);
}


