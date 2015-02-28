
int x=25;
int y=400;
int bandera = 1;


void setup(){
 size(800,400);
 background(255,255,255);
 fill(0,150,255);
 frameRate(400);
 }
 
 
 
void draw(){
  background(255,255,255);
  ellipse(x,y-25,50,50);
 
 //primer bote
  if(x<width-25){
    if(bandera==1){
    x = x+1;
    }
  }
  else{
    bandera=0;
  }
    
  if(bandera==0){
    y =y-1;
    if(y<=height-350){
      bandera=2;
    }
  }
  
  if(bandera==2){
    x=x-1;
    if(x==25){
      bandera=3;
    }
  }
  
  if(bandera==3){
    y=y+1;
    if(y==height){
      bandera=1;
    }
  }


//fin void draw
}

