
int posX=0;
int posY=0;
int velx=5;
int vely=8;


void setup(){
 size(400,400); 
 posY=height/2;
 posX=0;
}


void draw(){
 background(255);
 
   
   ellipse(posX,posY,50,50);
  posX=posX+velx;
  posY=posY+vely;
  

 //1 border...
 if (posX> width || posX <0){
   velx=velx*-1;
   
}

  if(posY>= height){
    vely=vely*-1;
  }
  
  if(posY<= 0){
    vely=vely*-1;
  }

if(posX>= width){
  velx=velx*-1;

}


}



