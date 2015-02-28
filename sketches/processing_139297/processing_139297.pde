
PImage img;
//float x=random(620);
//float y=random(388);
void setup(){
  size(620,388);
  img= loadImage("Calvin and Hobbes.jpg");
  background(255);
}
void draw(){
  float r= random(50);
  color p=img.get(mouseX,mouseY);
  noStroke();
  fill(p);
  ellipse (mouseX,mouseY,r,r);
  if(key=='f' && keyPressed==true){
    image(img,0,0);}
}



