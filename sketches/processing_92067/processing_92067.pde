
float xstart, xnoise, ystart, ynoise;
import processing.opengl.*;

void setup(){
size(600,600,OPENGL);
smooth();
background(00);
xstart = random(200);
ystart = random(200);
}




void draw(){
  

  
  
xstart += 0.01;
ystart += 0.01;

ynoise = ystart;  
  
for (int y = 0; y <= 300; y+=2) {
ynoise += 0.01;
xnoise = xstart;
for (int x = 0; x <= 300; x+=2) {
xnoise += 0.01;



pushMatrix();
translate(width/2,height/2);
translate(-600,-600,-500);


drawbox(x, y, noise(xnoise, ynoise));


popMatrix();




}
}
}

void drawbox (float x,float y,float noiseFactor ){


for (int i = 0; i <=noiseFactor ; i++) {
pushMatrix();

float z = noiseFactor; 
translate(x * noiseFactor*4+i , y * noiseFactor*4 +i, -x+i);
noiseFactor = 3*i;

box (x,y,z);
stroke(200,40);
popMatrix();
fill(20,40);





 }
 

}
