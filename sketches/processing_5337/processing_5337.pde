
int s=400;
PImage b;

void setup(){
size(s,s);
b = loadImage("bg.png");
}

void draw(){
  int f=frameCount;
  image(b, 0, 0);
  for(int i=0; i<s; i++){
    float r=20*noise(abs(sin(i/150.+0.008*f)*i*0.1));
    stroke(r,r,70,f);
    line(1,i,s,i);
  }
}

//BWflow by Oriol Ferrer Mesià, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=3513
//License: http://creativecommons.org/licenses/by-sa/3.0/

