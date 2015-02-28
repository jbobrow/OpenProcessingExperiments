
import processing.opengl.*;
float rY = 0;
float i;
int r;
float p;

void setup(){
  size(600,600,OPENGL);
  background(255);
  smooth();
  noFill();
  frameRate(30);
  stroke(150,100);
  rectMode(CENTER);
}
void draw(){
//  if (keyPressed){
//    translate(300,300);
//    rotateX(map(mouseY, 0, height,-PI, PI));
//      rotateY(map(mouseX, 0, width, -PI, PI));
//ellipse(300,300,r,r);
//    r=150;
//   r=r-1;
     
//  }
  if (mousePressed) {
    if (mouseButton == LEFT) {
    translate(300,300);
    rotateX(map(mouseY, 0, height,-PI, PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
ellipse(0,0,300,300);
ellipse(0,0,200,200);
ellipse(0,0,100,100);


   
    }
    
   

}
 if (keyPressed){
  if ((key == 'a') || (key == 'A')){
        background(255);
  }

  }

  


}

//void mouseReleased() {
// 
// translate(300,300);
//
//      rotateX(map(mouseY, 0, height,-PI, PI));
//      rotateY(map(mouseX, 0, width, -PI, PI));
//      
//}

