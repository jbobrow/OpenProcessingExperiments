
int x;
int speed; 

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  noFill();
  x = 200;
  speed = -1;
}
 
void draw() {
}

void mouseReleased() {
  x = 200;
}

void mouseDragged(){
  fill(mouseX/2, 127, mouseY/2);
  ellipse(mouseX, mouseY, 10, 10);
}


void keyPressed(){
  
  switch(key) {
    case'd':
      background(0);
      println("d");
      break;
    case'a':
      noStroke();
      fill(0, 3);
      rectMode(CORNER);
      rect(0, 0, width, height);
      break;
    case'o':  
      if(mousePressed == true) {
        x += speed;
        noFill();
        stroke(mouseX, 127, mouseY, 70);
        ellipse(mouseX, mouseY, x, x);
        if(x <= 0){
         x= 0;
        }
        break;
  }
 }
}




