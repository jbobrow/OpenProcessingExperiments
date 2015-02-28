
import netscape.javascript.*;

  
void setup(){
  size(710, 580, P3D);
  background(0);

}

void draw(){
  sphere1(0,0);
}

void sphere1(int x, int y){
  stroke(255, 50);
  translate(100, 100, 0);  //stays in that spot
  rotateX(mouseY * 0.05);  //mouse movement Y
  rotateY(mouseX * 0.05);  //mouse movement X
  fill(random(0,255), random(0,255), random(0,255));  //Disco ball
  sphereDetail(mouseX / 50);
  sphere(50);
  

  stroke(255, 50);
  translate(850, 500, 0);   //moves around
  rotateX(mouseY * 0.05);  //mouse movement Y
  rotateY(mouseX * 0.05);  //mouse movement X
  fill(mouseX * 2, random(0,255), random(0,255));  //other spheres
  sphereDetail(mouseX / 50);
  sphere(50);
}

