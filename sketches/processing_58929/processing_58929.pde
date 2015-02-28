
PImage myimage;

void setup(){
size(600,600);
myimage = loadImage("tiny00001.jpg") ;
frameRate(1000);
smooth();
  image(myimage, 0, 0, 600, 600);
}
 
void draw(){
  //image(myimage, 0, 0, 600, 600);
noFill();
stroke(255,40);
bezier(300, 300, mouseX,mouseY, 0, 600,300,300);
bezier(300,300,mouseX,mouseY,600,0,300,300);
bezier(300,300, mouseX, mouseY, 0,0,300,300);
bezier(300,300,mouseX,mouseY,600,600,300,300);

 }

