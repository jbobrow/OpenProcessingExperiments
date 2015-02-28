
int x1;
int y1;
int kolor = 255;

void setup(){
  size(700,350);
  background(25);
  smooth();
  ellipseMode(CENTER);
}


void draw(){
}

void mousePressed(){
    if (mouseButton == LEFT) { 
      stroke (kolor);
    line (x1, y1, mouseX, mouseY);
    x1=mouseX;
    y1=mouseY;
  } else if (mouseButton == RIGHT){
      kolor -= 40;
        if(kolor>255){
          kolor = 0;
        }
    } 
}

void mouseReleased(){
  if (mouseButton == LEFT) { 
      stroke (kolor);
      noFill();
      ellipse(mouseX, mouseY, 10, 10);
  } else if (mouseButton == RIGHT){
    stroke(25);
}
}

void keyPressed(){
  if (key == ' '){
    fill(25);
    noStroke();
    rect(0,0, width, height);

  }
}

