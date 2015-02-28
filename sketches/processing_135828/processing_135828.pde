
PImage pirate, pirate2;
float curScale = 1.0;


void setup(){
  size(900,600);
  noStroke();
  pirate = loadImage("Untitled-4.png");
  imageMode(CORNER);
  pirate2 = loadImage("Untitled-5.png");
  imageMode(CORNER);
}

void draw(){
  background(255,255,255);
  for(int k = 0; k < 50; k++){

  
  for(int i=0; i<82; i++){
  ellipse(50 + i*10, 50 + k*10, 8, 8);
  fill( int(random(200)), int(random(145)), int(random(140)));
  noStroke();
 
   }
  image(pirate, 0, 0, 900, 600);
  }
}
void mouseClicked() {
  image(pirate2, 0, 0, 900, 600);
}
 


