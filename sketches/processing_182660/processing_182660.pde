
float xnoise=0.0;
float ynoise=5.0;
float inc=0.06;

void setup(){
  size(600,600);
  noStroke();
  fill(0);
}

void draw(){
 for (int y=0;y<height;y++){
   for (int x=0;x<width;x++){
     float gray=noise(xnoise,ynoise)*255;
     stroke(gray);
     point(x,y);
     xnoise=xnoise+inc;
   }
   xnoise=0;
   ynoise=ynoise+inc;
 }
}
