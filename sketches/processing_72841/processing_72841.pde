
//Robb Godshaw
//Wallpaper

float WW = 20, HH = 20, dia = 12;

void setup() {
  //import processing.pdf.*;
  size (1700, 1100
  //, PDF, "Wallpaper.pdf"
  );
  background(255);
  fill(255, 0, 0); 
  smooth();
  colorMode(HSB);
  noStroke();
}

void draw() {
  for (int x=1; x<width/WW; x=x+1) {
    for (int y=1; y<height/HH; y=y+1) {  
      fill (map(x, 0, width/WW, 0, 255), 255, 255);
      dia = -abs(height/2/HH-y)+10;
      ellipse (x*WW, y*HH, dia, dia);
    }
  }
  //println("Finished.");
  //exit();
}
