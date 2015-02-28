
void setup(){
  size(500,500);
  background(0,0,0);
  smooth();
}
void draw(){
 background(0,0,0);
 stroke(0,255,255);
 int y=0;
 for (int x = 0 ; x < width; x += width/10)
 {
   y+= width/10;
   line(x,0,width,y); 
 } 
}               
