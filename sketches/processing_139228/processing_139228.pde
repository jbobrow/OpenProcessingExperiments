
int AnzahlRechtecke=5;
 
ClickableRect[] Rechtecke=new ClickableRect[AnzahlRechtecke];
 
void setup(){
  size(310,110);
  for(int index=0;index<AnzahlRechtecke;index++){
      Rechtecke[index]=new ClickableRect(10+60*index,10,50,50);
  }
  Rechtecke[AnzahlRechtecke-1].setColor(200,120,140);
  }
 
void draw(){
  background(50,50,55);
 
  for(int index=0;index<AnzahlRechtecke;index++){
            Rechtecke[index].draw();
  }
    for(int index=0;index<AnzahlRechtecke;index++){
        int newHeight = Rechtecke[index].counter;
      if(Rechtecke[index].counter==0){
          newHeight=50;
      }
      Rechtecke[index].setHeight(newHeight);}
  
  for(int k=0;k<AnzahlRechtecke;k++){
      Rechtecke[k].setColor(200,120,140);
  }
  
  int mostClicks=0;
  for(int i=0;i<AnzahlRechtecke;i++){
      if(Rechtecke[i].counter>Rechtecke[mostClicks].counter){
          mostClicks=i;
      }
  }
  Rechtecke[mostClicks].setColor(200,0,0);
    
  
  
  
}
 
void mouseClicked(){
  for(int index=0;index<AnzahlRechtecke;index++){
      if(Rechtecke[index].mouseOver()){
          Rechtecke[index].countClick();
      }
  }
}
 
class ClickableRect{
  int x0,y0,w,h;
  int counter=0;
  color hinterGrundFarbe=color(0,0,200);
   
  public ClickableRect(int x,int y,int newWidth, int newHeight){
    w=newWidth;
    h=newHeight;
    setPosition(x,y);
  }
   
  public void setPosition(int x,int y){
    x0=x;
    y0=y;
  }
   
  public void setColor(int r,int g,int b){
      hinterGrundFarbe=color(r,g,b);
  }
   
  public void draw(){
    fill(hinterGrundFarbe);
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
