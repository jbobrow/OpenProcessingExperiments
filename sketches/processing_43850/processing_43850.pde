
/*
  Game thingy ma boab.
*/

Rocket rocket1;

void setup(){
  // canvas setup
 size(600,600); 
 smooth();
 frameRate(60);
 
 rocket1 = new Rocket(height/2, width/2);
}

void draw(){
  background(0);
  rocket1.render();
}

