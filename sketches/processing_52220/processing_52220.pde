
int fl;
int x;
int y;

void setup(){
  size(500,500);
  x=30;
  y=30;
  fl=0;
}


void draw() {
  background(#000000);
    ellipse(x,y,50,50);
    
    //arriba
    if (fl==0){
      x=x+2;
    }
    if (x > 470){
     if(fl==0) fill(random(0,255),random(0,255),random(0,255));
    fl=1;
    
    } 
   //derecha
   if( fl==1){
     y=y+2;
   } 
   
  if(y > 470){
    if (fl==1) fill(random(0,255),random(0,255),random(0,255));
    fl=2;
    
  }
  
  //abajo
  if(fl==2){
    x=x-2;
    
  }
  
  if(x < 30){
    if(fl==2) fill(random(0,255),random(0,255),random(0,255));
    fl=3;
    
  }
  
  //izq
  if(fl==3){
    y=y-2;
    
  }
  
  if(y < 30){
   if(fl==3) fill(random(0,255),random(0,255),random(0,255));
    fl=0;
    
  }
}

