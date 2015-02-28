

import processing.video.*;

// Step 1. Declare Movie object
Movie movie; 


void setup() {
  size(640, 480,P2D);
  
  // Step 2. Initialize Movie object
  // Movie file should be in data folder
  movie = new Movie(this,"05.mov"); 
  frameRate(20);
  movie.loop();
  
}

// Step 4. Read new frames from movie
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {
background(255);
  
  
  pushMatrix();
  scale(0.25);
  
  for(int y = 0; y < 8; y++)
  {
    for(int x = 0; x < 8; x++)
    {
      image(movie, x * 320, y * 240);
    }
  }
 movie.jump(random(0., movie.duration()));
  
  popMatrix();
  
image(movie,0,0);
}

void mousePressed(){
  movie.stop();
}


