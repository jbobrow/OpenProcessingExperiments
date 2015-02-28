


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
// saveFrame ("123.JPG");
//}
class Gota {
  float x,y;   
  float velocidadY; 
  float velocidadX;
  color c; 
  float r; 

  Gota() {            
    x = random (width);     
    y = 224;              
    velocidadY = random(9); 
  velocidadX= random (9);  
    c = color(255); 
  }

  void llover() {
    y += velocidadY; 
    x+=velocidadX;
  }

  void mostrar() {
    noFill();
    stroke(c);
    ellipse(x ,y  , 30, 30);
    
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


