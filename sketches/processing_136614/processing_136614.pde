

 PImage img;

void setup() {
  background(0);
  size(398,600);
  img = loadImage("WOMAN.jpg");
}

void draw() {
  //image(img, 0, 0);
  for(int a=0;a<width;a+=10){
  for(int b=0;b<height;b+=10){
  color c=img.get(a,b);
  float brillo=brightness(c);
ellipse(a,b,
  }
}


  }
