
int posX;
int posY;

int X2; 
int Y2;

int X3;
int X4;



int incX;

void setup(){
  
  
  //background (0,200,0);

 size (600,600);

  //rectMode(CENTER);


posX = 0;
X2 = 550;

X3 = 200;
X4 = 400;


 incX = 1;

  
}

void draw () {
  
  fill (mouseX,mouseY,255,5);
  rect (0,0, width, height);



 // dibujos superiores
 
  rect (0,100, 600,100);
  fill (255,mouseX,255,20);

  stroke (1);
  fill (0,255,mouseX,20);
  rect (X3,100, 50,100);
  rect (X4,100, 50,100);
    
    X3 = X3 + incX;
    X4 = X4 -incX;


  
    if(X3 < 0) {
  incX   =  incX * -1  ;
   }
  
 if(X3 > width){
     incX = incX * -1;
 }
  
  
   if(X4 > 0) {
  incX   =  incX * +1  ;
   }
  
 if(X4 > width){
     incX = incX * +1;
     
     
     
    
 }

 //.............................................
    // inferiores
    
       fill (0,255,0,1);
 
  rect (0,400, 600,100);
  fill (255,mouseX,255,20);
  rect (posX,400, 50,100);
  rect (X2,400, 50,100);
    
    
    posX = posX + incX;
    X2 = X2 -incX;
  
  
  if(posX < 0) {
  incX   =  incX * -1  ;
   }
  
 if(posX > width){
 incX = incX * -1;
 }
  
  
   if(X2 > 0) {
  incX   =  incX * +1  ;
   }
  
 if(X2 > width){
     incX = incX * +1;
    
 }
    
 
}


