
void setup(){size(800,800);}void draw(){loadPixels();for(int i=1;i<width*height-1;i+=random(1000))pixels[i]=pixels[i-1]+pixels[i+1];updatePixels();}


