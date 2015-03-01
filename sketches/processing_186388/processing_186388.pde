

PImage foto;
void setup() {
foto = loadImage("cat.jpg");
size(foto.width,foto.height);
noStroke();
colorMode(HSB);
}

  void draw(){
image(foto,0,0);
for(int i = 0;i<50;i++){
  fill(random(180),180,180);
  ellipse(random(width),random(height),25,25);
  
  
}
  }
