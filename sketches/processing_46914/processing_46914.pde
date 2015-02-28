
PImage img; 
int x;

void setup(){
  size (610,610);
   img = loadImage("NYAN.jpg");

x = 0;

}



void draw(){
  background(255);
    image(img, x, 300);


if (mousePressed){
x= x +90;
}
if (x>=610){
x = 0;}
}


