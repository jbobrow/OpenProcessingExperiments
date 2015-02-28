
int verticalx;
int mano;
int verticaly;
 
void setup() {
size (600,600);
 
smooth();
verticalx=0;
verticaly=0;
mano=0;
noStroke();
frameRate(90);
fill (random(255),random(255),random(255));
 
}
 
void draw(){
   
  background (0, 0,0);
  ellipse(verticalx+75,verticaly+75, 180,180);
  //fill (random(255),random(255),random(255));
  
  //circulo a la derecha
  if (mano==0) { 
    verticalx=verticalx+1;
     fill (255,235,3);
   
  }
   //circulo esq-derecha
   if(verticalx>447) { 
    fill (random(255),random(255),random(255));
    mano=1;
  }
   
//circulo2 a la derecha
 ellipse(verticalx+75,verticaly+75, 150,150);
  //fill (random(255),random(255),random(255));
  if (mano==0) { 
    verticalx=verticalx+1;
     fill (3,255,29);
   
  }
   //circulo2 llega esq-derecha
   if(verticalx>447) { 
    fill (random(255),random(255),random(255));
    mano=1;
  }
 
  //circulo3 a la derecha
 ellipse(verticalx+75,verticaly+75, 100,100);
  //fill (random(255),random(255),random(255));
  
  if (mano==0) { 
    verticalx=verticalx+1;
     fill (255,133,3); 
  }
   //circulo3 llega esq-derecha
   if(verticalx>447) { 
    fill (random(255),random(255),random(255));
    mano=1;
  }
  
 //circulo baja  
  if (mano==1){ 
    verticaly=verticaly+1;
    fill (255,3,11);
  } 
 //circulo abajo  
  if (verticaly>=448){ 
   //fill (random(255),random(255),random(255));
    mano=2;
   }
 
  
  
  //ejemplo
  
 

 
  
  
  //ejemplo
   //circulo a la izquierda
 ellipse(verticalx+75,verticaly+75, 90,90);
  //fill (random(255),random(255),random(255));
 if (mano==2){ 
    verticalx=verticalx-1;
     fill (255,3,11);
  }
 //circulo llega esq-iz
  if (verticalx==0){
    fill (random(255),random(255),random(255));
    mano=3;
   }
  
  //circulo2 a la izquierda
  ellipse(verticalx+75,verticaly+75, 70,70);
  //fill (random(255),random(255),random(255));
    if (mano==2){ 
    verticalx=verticalx-1;
     fill (255,3,251);
  }
 
 //circulo2 llega esq-iz
  if (verticalx==0){
     fill (random(255),random(255),random(255));
    mano=3;
   }
  
   //circulo3 a la izquierda
   ellipse(verticalx+75,verticaly+75, 50,50);
  //fill (random(255),random(255),random(255));
    if (mano==2){ 
    verticalx=verticalx-1;
     fill (77,3,255);
  }
 
 //circulo3 llega esq-iz
  if (verticalx==0){
    fill (random(255),random(255),random(255));
    mano=3;
   }
  
  //circulo sube
     if (mano==3){ 
    verticaly=verticaly-1;
     fill (7,172,229);
  }
 
 //circulo arriba
  if (verticaly==0){ 
    
    
    mano=0;
   }
   
}  

