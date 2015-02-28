
/*Marquee tile image - based on the myPic dot filter,
but utilizing rectangles instead of circles. Plus, brightness AND
color are both variables in this version.
*/

PImage img;

void setup() {
  size(500,333);
  img = loadImage("Marquee.JPG");
  noStroke();
  smooth();
}

int block = 28;
//changing this number seems to adjust the level of brightness/black block noise in unexpected ways.
void draw(){
  background(25);
  for(int y=block; y<=332; y+=block){
    for(int x=block; x <=499; x+=block){
      
      color blockFill = color(img.pixels[x+(y*500)]);
      //took me some time to figure out that the variable here needed to be 500 rather than 499
      fill(blockFill);
      
      float blockDim = block *(brightness(img.pixels[x+(y*300)])/255);
      rectMode(CENTER);
      rect(x,y,blockDim,blockDim);
      //Some random blockDims in brighter areas (like the blue sky) Only happens in certain block sizes.
      //But I like the effect.
    }
  }
}


