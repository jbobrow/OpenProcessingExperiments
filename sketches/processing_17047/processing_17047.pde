

Burbuja[] pompa = new Burbuja[5000];

int totalpompas;

void setup() {
  size(1000,600);
  smooth();
}

void draw() {
  background(29,20,120);
 
  pompa [totalpompas] = new Burbuja();

  
  totalpompas++ ;

  
  if (totalpompas >= pompa.length) {
    totalpompas = 0; 
  }

 
  for (int i = 0; i < totalpompas; i++ ) { 
    pompa[i].elevar();
    pompa[i].mostrar();
    pompa[i].rebotar();
  }

}

class Burbuja {

  float x,y;   
  float velocidadY; 
  float velocidadX;
  color c;
  float r;     
  
  Burbuja() {
    r = random (5,12);              
    x = random(width);     
    y =(height); //-r*4;              
    velocidadY = random(1,3);   
    velocidadX = random(1,2);
    //c = color(255,100); 
  }

  
  void elevar(){
   
    y -= velocidadY;
    x+=velocidadX/4;
   }
   
 void rebotar(){
    if ( x>=width || x<=0){
    velocidadX =velocidadX *-1;
    }
     if ( y>=height || y<=0){
    velocidadY =velocidadY *-1;
    }   
}
 
  void mostrar(){
    float a = 0.1;
    fill (c);
    smooth();
    noStroke();
 
          
     for (int i = 2; i < r; i++) {
       fill (199,212,250,45);
       ellipse(x,y+i*2,i*5,i*5);
       fill (255,242,199,45);
       rect (x-1,y+2,i*1.2,i*1.35,3,4);
       fill (50,42,199,45);
       rect (x+5,y+12,4,3);
      
     }
  }
  }
  
 
       
       



