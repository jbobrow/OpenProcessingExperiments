
PImage p1; 
PImage p2;
PImage destination; 
color c, c2, newpixel;
int shifter = 600; 

void setup() {
  size(380, 480);
  background(100);
  p1 = loadImage("vis.jpg");
  p2 = loadImage("vis.jpg");
  destination = createImage(width, height, RGB);
}

void draw() {
  p1.loadPixels();
  p2.loadPixels();
  destination.loadPixels();
  shifter ++; 
  if (shifter >= 200) {
    shifter = 2;
  }  
  for (int i = 0; i < p1.width; i ++) {
    for (int j = 0; j < p1.height; j ++) {
      c= p1.get(c, j); 
      c2= p2.get(i, j); 
      if (saturation(c) < shifter) {
        newpixel =  c; //j
      }
      else {
        newpixel =  c2; //i
      }
      destination.set(i, j, newpixel); 
    }
  }
  destination.updatePixels();
  image(destination, 0, 0);
  

}//make gif file-->scripts-->load files--->static
void mouseReleased() {
  saveFrame("visvis.jpg");
}


