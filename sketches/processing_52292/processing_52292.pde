
int lineax;
int mano;
int lineay;
 
void setup() {
size (500,500);
 
smooth();
lineax=0;
lineay=0;
mano=0;
noStroke();
frameRate(150);
 
}
 
void draw(){
   //CATARINA
  background (0,0,0);
  
  ellipse(lineax+75,lineay+75, 100,100);
  fill(0,0,0);
  ellipse(lineax+98,lineay+90,20,20);
    fill(0,0,0);
  ellipse(lineax+58,lineay+65,20,20);
  fill(0,0,0);
  ellipse(lineax+100,lineay+50,20,20);
  fill(0,0,0);
  ellipse(lineax+50,lineay+35,20,20);
   fill(0,0,0);
  ellipse(lineax+50,lineay+95,20,20);
  fill(0,0,0);
  ellipse(lineax+75,lineay+120,20,20);
  fill(0,0,0);
  ellipse(lineax+75,lineay+120,40,40);
  
  
 //catarina mueve derecha
   if (mano==0) { 
    lineax=lineax+1;
     fill (255,0,0);
   }
   //catarina derecha
   if(lineax>375) { 
    mano=1;
  }
   
  //catarina baja  
  if (mano==1){ 
    lineay=lineay+1;
    fill (0,127,191);
  }
   
  //catarina abajo
  if (lineay>=375){ 
    mano=2;
   }
   //catarina se va izquierda
    if (mano==2){ 
    lineax=lineax-1;
     fill (244,255,96);
  }
  //catarina izquierda
  if (lineax==0){ 
    mano=3;
   }
   //catarina sube
     if (mano==3){ 
    lineay=lineay-1;
     fill (144,255,127);
  }
  //catarina arriba
  if (lineay==0){   
    mano=0;
   }
      
}



