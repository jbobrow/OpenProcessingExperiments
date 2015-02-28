
color Blue = color(12,103,175,75);
color Red = color(188,28,13,75);
color Purple = color(120,62,137,75);
color Green = color(82,118,67,75);

void setup(){
  size(400,400);
  pictureFrame();
  mousePressed();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

float frameOutterWidth = 300;
float frameOutterHeight = 200;
float frameInnerWidth = 250;
float frameInnerHeight = 150;

void pictureFrame(){
  background(225);
  fill(225);
  if(frameOutterWidth > frameInnerWidth && frameOutterHeight > frameInnerHeight){
    rect(width/2,height/2,frameOutterWidth,frameOutterHeight);
    rect(width/2,height/2,frameInnerWidth,frameInnerHeight);
  }
  else{
    println("Inner Frame Should not be bigger than Outter Frame");
  }
}

void draw(){
}

void keyPressed(){    
    if(key == CODED){
      if (keyCode == UP){
        frameOutterHeight++;
        pictureFrame();
      }
      else if(keyCode == DOWN){
        frameOutterHeight--;
        pictureFrame();
      }
      else if(keyCode == RIGHT){
        frameOutterWidth++;
        pictureFrame();
      }
      else if(keyCode == LEFT){
        frameOutterWidth--;
        pictureFrame();
      }
    }
    if(key == 'w' || key == 'W'){
      frameInnerHeight++;
      pictureFrame();
    }
    else if(key == 's' || key == 'S'){
      frameInnerHeight--;
      pictureFrame();
    }
    else if(key == 'd' || key == 'D'){
      frameInnerWidth++;
      pictureFrame();
    }
    else if(key == 'a' || key == 'A'){
      frameInnerWidth--;
      pictureFrame();
    }
  
    if(key == 'b' || key == 'B'){
      fill(Blue);
      mousePressed();
    }
    else if(key == 'r' || key == 'R'){
      fill(Red);
      mousePressed();
    }
    else if(key == 'p' || key == 'P'){
      fill(Purple);
      mousePressed();
    }
    else if(key == 'g' || key == 'G'){
      fill(Green);
      mousePressed();
    }
    
}

void mousePressed(){
  if(mouseButton == LEFT) {
    ellipse(mouseX,mouseY,25,25);
  }
  if(mouseButton == RIGHT){
    rect(mouseX,mouseY,10,10);
  }
}


      

