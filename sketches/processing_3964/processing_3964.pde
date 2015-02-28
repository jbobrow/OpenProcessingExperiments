
void setup(){size(400,400);}void draw(){loadPixels();for(int i=0;i<width*height;i++){pixels[i]=color(i*mouseX*mouseX*mouseY*mouseY);}updatePixels();}

