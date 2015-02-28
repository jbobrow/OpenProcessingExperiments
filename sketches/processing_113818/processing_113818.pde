
/*Setup function that sets the window to a size of 600x600 pixel
  and starts the function smooth. Background is set to be a 
  random colour*/

void setup(){
  size( 600, 600);
  smooth();
  background( random(250), random(250), random(250) );
}

/*Draw operator, that draws lines in a random position with
  random colours inside the window as long as the program 
  is running */

void draw(){
  line( random(600), random(600), random(600), random(600));
  stroke( random(250), random(250), random(250));
}


