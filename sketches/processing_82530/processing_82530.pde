
import processing.video.*;

float rtime = 0.0;
float gtime = 0.0;
float btime = 0.0;
float rspeed = 0.7;
float gspeed = 1.1;
float bspeed = 1.2;

float r, g, b, r2, g2, b2;
 

Movie movie;
 
 
void setup() {
  size(320, 240, P2D);
  movie = new Movie(this, "cat.mov");
  movie.loop();
}
 

void movieEvent(Movie movie) {
  movie.read();
}
 
void draw() {
 
  loadPixels();
  image(movie, 0, 0);
   
  for (int x = 0; x < movie.width; x++ ) {
    for (int y = 0; y < movie.height; y++ ) {
      int loc = x + y*movie.width;
 
    
      
      r = red(movie.pixels[loc]);
      g = green(movie.pixels[loc]);
      b = blue(movie.pixels[loc]);
    
      r2 = (r + rtime) % 255;
      g2 = (g + gtime) % 255;
      b2 = (b + btime) % 255;
      
      movie.pixels[loc] = color(r2, g2, b2); 
      
      
    }
  }
   
   movie.updatePixels();
  
}


