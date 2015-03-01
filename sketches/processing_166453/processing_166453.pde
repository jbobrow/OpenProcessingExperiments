
import processing.video.*;

// Step 1. Declare Movie object
Movie movie; 

void setup() {
  cursor(HAND);
  size(640,368);
  frameRate(25);
  smooth();
  background(0);
  // Step 2. Initialize Movie object
  // Movie file should be in data folder
  movie = new Movie(this, "wave.mov"); 
  
  // Step 3. Start movie playing
  //
}



void draw() {
  
  if (mousePressed == true) {
  //JUST PLAY
    movie.loop();
  movie.read();
  image(movie,0,0);
  //END JP 
    } else {
         //SCRUBBING
  movie.loop();
  // Ratio of mouse X over width
  float ratio = mouseX / (float) width;
  // The jump() function allows you to jump immediately to a point of time within the video. 
  // duration() returns the total length of the movie in seconds.  
  movie.jump(ratio*movie.duration()); 
   movie.read();
  image(movie,0,0);
  //END SCRUBBING

  } 
 
}




