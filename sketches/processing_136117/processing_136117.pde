
int AnzahlRechtecke=5;

ClickableRect[] Reschtecke=new ClickableRect[AnzahlRechtecke];

void setup(){
  size(310,110);
  for(int index=0;index<AnzahlRechtecke;index++){
      Reschtecke[index]=new ClickableRect(10+60*index,10,50,50);
  }
  
  }

void draw(){
  background(50,50,55);

  for(int index=0;index<AnzahlRechtecke;index++){
      Reschtecke[index].draw();
  }
}

void mouseClicked(){
  for(int index=0;index<AnzahlRechtecke;index++){
      if(Reschtecke[index].mouseOver()){
          Reschtecke[index].countClick();
      }
  }
}

class ClickableRect{
  int x0,y0,w,h;
  int counter=0;
  color hinterGrundFarbe=color(255,0,0);
  
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
    for(int c=0; c<5;c++){
     Reschtecke[c].setColor(0,0,200);
    } 
    
    for(int i=0; i<4;i++){

for(int j=i+1;j<5;j++){

//Vergleiche Array[i] mit Array[j]!

if(Reschtecke[i].counter==Reschtecke[j].counter){

Reschtecke[i].setColor(255,0,0);

Reschtecke[j].setColor(255,0,0);

} 

}

} 
  }
}
