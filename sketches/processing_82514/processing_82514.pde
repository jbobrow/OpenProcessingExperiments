
PImage img;
int cellsize = 20;
int cols, rows;

void setup(){

  img = loadImage("bg.jpg");
  size(494, 700, P3D);
  cols = width/cellsize+2;
  rows = height/cellsize;
}

void draw(){
  background(255);
  img = loadImage("bg.jpg");
  image(img,0,0);
  loadPixels();
  
 
    for (int i=0; i<cols; i++){
      for (int j=0; j<rows; j++){
        int x = i*cellsize - cellsize/2;
        int y = j*cellsize + cellsize - 1;
        int loc = x + y*width;
        color c = img.pixels[loc];
        float z = (mouseY/(float)height) * red(img.pixels[loc]);

      pushMatrix(); 
      
        translate(x,y,z);
        fill(c);
        noStroke();
        
     beginShape();    
        vertex(-cellsize, -cellsize);
        vertex(0, -cellsize);
        vertex(+cellsize, 0);
        vertex(0, 0);
     endShape();
     
     popMatrix();
      
      }
    }
  }


