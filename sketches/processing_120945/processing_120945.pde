
PImage img;
int obstacles, gris;
int soleilX = 20;
int soleilY = 20;
int soleilZ = 150;
//int masqueX = 50;
//int masqueY = 80;
int masqueZ = 10;
PVector soleil;
float rapport;

public void setup() {
  size(300,300); 
  noLoop();
  colorMode(RGB, 100);  //0=noir, 50=gris, 100=blanc
  background(100);
  
  rapport = (float)masqueZ/(soleilZ-masqueZ); //bug division int / float
  
  img = loadImage("paris.jpg");
  img.loadPixels();
  obstacles = 0;
  for (int y = 0; y < height; y++) {
    // Loop through every pixel row
    for (int x = 0; x < width; x++) {
      // Use the formula to find the 1D location
      int loc = x + y * width;
      gris = (int)brightness(img.pixels[loc]);
      //println(x + " ; " + y + " ; " + loc + " ; " + gris);
        if (gris < 50) {
        obstacles++;        
      }
    }
  }

}

public void  mouseReleased() {
  redraw();
}

void draw() { 
  background(100);
  PVector[] masque = new PVector[obstacles];
  int i = 0;
  for (int y = 0; y < height; y++) {
    // Loop through every pixel row
    for (int x = 0; x < width; x++) {
      // Use the formula to find the 1D location
      int loc = x + y * width;
      gris = (int)brightness(img.pixels[loc]);
        if (gris < 50) {
        masque[i] = new PVector(x, y, 10);
        i++;        
      }
    }
  }
  
  stroke(100,0,0);
  beginShape(LINES);  //shadow's lines tracing (red)
    for (int j=0; j<obstacles; j++) {
            ombreportee(masque[j]);
      }
  endShape();
  
    
  stroke(0);
  beginShape(POINTS);  //buidings's dot tracing (black pixels)
    vertex(soleilX, soleilY);
    for (int j = 0; j<obstacles; j++) {
      vertex(masque[j].x, masque[j].y);
    }
  endShape();

}


public void ombreportee(PVector ombre) {

  PVector soleil = new PVector(mouseX, mouseY, soleilZ);
  PVector produit = PVector.sub(ombre, soleil);
  PVector projection = PVector.mult(produit, rapport);
  
  vertex(ombre.x, ombre.y);
  vertex(ombre.x + projection.x, ombre.y + projection.y);

}



