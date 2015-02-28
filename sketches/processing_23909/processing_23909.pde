

 
PImage img;
 
void setup(){
  size(750, 750);
  img = loadImage("letmeout.jpg");
}
 
void draw(){
  float tileCountX = mouseY/20+1;
  float tileCountY = mouseX/400+1;
  float stepX = width/tileCountY;
  float stepY = height/tileCountX;
  for (float gridY = 0; gridY < height; gridY += stepY){
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(img, gridX, gridY, stepX, stepY);
    }
  }
}
 
void keyReleased(){
  if (key=='r' || key=='R') saveFrame(timestamp()+"_##.png");
}
 
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


