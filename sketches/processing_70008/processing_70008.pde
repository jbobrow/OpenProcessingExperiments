
import processing.pdf.*;
int x,y;
void setup(){
  size(1024,768,PDF,"wallpaper.pdf");
  background(0);
  smooth();

}

void draw(){
  if (frameCount<2){
    for(x=0;x<width; x++){
      stroke(random(0,255));
      line(x,0,x,height);
    }
    for(y=0;y<height;y+=10){
      for(x=0;x<width;x+=10){
        noStroke();
        pushMatrix();
        translate(x,y);
        rotate(radians(random(0,360)));
        fill(255-noise(0)*random(0,600)%5,255-noise(0)*random(0,200)%5, random(100,150), random(30,50));
        int sz=int(random(-5,50));
        triangle(2,2,20+sz,10,0,20+sz);
        popMatrix();
      }
    }
  }
  exit();
}
