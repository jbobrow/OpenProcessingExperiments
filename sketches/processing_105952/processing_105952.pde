
void setup(){
  size(700,700);
  background(0);
  ellipseMode(RADIUS);
}

void draw(){
  colorMode(HSB,mouseX);
    for(int x=60;x<width;x+=100){ 
    for(int y=60;y<height;y+=100){ 
      fill(x,mouseX,mouseY);
      
      ellipse(x,y,30,30);
    }
  }
}
 

void mousePressed() {
  if (mousePressed == true) {//when mouse is pressed count is reset to draw over sketch
    setup();
  }
}



