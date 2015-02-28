
PImage img0;

int dark = 15;

void setup(){
  size(500,500);
  img0 = loadImage("4.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
}

void draw(){
  image (img0, 0, 0, 500, 500);
  fill(220, 135, 80, dark);
  ellipse (306, 211, 145, 92);
}

void mousePressed(){
  if (mouseX > 300 && mouseX < 450 && mouseY > 165 && mouseY < 257){
    if (mouseButton == LEFT){
      dark += 15;
      if (dark>160){
        dark = 160;
      }
    }
  } 
  if (mouseButton == RIGHT){
    dark = 15;
  }
}

  

