
PImage img;
void setup() {
  size(1000,1000);
  img = loadImage("juliana.jpg");
  size(img.width,img.height); 
}

void draw() {
  //image(img,0,0);
  for(int a = 0; a<width;a+=50) {
    for(int b= 0; b<height;b+=50) { 
  color elcolor=img.get(a,b);
  float brillo= brightness(elcolor);
  fill(elcolor);
  float tam = brillo*0.0001*mouseX;
  ellipse(a,b,tam,tam );
  stroke(elcolor);
  strokeWeight(tam); 
  
}
  }
}

