
int px,py,mDX=-1,mDY=-1;
void setup(){
size(500,500);
background(255);
}
void draw(){
  if ((mousePressed==true)&&((5<mouseX)&&(mouseX<495)&&(5<mouseY)&&(mouseY<495))){
      if (mDX>=0){
        strokeWeight(4);
        stroke(0);
        line(px,py,mouseX,mouseY);
      }else{
        mDX=mouseX;
        mDY=mouseY;
      }
      px=mouseX;
      py=mouseY;
  }else{
    mDX=-1;
    mDY=-1;
  }
}


