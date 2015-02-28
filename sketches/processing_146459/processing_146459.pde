
int posX;
int posY;
int pos2X;
int pos2Y;
int cambioX;
int cambioY;

void setup (){
  size(400,300);
  posX=200;
  posY=150;
  pos2X=100;
  pos2Y=200;
  cambioX=1;
  cambioY=1;
}

void draw(){
  
  if(posY>300){
    cambioY=-1;
  }
  if(posX>400){
    cambioX=-1;
  }
  if(posY<0){
    cambioY=1;
  }
  if(posX<0){
    cambioX=1;
  }
  if(pos2Y>300){
    cambioY=-1;
  }
  if(pos2X>400){
    cambioX=-1;
  }
  if(pos2Y<0){
    cambioY=1;
  }
  if(pos2X<0){
    cambioX=1;
  }

posX=posX+cambioX;
posY=posY+cambioY;
  
pos2X=pos2X+cambioX;
pos2Y=pos2Y+cambioY;
  
  ellipse(posX,posY,5,5);
  ellipse(pos2X,pos2Y,10,10);

}

