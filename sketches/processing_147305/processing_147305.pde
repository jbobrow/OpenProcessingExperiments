
import processing.video.*;

// Step 1. Declare Movie object
Movie movie; 

void setup() {
  size(250,190);
  
  // Step 2. Initialize Movie object
  // Movie file should be in data folder
  movie = new Movie(this, "GunFIXED 2.avi"); 
  
  // Step 3. Start movie playing
  movie.loop();
}

// Step 4. Read new frames from movie
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {
  // Step 5. Display movie.
  pushMatrix();
  image(movie,-835,-445);
  popMatrix();
    if (keyPressed && (key=='1')) {
    filter(INVERT);
  }
  if (keyPressed && (key=='2')) {
    filter(GRAY); }
     
  if (keyPressed && (key=='3')) {
    tint(65,69,240); }
     
  if (keyPressed && (key=='4')) {
    tint(240,65,77); }
     
  if (keyPressed && (key=='c')) {
    noTint(); }

}



