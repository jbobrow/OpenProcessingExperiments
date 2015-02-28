
float x=0;
float b=0;
void setup() {
size(1000,1000);
background(0);
colorMode(HSB, 100);
smooth();
noStroke();
}
void draw(){
  float x = map(sin(b)*sin(b*0.2)*sin(b*0.45), -1, 1, 0,width);
  float y = map(sin(b)*sin(b*0.3), -1, 1, 0,height);
 float co=map(sin(b*0.04), -1,1,0,100);
 float sz=map(sin(b*1.8)*sin(b*3.1),-1,1,25,70);
float bright=map(sin(b*1.7)*sin(b*3.1),-1,1, 7,35);
  fill(co,50,bright);
  ellipse(x,y,sz,sz);
  
  x=x+1;
  b=b+0.07;
}


