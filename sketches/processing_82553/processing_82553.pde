
import processing.video.*;

Movie movie;

int cellsize = 5;
int cols, rows;

void setup(){
  size(320, 240, P3D);
  movie = new Movie(this, "cat.mov");
  movie.loop();
  cols = width/cellsize+2;
  rows = height/cellsize;
}

void movieEvent(Movie movie){
  movie.read();
}

void draw(){
  background(255);
//  img = loadImage("bg.jpg");
  image(movie,0,0);
  loadPixels();
  
  if (movie.width>1){
    for (int i=0; i<cols; i++){
      for (int j=0; j<rows; j++){
        int x = i*cellsize;
        int y = j*cellsize;
        int loc = x + y*width;
        color c = movie.pixels[loc];
        float z = (mouseY/(float)height) * green(movie.pixels[loc]);
      pushMatrix(); 
      
        translate(x,y,z);
        fill(c);
        noStroke();
        
     ellipse(0,0,cellsize,cellsize);
     
     popMatrix();
      }

      }
 movie.speed(mouseX/60);
    } 
  }


