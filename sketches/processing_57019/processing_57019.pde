
PImage octiimage; 

void setup(){
  size( 500, 500); 
  octiimage= loadImage("octi.jpg"); 
  
}

void draw() {
  tint(140, 89);
  image(octiimage, random(300), random(400), 300, 300); 
  
}

