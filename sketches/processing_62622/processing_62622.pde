

float r;
float r2;
float v;
float a;
int x;
int y;
float suma;

void setup(){
 
 size(500,500); 
 
 x=0;
 y=0; 
  
}



void draw(){
  
  
  
  r=random(0,255);
  r2=(255-r);
  v=random(0,r2);
  a=(255-v-r);
  
  fill(r,v,a);
  noStroke();
  rect(x,y,25,25);
  
  suma=(r+v+a); //para imprimir suma
  
  x=x+25;
       
       
  if (x>=width){
   
    x=0;
    y=y+25;
   
  }
  
  if (y>=height){
    
   noLoop(); 
    
  }
   
        println("   rojo   ");
        println(r);
        println("   verde   ");
        println(v);
        println("   azul   ");
        println(a);
        println("   SUMA   ");
        println(suma);
     
   
    
  }
  
  


