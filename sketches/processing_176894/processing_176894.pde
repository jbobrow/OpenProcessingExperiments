
PImage cowboy ;
PImage brock ;
int x = 0 ;
int direction = 1 ;

void setup() {
  size(549, 549) ; 
  cowboy = loadImage("cowboy_gun.jpg");
  brock = loadImage("brock_face.JPG");
}


void draw() {
  background(255) ;
  image(cowboy, 0, 0) ;
  image(brock, 200, 20, width/5.5, height/5.5) ;
  fill(#000053) ;
  textSize(20) ;
  text("Cowboy Dan's a major player in the cowboy scene...", x, 500) ;
 
  x = x - 1 ; // move the x either by +1 or -1 
  
  if (x < 0) {  // if x > 100 OR x < 0 
    x = 400 ;  // make the direction opposite!
  }
  
}


