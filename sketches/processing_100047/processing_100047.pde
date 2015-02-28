
import peasy.*;

PeasyCam cam;

double x, y, xx, yy, zr,zi;
int i;

void setup(){
  size(800, 800, P3D);
  background(0);
  smooth();
  colorMode(HSB);
  cam = new PeasyCam(this, width/2, height/3, 0, 1000);
}

void draw(){
  background(0);
  //camera(0, mouseY*100, 9000, 0, 0, 0, 0, 1, 0);
  translate(0,-300,200);
  for(x=-2.0; x<=2.0; x+=0.005){
    for(y=-1.5; y<=1.5; y+=0.005){
      xx = x;
      yy = y;
      for(i=0; i<16;i++){
        zr = xx*xx-yy*yy+x;
        zi = 2*xx*yy+y;
        xx = zr;
        yy = zi;
        if((zr*zr+zi*zi)>10) break;
      }
      stroke(i*20);
      point((float)x*200+500, (float)y*200+500);
    }
  }
}
  
void keyPressed(){
  if(key == 's'){
    save("mandelbrot.png");
  }
}

