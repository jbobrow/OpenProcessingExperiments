
PImage img;

void setup() {
  img = loadImage("foto.jpg");
  size(img.width,img.height);
}

void draw() {
  for(int a =0;a<width;a+=10){
    for(int b =0;b<height;b+=10){
//image(img,0,0);
  color ratas  =img.get(a,b);
  float brillo = brightness(ratas);
  fill(ratas);
  float tam = brillo*0.001*mouseX;
//ellipse(a,b,tam,tam);
stroke(ratas);
strokeWeight(tam);
line(a,b,mouseX,mouseY);
}
  }
}
