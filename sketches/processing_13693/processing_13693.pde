
PImage p,b;
float x,y;
void setup() {
  size (1024,768);
  p = loadImage ("UUMI.png");
  b = loadImage ("outer-space1.jpg");
  background (b);


for(int i =0 ; i<width; i+=p.width){
  println(i);
  for(int j=0; j<height; j+=p.height){
   //rotate(radians(20));
    
    
    image(p, (i), (j));
    filter(POSTERIZE, x+2);
    //filter(DILATE);
  }
  }
}

