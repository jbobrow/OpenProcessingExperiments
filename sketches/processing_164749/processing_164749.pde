
float[] xCoord = new float[500];
float[] yCoord = new float[500];
float[] speed = new float[500];
void setup(){
size(800,800);
for(int i = 0; i < 500; i++){
xCoord[i] = random(width);
yCoord[i] = random(height);
speed[i] = random(2,6);
}
}
 
void draw(){
background(0);
for(int i = 0; i < 200; i+=1){
stroke (random(255),random(255),random(255));
   float d = dist(mouseX, mouseY,xCoord[i],yCoord[i]);
      d = d/8;
  strokeWeight(d);
 point(xCoord[i], yCoord[i]);
yCoord[i] += speed[i];
if (yCoord[i] > height){
  yCoord[i] = 0;
}
}
}
