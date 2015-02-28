
void setup(){
  size(1000,600);
  background(255);
  smooth();
}
  void draw(){
 
 for (int x=0; x<width; x+=300){ 
 for (int y=0; y<height; y+=300){
 for (int x1=1000; x1>0; x1-=300){
 for (int y1=1000; y1>0; y1-=300){
 
 stroke (random(196),random(18),random(18));
 line(x,y,x1,y1);
 fill(196,18,18,50);
 ellipse(x,y,x1,y1);
 



 
 }
 }
 }
 }
 }

