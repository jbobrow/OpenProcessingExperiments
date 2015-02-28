

PImage imagen;
int cellsize = 5;
int columns, rows;


void setup(){
 size(800, 600, P3D); 

   imagen =loadImage ("1.jpg");
    columns = imagen.width / cellsize;
   rows = imagen.height / cellsize;
   }
void draw(){
background(0);  
   for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
       int x = i*cellsize + cellsize/2;
       int y = j*cellsize + cellsize/2;
        int loc = x + y*imagen.width;
        color c = imagen.pixels[loc];
         float z = (mouseX / float(width)) * brightness(imagen.pixels[loc]) - 20.0;

 pushMatrix();
      translate(x + 1, y + 2, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
       rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
   }

}




