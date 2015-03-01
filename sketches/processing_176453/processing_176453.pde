
 //I got some help from this guy for the video slider:Daniel Shiffman
 // On this website:http://www.learningprocessing.com/examples/chapter-16/example-16-5/
 
import processing.video.*; //import pencilbreak.mov

Movie movie;

void setup() {
  
  size(700,470);
  
  movie = new Movie(this, "pencilbreak.mov");//select this particular movie
  
  movie.play();//play the movie
  
  noStroke();
  
}

void draw() {
  
  float ratio = mouseX / (float) width;   // Ratio of mouse X over width of screen
  
  movie.jump(ratio*movie.duration()); // This makes the position of your mouse the amount of seconds in relation to the ratio
  
  movie.read(); //read and display frame
  
  image(movie,0,0); //position of movie
  
  fill(255,0,0,mouseY/3);
  
  rect(0,0,700,470);
  
}


