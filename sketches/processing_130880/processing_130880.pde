
int sqWidth = 50;
int groutWidth = 1;
int dmode = 1;
int gmode = 2;

void setup(){
  size(1000,1000);
  background(#888888);
}

void draw(){
  groutWidth = mouseY/25;
  if(gmode==4){
    background(#FFFFFF);
  }else{
    background(#444444*gmode);
  }
  int numRows = ceil(1000/(sqWidth+groutWidth))+1;
  for(int i=0;i<numRows;i=i+1){
    drawRow(i);
  }
}

void drawRow(int row){
  int yPos = row*(sqWidth+groutWidth);
  int numSq = ceil(1000/sqWidth)+3;
  for(int i = 0;i<numSq;i=i+1){
    if(i%2==0){
      fill(#000000);
    }else{
      fill(#FFFFFF);
    }
    noStroke();
    if(dmode==3){
      int rowd = row%4;
      if(rowd==3){
        rowd=1;
      }
      rect(i*(sqWidth+groutWidth)-((rowd)*mouseX/5)%(2*(sqWidth+groutWidth)),yPos,sqWidth,sqWidth);
    }else if(dmode==2){
      rect(i*(sqWidth+groutWidth)-((row%2)*mouseX/5)%(2*(sqWidth+groutWidth)),yPos,sqWidth,sqWidth);
    }else if(dmode==1){
      rect(i*(sqWidth+groutWidth)-(row*mouseX/5)%(2*(sqWidth+groutWidth)),yPos,sqWidth,sqWidth);
    }
  }
}

void mousePressed(){
  if(mouseButton==RIGHT){
    dmode=dmode+1;
    if(dmode>3){
      dmode=1;
    }
  }else if(mouseButton==LEFT){
    gmode=gmode+1;
    if(gmode>4){
      gmode=0;
    }
  }
}


