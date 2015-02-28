
int mousePressX;
int mousePressY;
int mouseReleaseX;
int mouseReleaseY;
int flag;
int topCornerX;
int topCornerY;
int botCornerX;
int botCornerY;
color ptColor;
color fillColor=color(255,0,0);

void setup(){
  size(800,800);
  background(255);
  rectMode(CORNERS);
  strokeWeight(5);
}

void draw(){
}

void mousePressed(){
  mousePressX = mouseX;
  mousePressY = mouseY;
}

void mouseReleased(){
  mouseReleaseX = mouseX;
  mouseReleaseY = mouseY;
  action();
}

void keyPressed(){
  if (key == 's' || key == 'S') save ("PietMondrian.jpg");
  else fillColor=color(random(255),random(255),random(255));
}

void action(){
  if(((mouseReleaseX-mousePressX)<5) && ((mouseReleaseY-mousePressY)<5))specialFill();
  else if((mouseReleaseX-mousePressX)>=(mouseReleaseY-mousePressY))line(0,mousePressY,800,mousePressY);
  else if((mouseReleaseY-mousePressY)>=(mouseReleaseX-mousePressX))line(mousePressX,0,mousePressX,800);
}

void specialFill(){
  //loadPixels();
  flag = 0;
  while(flag==0){
    mousePressX--;
    ptColor = get(mousePressX,mousePressY);
    if(ptColor != #FFFFFF){
      topCornerX=mousePressX+1;
      flag=1;
    }
  }
  flag=0;
  mousePressX++;
  
   while(flag==0){
    mousePressY--;
    ptColor = get(mousePressX,mousePressY);
    if(ptColor != #FFFFFF){
      topCornerY=mousePressY+1;
      flag=1;
    }
  }
  flag=0;
  mousePressY++;
  
  while(flag==0){
    mousePressX++;
    ptColor = get(mousePressX,mousePressY);
    if(ptColor != #FFFFFF){
      botCornerX=mousePressX-1;
      flag=1;
    }
  }
  
    flag=0;
    mousePressX--;
    
    while(flag==0){
      mousePressY++;
    ptColor = get(mousePressX,mousePressY);
    if(ptColor != #FFFFFF){
      botCornerY=mousePressY-1;
      flag=1;
    }
  
  }
  strokeWeight(0);
  fill(fillColor);
  rect(topCornerX,topCornerY,botCornerX,botCornerY);     
  strokeWeight(5);
  
}


