
//Final project
//Title: The Tic toc color dance

//Import 'Minim' library files
import ddf.minim.*;


//Global variables
Minim minim;
AudioPlayer tictoc;

void setup () 
{
  size(800, 800);
  background (#211C1C);
  stroke(255);
  strokeWeight(1);
  minim = new Minim (this);
  tictoc = minim.loadFile ("tictoc.wav");
  tictoc.play();
  
}
//Draw
void draw() 
{ 
  stroke(random(255),random(255),random(255));
  strokeWeight(random(100));
  line(400,400, random(800), random(800));
}




