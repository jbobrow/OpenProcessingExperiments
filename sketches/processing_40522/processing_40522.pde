
import processing.opengl.*;

int bgc = 255;
int directionX;
int directionY;	
float r = random(0,255);

void setup() {
  size(600, 600, P3D); 
  smooth();
  directionX = 1;
  directionY = 1;
}

//the below code is taken from processing reference on sphere detail
void draw() {
  background(bgc);
  stroke(0);
  translate(300, 300, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 1, 1, 70);
  sphereDetail(mouseX ++);
  
  if(mouseX>width) {
   directionX = +1;
  }
  
  if(mouseY<0){
    directionY = -2; 
  }
   if (mouseX>300){
     stroke(255);
   }
  
   if(mouseY<0){
     stroke(r);
   }
  
  sphere(100);
}

void mouseClicked() {
  if(bgc==255) {
    bgc = (0);
    } else {
    bgc= 255;
  }
  } 
  //if(bgc==0){
    //bgc= (255);
  
  
  
 //not working 
 // if(mouseY< 0) {
   // draw();
     // stroke(0);
      
      //fill(108,137,67);
      //sphereDetail(mouseX - mouseY+1);
      //sphere(40);}
 
  


