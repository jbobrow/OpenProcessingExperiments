

void setup() {
  size(700, 700, P3D); 
}
int value=0;
void draw() {
  if(mousePressed){
fill(0);
rect(325,225,350,50);
rect(370,50,250,200);
fill(120,66,0);
triangle(500,350,450,450,570,450);
//nose
stroke(255,0,0);
fill(255,0,0);
ellipse(370+mouseX/20,325+mouseY/20,25,25);
ellipse(570+mouseX/20,325+mouseY/20,25,25);
//inner eyes
stroke(0);
fill(100,80,20);
rect(500-mouseX/20,530-mouseY/20,25,25);
//teeth
stroke(0);
fill(250,0,0);
rect(470-mouseX/20,510-mouseY/20,25,25);
//teeth
fill(0,200,0);
ellipse(400, 350, 100, 100);
ellipse(600, 350, 100, 100);
//eyes
stroke(255,0,0);
fill(0);
ellipse(500-mouseX/20, 530-mouseY/20, 100, 50);
//mouth
stroke(0);
fill(94,0,155);
ellipse(500,400,350,350);
//head
  }
  stroke(255, 50);
  translate(mouseX, mouseY, 0);
  rotateX(mouseY * 0.02);
  rotateY(mouseX * 0.02);
  fill(mouseX/3, mouseY/3, 100);
  sphereDetail(mouseX / 600);
  sphere(80);
}
void mouseReleased(){
  if(value==0){
    value=25;
  }else{
    value=0;
  }
}
 


