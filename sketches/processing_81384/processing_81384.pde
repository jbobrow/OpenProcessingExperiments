
int startY = 0;
PImage img;
 
void setup() {
  size(400, 267);
  frameRate(10);
  img = loadImage("open.jpg");
}
 
void draw() {
   
  background(255);
  image (img,0,0);
   
  for (int y = startY; y < 70+startY; y += 30) {
    stroke(0);
    strokeWeight(3);
    line(0, y, width, y);
     
  }
  startY += 10;
  if (startY >300){
startY = 0;
}
}


