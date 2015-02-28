
float posX;
float posY;

void setup () {
  size (500, 500);
  background(15, 11, 142); 
  smooth();
}

void rainDrops (float posX , float posY, float droplet) {
 noStroke();
 fill(255);
  ellipse(posX,posY, droplet, droplet);

}

/*void wiper (   ) {
  strokeWeight (2);
  stroke (7, 7, 25);
  line (mouseX, mouseY, mouseX, mouseY+100);
}
*/

void mouseDragged () {
  //wiper();
  if (posX>mouseX && posX < width || posY>mouseY && posY < height) {
 fill(15, 11, 135);
 rect(mouseX, mouseY, width-mouseX, height-mouseY);

  }
}


void draw() {
 rainDrops (random(width), random(height), random(10));
 if (mousePressed==true) {
 
 
 mouseDragged();

 }
}



