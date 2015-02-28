

PImage im;
float xoff;
void setup(){
 size(500,450);

im = loadImage("angel.jpeg");
//im.resize(im.width/2, im.height/2);

}

void draw(){
background(0); 
//image(im, 0, 0, im.width, im.height); 


im.loadPixels();
int incX =constrain(mouseY/20, 4,200);
int incY =constrain(mouseX/20, 4,200);

for(int i=0; i<im.width; i+=incX){
 for (int j=0; j<im.height; j+=incY){
 int pColor =  im.get(i,j);
  float sz = brightness(pColor)/20;
  xoff = xoff + 0.1;
  sz = noise(xoff)+sz;
  fill(pColor);
  noStroke();
  ellipse(i,j, sz, sz);
   
 }//j
}//i


}

