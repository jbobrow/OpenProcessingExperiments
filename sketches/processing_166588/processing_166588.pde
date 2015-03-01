

int x_i=30; 


int y_i=30; 


int x_f=150; 


int y_f=150; 


int x=30;  


float b; // definicion de variable con numeros decimales. punto de corte con el eje vertical de la recta de trayectoria 


float m;  // pendiente , de la recta de trayectoria. NO están definidas aún. 


  


void setup(){ 


size(400,400); 


  


  


} 


  


//    Funcion draw. 


  


void draw(){ 


 /* float n1=random(255); 


  float n2=random(255); 


  float n3=random(255); 


  background(n1,n2,n3); 


  */ 


  background(120); 


  calcular(); 


  fill(255,100,0); 


  ellipse(x_i,y_i,20,20); 


  fill(0,0,255); 


  ellipse(x_f,y_f,20,20); 


  if(x<=x_f){ 


  fill(0,255,0); 


  ellipse( x , m*x+b , 20  ,20 ); 


  } 


  x=x+1; 


} 


  


  


void calcular(){ 


m=(y_f-y_i)/(x_f-x_i); 


b=y_i-m*x_i; 


} 

