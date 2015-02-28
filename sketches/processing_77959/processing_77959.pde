

String [] firstWords = {
  "cool", "wise","nerd","passionate", "creative", "fancy", "words", "stuff", "yea", "idk", "more", "HALO!", "xbox", "adventure", "designer", "student", "employee", "blah","humble", "adjective" };
 
 PFont fontA;
PImage img;      
int cellsize = 1; 
float columns, rows; 
void setup() {
  size(700, 700, P3D); 
  img = loadImage("Xbox.png");  
  columns = img.width / cellsize; 
  rows = img.height / cellsize; 
fontA = loadFont("CourierNew36.vlw");
textFont(fontA, 1);
noLoop();
}

void draw() {
  background(0);
  
  char letter;
  String word1 = firstWords[int(random(firstWords.length))];
 

  for ( int i = 0; i < columns; i++) {

    for ( int j = 0; j < rows; j=j+1) {
      int x = i*cellsize + cellsize/2;  
      int y = j*cellsize + cellsize/2;  
      int loc = x + y*img.width;  
      color c = img.pixels[loc];  
      
      float z = (mouseX / float(width)) * brightness(img.pixels[loc]) + 200.0;
      
      pushMatrix();
      translate(x + 230, y + 250, z+200);
      fill(c, 255);
      noStroke();
      ellipseMode(CENTER);
   text(word1, cellsize, cellsize);
   
      popMatrix();
    
  }
  }
}
void mouseMoved(){
  redraw();}

