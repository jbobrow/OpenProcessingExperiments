
PImage foto;
void setup() {
  size(800,600);
  background (255);
  foto = loadImage ("log.jpg");
  
}
void draw() {
  background(255);
  stroke(255);

  fill(frameCount / 2);
  rectMode(CENTER);
  image(foto,50/2,100/2,mouseX+10,mouseY+10);
  // image(foto,width/2,height/2,mouseX+10,mouseY+10);
}

  

