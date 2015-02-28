
ClickableRect Rect=new ClickableRect(20,20,70,70);
ClickableRect Rect2=new ClickableRect(110,20,70,70);
ClickableRect Rect3=new ClickableRect(200,20,70,70);
ClickableRect Rect4=new ClickableRect(290,20,70,70);
ClickableRect Rect5=new ClickableRect(380,20,70,70);
 
void setup(){
  size(470,110);
}
 
void draw(){
  background(50,50,55);
  Rect.draw();
  Rect2.draw();
  Rect3.draw();
  Rect4.draw();
  Rect5.draw(); 
}
 
void mouseClicked(){
  if(Rect.mouseOver()){
    Rect.countClick();
  }
}
 
class ClickableRect{
  int x0,y0,w,h;
  int counter=0;
   
  public ClickableRect(int x,int y,int newWidth, int newHeight){
    w=newWidth;
    h=newHeight;
    setPosition(x,y);
  }
   
  public void setPosition(int x,int y){
    x0=x;
    y0=y;
  }
  public void draw(){
    fill(150,150,50);
    strokeWeight(2);
    if(mouseOver()){
      stroke(200,200,180);
    }else{
      stroke(130,130,130);
    }
    rect(x0,y0,w,h);
    fill(240,240,150);
    textSize(30);
    textAlign(CENTER,CENTER);
    text(counter,x0+w/2,y0+h/2);
  }
  public boolean mouseOver(){
    if(mouseX>=x0&&mouseX<x0+h&&mouseY>=y0&&mouseY<y0+h){
      return true;
    }else{
      return false;
    }
  }
  public void countClick(){
    counter++;
  }
}
