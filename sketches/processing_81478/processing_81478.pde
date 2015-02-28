
int x;
PImage i;
void setup(){
  size(800,800);
  i=loadImage("blackhole.jpg"); 
}
void draw(){
  if(x==0){
    image(i,0,0,825,825);
  }
  if(mousePressed){
    image(i,0,0,random(785,825),random(785,825));
    tint(255,255,255,100);
    x++;
  }
  if(!mousePressed){
    x=0;
  }
}
