
PImage img;
PImage img2;
PImage img3;
PImage img4;
 
void setup(){
  smooth();
  img = loadImage("moderntwist.jpg");
  img2 = loadImage("sofadackel.png");
  img3 = loadImage("laufenderdackel.png");
  img4 = loadImage("springenderdackel.png");
  size(550,413);
 
}
 
void draw(){
image(img,0,0);
image(img3,mouseX,337);
   
if(mousePressed){
image(img4,185,290);
}else{
image(img2,235,290);
}
 
 
}   


