
class Block {
float x,y,w,h;
int index=0, blockset=0;
  
Block() {
}  
  
void initBlock() {
keypressed();

if (index==1 & blockset==0)
  capture();
if (index==0)
  display();
}


void keypressed() {
if (key=='f' | key=='а'){
  index=1; blockset=0;
}
if (keyPressed==false)
  index=0;

}  

void capture() {
  x=player.x;
  y=player.y;
  w=10;
  h=10;
  blockset=1;
  index=0;


}
  
void display() {
stroke(0,0,255);
fill(255);
rect(x,y,w,h); 
}  
}

