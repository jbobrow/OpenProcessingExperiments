
import processing.opengl.*;

int radius = 100;

void setup(){
  size(800, 600, OPENGL);
  background(0);
  // stroke(255);
}

void draw( ) {
  background(0);

  translate(width/2, height/2, 0);
  rotateY(frameCount*0.02);
  rotateX(frameCount*0.02);
  rotateZ(frameCount*0.01);

  float s = 0;
  float t = 0;

  float z = 0;
  float y = 0;

  float lastx = 0;
  float lasty = 0;
  float lastz = 0;

  while(t<1360){
    s+=164;
    t+=2;
    float radianS = radians(s);
    float radianT = radians(t);

    float thisx = 0 + (radius*cos(radianS)*sin(radianT)*4);
    float thisy = 0 + (radius*sin(radianS)*sin(radianT)*4);
    float thisz = 0 + (radius*cos(radianT)*4);

    // println(thisx);
    stroke(random(255),random(255),random(255),200);
    if(lastx != 0){
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }


}

