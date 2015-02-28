
PImage img;

void setup(){
size(600,600,P3D);
}
float cameraX;
float cameraY;

 
void draw(){
  img=loadImage ("milky.jpg");
 background(img);
 
 cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
   println(cos(cameraX));
  
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);

 translate(width/2,height/2,-100);
  
 
 //mercury
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/6 * 0.05);
 translate(150,0,0);
 fill(126,122,113);
 sphere(10);
 popMatrix();
 
 //venus
  pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/4 * 0.06);
 translate(200,0,0);
 fill(108,56,30);
 sphere(20);
 popMatrix();
 
 // earth
  pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/8 * 0.06);
 translate(250,0,0);
 fill(0,0,255);
 sphere(20);
 popMatrix();
 
 //sun
 pushMatrix();
 noStroke();
 rotateY(frameCount * PI/6 * 0.05);
 fill(255,random (0,255),0);
 sphere (60);
 popMatrix();
 

}


