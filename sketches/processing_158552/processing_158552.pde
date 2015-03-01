
PImage imagen;
 
void setup() {
  size(716, 716);
  imagen =loadImage("pipa.jpg");
}
 
void draw() {
 // background(255);
 fill(255,10);
 rect(0,0,width,height);
  tint(255, 126);
 // image(imagen, mouseX, 0, 150, 150);
//  ellipse(imagen,pmauseX,20,20);
  
  for (int i = 0; i < 716; i = i+15) {
    for (int j = 0; j < 716; j = j+15) {
      color elColor = imagen.get(i,j);
      fill(elColor);
      ellipse(i+(mouseX*0.10), j+(mouseY*0.10),10,10);
      ellipse(i+(mouseX*0.5), j+(mouseY*0.5),10,10);
      ellipse(i+(mouseX*0.20), j+(mouseY*0.20),10,10);
      ellipse(i+(mouseX),j,10,10);
    }
  }
}


