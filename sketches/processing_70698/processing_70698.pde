
int x=40;
int y=40; 
int bandera=1;
int bandera1=1;
  
void setup () {
size (600,400);
smooth();
fill (35,183,41);
frameRate(100);
}
void draw () {
   
background (255);
ellipse(x,y,50,50);
 
    if(x<= width-40){
      if(bandera==1){
      x=x+1;
    }
    }
     
    else{
    bandera=0;
    }
    if( bandera==0) {
      y=y+1;
      if (y==360){
      bandera=2;
    }
  }
     
      
    if(bandera==2){
      x=x-1;
      if(x==40){
        bandera=3;
        }
      }
     
    if(bandera==3){
      y=y-1;
      if(y==40){
        bandera=4;
        }
      }
    if(bandera==4){
      x=x+1;
      if(x==40){
        bandera=5;
        }
      }
    }
