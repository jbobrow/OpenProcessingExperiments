
int gridSizeX = 50;
int gridSizeY = 70;
void setup () {
  size(640, 360); 
  noStroke();
  frameRate (60);
  background (1, 100, 200);
}
void draw () {
  spideysense ();
  spideyeyes ();
}

void spideysense () {

  for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
      noStroke();
      spideyhead();
      stroke(0, 0, 0);
      line(x, y, width/2, height/2);
    }
  }
}
void spideyhead () {

  for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
   
      ellipse(x-1, y-1, 40, 40);
      fill(random (150,255), random (0), random (0));
      
      
    }
  }
}
    
void spideyeyes (){
for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
  fill(random (255,150));
      ellipse(x-12, y-4, 15, 15);
      ellipse(x+12, y-4, 15, 15);
   
}
  }
}





