
void setup(){
  size (600,600);
  noCursor ();
  
}
 
void draw(){
loadPixels ();
for (int i = 0; i < pixels.length; i++){
    pixels[i] = color(random(255), random(255), 255);
}
updatePixels();
}

