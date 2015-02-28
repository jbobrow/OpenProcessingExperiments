

PImage img;
void setup(){
  size(1000, 800);
  translate (400, 400);
img =loadImage ("toonami.jpeg");
}
void draw(){
  background(0);
  if (mousePressed==true){
image(img,mouseX*2/3,mouseY*2/3);
  }
  else{
    background(0);
  }

}

