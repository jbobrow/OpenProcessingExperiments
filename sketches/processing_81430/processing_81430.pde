
PImage img0;

int dark = 15;

void setup(){
  size(400,400);
  img0 = loadImage("5.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
  noCursor();
}

void draw(){
  image (img0, 0, 0, 400, 400);
  fill(170, 85, 30, dark);
  noStroke();
  ellipse (245, 173, 112, 65);
  strokeWeight(3);
  stroke(30, 30, 0);
  line(mouseX+15, mouseY-5, mouseX-10, mouseY+5);
  line(mouseX-15, mouseY-8, mouseX+11, mouseY+7);
  line(mouseX-15, mouseY-3, mouseX+13, mouseY+3);
  line(mouseX+5, mouseY-10, mouseX-5, mouseY+8);

}

void mousePressed(){
  if (mouseX > 170 && mouseX < 300 && mouseY > 130 && mouseY < 220){
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

  

