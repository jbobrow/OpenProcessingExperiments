
PImage Pic;
void setup(){
  size(500,500,P3D);
 Pic = loadImage("In Ghost Colours.jpg");
  background(255);
  smooth();
  frameRate(10);
}


float cameraX, cameraY;

void draw(){
   background(0);
   rotateY(frameCount*PI/6*0.05);
  camera(-200, 0,200,width/2,height/2,0,0,1,0);

     translate(width/2,height/2,0);
  int x = floor(random(0,Pic.width));
  int y = floor(random(0,Pic.height));
 
    
  color myColor = Pic.get(x,y);

pushMatrix();
 

  fill(myColor);
translate(0,mouseY-200,0);
sphere(60);

translate(-200,mouseY-300,0);
sphere(60);
translate(300,mouseY-100,0);
sphere(60);
 popMatrix();
x+=10;
    }
 





