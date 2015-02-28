
Gota[] gotas = new Gota[500]; 


int totalgotas;

void setup() {
  size(1000,800);
  smooth();
}

void draw() {
 fill (0,50);
 rect (0,0,width, height);
 
  
  gotas[totalgotas] = new Gota();
  
 
  totalgotas++ ;
  if (totalgotas >= gotas.length) {
    totalgotas = 0; 
  }


  for (int i = 0; i < totalgotas; i++ ) { 
   
   
    gotas[i].llover();
    gotas[i].mostrar();
 gotas [i].rebotar ();
 
  }


}
//void mousePressed (){
 //  saveFrame ("123.JPG");
   
  
 // }
class Gota {
  float x,y;   
  float velocidadY; 
  float velocidadX;
  color c; 
  float r;     

  Gota() {
    r = 68;                 
    x = random (width);     
    y = 200;              
   
    velocidadY = random(8); 
  velocidadX= random (8);  
    c = color(255);
  }

  
  void llover() {
     x+=velocidadX;
    y += velocidadY; 
  
  }

  void mostrar() {
    noFill();
    stroke(c);
    line(x+80,x,y+50,x+30);
  }
  
  void rebotar (){
    if (y>=height){
  velocidadY = velocidadY *-1;
    }
     if (x>=width || x<=0 ){
  velocidadX = velocidadX*-1;
    }
   
  }
  

    
    
    
    
  
}

