
float r = 150;
float g = 0;
float b = 0;


void setup() {
  size(500, 500);
  background(255);
  smooth();
}
void draw() {
  noStroke();
  fill(r,g,b);
rects();
colorRect();

}
void mouseDragged() {
  stroke((abs(mouseX-pmouseX)), 50, (abs(mouseY-pmouseY)));
  strokeWeight(abs(mouseX-pmouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
void keyPressed() {
  background(255);
}
void colorRect(){
    if (mouseX>width/2){
   r=r+1;
  }else{
    r=r-1;
  }
  if (r>255) {
    r=255;
  } else if (r<0){
  r=0;
  }
    if (mouseX>width/2){
   g=g+1;
  }else{
    g=g-1;
  }
  if (g>255) {
    g=255;
  } else if (g<0){
  g=0;
  }
}
void rects(){
    rect(0, 0, 500, 50);
  rect(0, 100, 500, 5);
  rect(0, 110, 500, 5);
  rect(0, 120, 500, 5);
  rect(0, 300, 500, 50);
  rect(0, 400, 500, 35);
  rect(0, 470, 500, 20);
}


