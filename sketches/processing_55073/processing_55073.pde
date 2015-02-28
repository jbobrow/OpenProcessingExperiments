
float rad = 0;
int check = 0;

void setup() {
  size(600, 300);
  fill(126);
  background(0);
}
 
void draw() {
 strokeWeight(1);
  translate(mouseX, mouseY);
  rotate(PI*rad);
 if(mousePressed) {
     stroke(random (255), 0, 232);
  } else {
    stroke(255, random(142), 0);
  }

line(0, -66, 0, 66);
 line(-66, 0, 66, 0);
 rad+=0.01;
}

void mouseReleased(){
  if(check==0){
    stroke(random (255), 0, 232);
    check=1;
  } else {
    stroke(255, random(142), 0);
    check=0;
  }
  
}


