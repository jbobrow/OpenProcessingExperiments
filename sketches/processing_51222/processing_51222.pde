
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
frameRate(100);
fill (random(255),random(255),random(255));
 ellipse(300,300, 150,150);

}

void draw(){
  
  background (0, 0,0);
  
  ellipse(verticalx+75,verticaly+75, 200,150);
   ellipse(verticalx-60,verticaly+75, 300,200);
  triangle(verticalx+300,verticaly+300,verticalx+400,verticaly+500,verticalx+75,verticaly+75);
  triangle(verticalx+300,verticaly-175,verticalx+400,verticaly-400,verticalx+75,verticaly+75);
  
    triangle(verticalx+100,verticaly+300,verticalx+200,verticaly+500,verticalx-100,verticaly+75);
  triangle(verticalx+100,verticaly-175,verticalx+200,verticaly-400,verticalx-100,verticaly+75);
  
   triangle(verticalx,verticaly+300,verticalx+50,verticaly+500,verticalx-100,verticaly+75);
  triangle(verticalx,verticaly-175,verticalx+50,verticaly-400,verticalx-100,verticaly+75);
  ellipse(verticalx+200,verticaly+75,100,100);
   ellipse(verticalx-150,verticaly+75,200,30);
 ellipse(verticalx+200,verticaly+50,150,20);
  ellipse(verticalx+200,verticaly+100,150,20);
  //fill (random(255),random(255),random(255));
  
  if (mano==0) { //esfera se va a la derecha
    verticalx=verticalx+1;
     fill (206,62,222);
  
  }
  
   if(verticalx>447) { //cuando la esfera llega a la derecha
    fill (random(255),random(255),random(255));
    mano=1;
  }
  
  
  if (mano==1){ //cuando la esfera baja a la derecha
    verticaly=verticaly+1;
    fill (255,0,0);
  }
  
  
  if (verticaly>=448){ //cuando la esfera llega a abajo
   //fill (random(255),random(255),random(255));
    mano=2;
   }
    if (mano==2){ //cuando la efera se mueve a la izquierda
    verticalx=verticalx-1;
     fill (50,255,66);
  }
  if (verticalx==0){ //cuando la esfera llega a la izquiera
    mano=3;
   }
     if (mano==3){ //cuando la esfera sube
    verticaly=verticaly-1;
     fill (30,74,255);
  }
  if (verticaly==0){ //cuando la esg+fera llega arriba
   
   
    mano=0;
   }
   
 
}

