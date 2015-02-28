
PImage img;
//float x=random(620);
//float y=random(388);
float mouseSpeed=0;
float smoothedSpeed=0;
float sizeMultiplier=6;
float minimumSize=20;
float penX=0;
float penY=0;
float ellipseSize=0;
void setup(){
  size(620,388);
  img= loadImage("Calvin and Hobbes.jpg");
  background(255);
}
void draw(){
  mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  //float r= random(50);
  color p=img.get(mouseX,mouseY);
  noStroke();
  fill(p);
  ellipseSize=minimumSize+smoothedSpeed;
  ellipse (penX,penY,ellipseSize,ellipseSize);
  if(key=='f' && keyPressed==true){
    image(img,0,0);}
}



