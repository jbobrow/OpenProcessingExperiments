
PImage eight;
PImage nine;
PImage ten;
PImage eleven;
PImage noon;
PImage one;
PImage two;
PImage three;
PImage four;

void setup(){
  size(880, 880);
  eight = loadImage("eight.png");
  nine = loadImage("nine.png");
  ten = loadImage("ten.png");
  eleven = loadImage("eleven.png");
  noon = loadImage("noon.png");
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  
}

void draw(){
//  float circleEight;
//  float 
//  image(noon, 0, 0);
//
//  fill(0, 0, 0, 100);
//  circleEight = ellipse(7*width/9, 1.75*height/9, 100, 100);
//  
//  if(mouseX > 
  
  
  if(mouseX < width/9){
    image(four, 0, 0);
  } else if(mouseX > width/9 && mouseX < 3*width/9){
    image(three, 0, 0);
  } else if(mouseX > 2*width/9 && mouseX < 4*width/9){
    image(two, 0, 0);
  } else if(mouseX > 3*width/9 && mouseX < 5*width/9){
    image(one, 0, 0);
  } else if(mouseX > 4*width/9 && mouseX < 6*width/9){
    image(noon, 0, 0);
  } else if(mouseX > 5*width/9 && mouseX < 7*width/9){
    image(eleven, 0, 0);
  } else if(mouseX > 6*width/9 && mouseX < 8*width/9){
    image(ten, 0, 0);
  } else if(mouseX > 7*width/9 && mouseX < width){
    image(nine, 0, 0);
  }
  

}


