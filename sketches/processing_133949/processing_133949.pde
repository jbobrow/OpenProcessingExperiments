
ClickableRect Rect=new ClickableRect(20,20,70,70);
ClickableRect Rect=new ClickableRect(110,20,70,70);
ClickableRect Rect=new ClickableRect(180,20,70,70);
ClickableRect Rect=new ClickableRect(270,20,70,70);
ClickableRect Rect=new ClickableRect(360,20,70,70);

void setup(){
  size(550,110);
}

void draw(){
  background(50,50,55);
  Rect.draw();
}

void mouseClicked(){
  if(Rect.mouseOver()){
    Rect.countClick();
  }
}

class ClickableRect{
  int[] x0 = new int[5];
  int[] y0 = new int[5];
  int[] w = new int[5];
  int[] h = new int[5];
  int[] counter = new int[5];
  
  public ClickableRect(int[] x = new int[5],int[] y = new int[5],int[] newWidth = new int[5],int[] newHeight = new int[5]){
    w[0] = newWidth[0];
    h[0] = newHeight[0];
    w[1] = newWidth[1];
    h[1] = newHeight[1];
    w[2] = newWidth[2];
    h[2] = newHeight[2];
    w[3] = newWidth[3];
    h[3] = newHeight[3];
    w[4] = newWidth[4];
    h[4] = newHeight[4];
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
