
//import processing.video.*;
//MovieMaker mm;

int p=10;
//int l=1;

void setup(){
  size(280,280,P2D);
  frameRate(3);
//  mm = new MovieMaker(this, width, height, "BB_barcode.mov",
//                     3, MovieMaker.ANIMATION, MovieMaker.HIGH);
}

void draw(){
  background(255);
  //pixels aleatorios
  noStroke();
  for(int i=p; i<height-p; i+=p){
    for(int j=p; j<width-p; j+=p){
      int c=int(random(0,2));
      fill(255*c);
      rect(j, i, p, p);}}
  
  //invader
  int rx=int(random(5,19));
  int ry=int(random(3,22));
  int x=rx*p;
  int y=ry*p;
  fill(255,0,0);
  rect(x,y,p,p);
  rect(x+2*p,y,p,p);
  rect(x-p,y+p,5*p,3*p);
  rect(x-2*p,y+4*p,7*p,p);
  for (int i=x-2*p;i<=x+5*p;i+=2*p){
    rect(i,y+5*p,p,p);}
  fill(255);
  rect(x,y+2*p,p,2*p);
  rect(x+2*p,y+2*p,p,2*p);
  
  //3 cuadros que siempre estan
  fill(0);
  rect(p,p,6*p,6*p);
  rect(width-7*p,p,6*p,6*p);
  rect(p,height-7*p,6*p,6*p);
  rect(p*20,p*20,4*p,4*p);  
  fill(255);
  rect(2*p,2*p,4*p,4*p);
  rect(width-6*p,2*p,4*p,4*p);
  rect(2*p,height-6*p,4*p,4*p);
  rect(p*20+p/2,p*20+p/2,3*p,3*p);  
  fill(0);
  rect(3*p,3*p,2*p,2*p);
  rect(width-5*p,3*p,2*p,2*p);
  rect(3*p,height-5*p,2*p,2*p);
  rect(p*21+p/2,p*21+p/2,p,p);
//  l++;
//  mm.addFrame(); 
//  if (l==30){mm.finish();}  
}
  
  


