
int y=0;
int x=0;
void setup(){
  size(400,400);
  background(0);
  frameRate(7);
}
void draw(){
   stroke(255);
   line(0,y,width,y);
  //increment Y
  y += 10;
  x += 10;
  

}




