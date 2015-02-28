
int w = 200; //width of canvas
int h = 200; //height of canvas
int c1 = 255; //colour1 = white
int c2 = 255; //colour2 = white
int c3 = 255; //colour3 = white
int c4 =255; //colour4 = white

void setup() {
  size (w,h); //set canvas size
  smooth(); //anti-aliasing
  rectMode(CORNER);
}

void draw() {
    if (mouseX < width/2 && mouseY < height/2) {
    c1 = 0;
    c2 = 255;
    c3 = 255;
    c4 = 255;
    
  } else if (mouseX < width/2 && mouseY > height/2){
    c1 = 255;
    c2 = 255;
    c3 = 0;
    c4 = 255;
    
  } else if (mouseX > width/2 && mouseY < height/2) {
    c1 = 255;
    c2 = 0;
    c3 = 255;
    c4 = 255;
    
  } else if (mouseX > width/2 && mouseY > height/2) {
    c1 = 255;
    c2 = 255;
    c3 = 255;
    c4 = 0;
  }
    
  background(255); //set white background
  fill(c1);
  rect(0,0,width/2,height/2);
  fill(c2);
  rect(width/2,0,width/2,height/2);
  fill(c3);
  rect(0,height/2,width/2,height/2);
  fill(c4);
  rect(width/2,height/2,width/2,height/2);
  
  println("X = " + mouseX + " Y = " + mouseY);
}
