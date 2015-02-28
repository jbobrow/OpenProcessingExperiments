
float sepMult =2;
PImage img;
void setup() {
img = loadImage("back.jpg");
size(800,300);
smooth();

  //  frameRate(24);
}
void draw()  {
  background(0);
  image(img, 0, 0);
  filter(BLUR, 0.3);
  stroke(255);
  sepMult= sepMult-0.005; 
 for (int i = 0; i<100; i=i+1) {
    line(0, height/2-(i*sepMult), width, height/2-(i*sepMult));
    //  println("i is now="+i );
  }
  for (int i = 0; i<100; i=i+1) {
    line(0, height/2+(i*sepMult), width, height/2+(i*sepMult));
    //  println("i is now="+i );
  }
}




