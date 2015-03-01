
PImage b;
int c,j=199,i;
void setup(){
  size(716,716);
  b=loadImage("pipa.jpg");
  noStroke();
}
 
void draw() {
  for(i=0; ++i < mouseX; )
  {
    c+=mouseY;
    c %= width*width;
    fill(b.pixels[c]);
    rect(c % width, c / width,9,9);
  }
  blend(1,1,width-1,width-1,0,0,width,width,1);
}


