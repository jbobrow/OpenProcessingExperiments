
PImage img;
float speed;
PFont font;
float theta;
void setup(){
  size(500,500);
  img=loadImage("nice things.jpg");
  font= loadFont("MalayalamMN-Bold-48.vlw");
}
void draw(){
  imageMode(CENTER);
  speed = 5;
  background(0);
  float scale= map(sin(frameCount/speed),-1,1,1,1.5);
  
  image(img,width/2,height/2, img.width*scale, img.height*scale);
 
 translate(width/2,height/2);
  rotate(theta);
 
imageMode(CENTER);
textAlign(CENTER);
text("Happy New Year!",0,0);
fill(255);
textSize(61);
theta +=0.05;


}



