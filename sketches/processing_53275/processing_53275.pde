
int mode = 1;
import processing.opengl.*;
//rotateNum, causes cube to rotate, angle = circle that cube orbits around
float x,y,rotateNum,angle;
void setup(){
  size(600,600,OPENGL);
  smooth();
  x = 0;
  y = 0;
  rotateNum = 0;
  
  //mode 2
    noStroke();
  rectMode(CENTER);
  frameRate(30);
  
 

}

void draw(){
  if(mode ==1){
  background(0);
  lights();
  x = sin(radians(angle)) * 50 + width/2;
  y =tan(radians(angle)) * 50 + height/2;
  rotateNum = sin(radians(angle));
  pushMatrix();
    translate(x,300,y);
    //causes cube to rotate cube in the space
    rotateY(rotateNum);
    rotateX(rotateNum);
    box(100);
   popMatrix();
   //keeps cube rotating cuve in circle
   angle++;

  //mode 2 reference: http://processing.org/learning/3d/perspective.html    
 } else if(mode == 2){
    lights();
  background(0);
  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 5.0;
    fill(random(255),random(255),random(255));
  
  }
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  box(45);
  translate(0, 0, -50);
  box(45);
  
} else if(mode == 3){
    background(0);
    for (int i=360; i < height; i+=10) {
    stroke(255); 
    if (i < 200) { 
      stroke(10);
      smooth();
    }
  }
  fill(152, mouseX, 175, mouseY);
 
  fill(pmouseX, random(200), 20, pmouseY);
 
  rect(random(300), random(300), 50, 50);
  imageMode(CENTER);          
  rect(400, 300, 400, 400);
  
    quad(mouseX,mouseY, 300, 200, 600, 300, 63, 310);
  fill(random(255),random(255),random(255),50);
  strokeWeight(5);
}
}


void keyPressed(){
  if(key == '1'){
  mode = 1;
  } else if(key == '2'){
    mode = 2;
    background(0);
  } else if(key == '3'){
    mode = 3;
  }
}


void mousePressed(){
  if (mode == 1) {
    fill(random(255),random(255),random(255));
  }
}


void mouseReleased(){
   if (mode == 2) {
    fill(random(255),random(255),random(255));
   }
}

