
import processing.video.*;

Movie theMov;
Movie theMov2;

void setup()
{
 size(1100, 550);
 theMov = new Movie(this, "kfp.m4v");
 theMov.loop();  //plays the movie over and over
 
 theMov2 = new Movie(this, "ISTA.m4v");
 theMov2.loop();  //plays the movie over and over

}

void draw() { 

image(theMov, 1, 1);  
image(theMov2, 330, 1);
} 

void movieEvent(Movie m) { 
  m.read(); 
} 



