
int x=25;
int y=25;

int bandera=1;
int bandera1=1;
 
void setup () {
size (800,400);
smooth();
stroke(255,0,0);
fill (255,0,0);
frameRate(200);
}
void draw () {
  
background (255);
ellipse(x,y,50,50);

    if(x<= width-25){
      if(bandera==1){
      x=x+1;
    }
    }
    
    else{
    bandera=0;
    }
    if( bandera==0) {
      y=y+1;
      if (y==375){
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
      y=y-1;
      if(y==25){
        bandera=4;
        }
      }
    if(bandera==4){
      x=x+1;
      if(x==25){
        bandera=5;
        }
      }
    }


