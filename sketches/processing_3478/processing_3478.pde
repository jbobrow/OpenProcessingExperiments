

float n=0;void setup(){size(320,180);}void draw(){background(random(0,1)*255);loadPixels();for(int p=0;p<width*height;p++){pixels[p]=color(random(0,noise(n)*255));}updatePixels();n+=0.25;}

