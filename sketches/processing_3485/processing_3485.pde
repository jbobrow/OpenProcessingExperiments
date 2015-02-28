
//Pablo Carrasco
float p,r,P,c,C,
m,N,n,e,E,
Ny,ny,Ey,ey,
nx,Nx,ex,Ex;//Especifico los float que voy a usar para asi poder modificarrlos en cualquier parte del sketch y especificar su valor 1 sola vez.
                                                   
void setup(){
  p=0;
  P=0;
  r=1;
  m=5; 

 
  size(200,200);
  smooth();
  noStroke();
  noCursor();//comando muy util en sketch de interaccion con el mouse...en este caso lo hago para q simplemete el mouse no tape cuando pase por encima del sketch.
}

void draw(){
noiseSeed(100);//el "noiseSeed" lo pongo solo de picado ya que todavia no logro hacerlo funcionar XD 
  n+=0.01; //todos mis float con "n" generalmente los uso para crear noise`s.
  ny+=0.029;
  nx+=0.0063;
  N=noise(n)*2;
  Ny=noise(ny)*2;
  Nx=noise(nx)*1.7;
  circulos2();
  circulos();
  
}



void circulos(){
  P-=r;//float de poscicion.
  p+=r;//float de poscicion.
  c=9.5*N;//float de tamaño variable.
  C=12;//float de tamaño
  if(p>=200||p<=0)//condicional para evitar q las pelotitas escapen ^^,tambien se podria usar "constrain".
  {
    r=-r;
  }
  fill(0,7);
 rectMode(CORNER);
rect(0,0,200,200);//cuadrado que abarca toda la pantalla, lo uso para dar ese efecto blur.
ellipseMode(CENTER);
 //de aca para abajo son las pelotitas que repiten el movimiento por la pantalla
  fill(#123610,150);
  ellipse(p,100,C,C); 
  ellipse(100,p,C,C);
  ellipse(P+200,100,C,C);
  ellipse(100,P+200,C,C);
  ellipse(p,p,C,C);
  ellipse(P+200,P+200,C,C);
  ellipse(p,P+200,C,C);
  ellipse(P+200,p,C,C);

  fill(#0EFF03);
  ellipse(p,100,c,c); 
  ellipse(100,p,c,c);
  ellipse(P+200,100,c,c);
  ellipse(100,P+200,c,c);
  ellipse(p,p,c,c);
  ellipse(P+200,P+200,c,c);
  ellipse(p,P+200,c,c);
  ellipse(P+200,p,c,c);
  
  fill(#ffffff);
  ellipse(p,100,m,m); 
  ellipse(100,p,m,m);
  ellipse(P+200,100,m,m);
  ellipse(100,P+200,m,m);
  ellipse(p,p,m,m);
  ellipse(P+200,P+200,m,m);
  ellipse(p,P+200,m,m);
  ellipse(P+200,p,m,m);

  filter(BLUR);//comando muy muy util para lograr efectos bastante gozadores XD
}

void circulos2(){
//floats de poscicion variable
e=-10*N;
E=10*N;
ey=-30*Ny;
Ey=30*Ny;
ex=-70*Nx;
Ex=70*Nx;

 //si no se empuja la matriz el "rotate" afecta a todos los elementos del sketch y eso se ve feo XD 
  pushMatrix();
  
  translate(width/2,height/2);//traslado el 0,0 al centro de la patall para que asi las pelotitas de este void giren de la forma que lo hacen
  rotate(p/4);//XD aca use un float ya existente solo porque me dio lata generar uno especil para la rotacion ^^
 //desde aca para abajo son los elipses que giran en la pantalla
 ellipse(0,0,2*N,2*N);
 
   fill(#86FF81);
  ellipse(E,E,4,4);
  ellipse(e,e,4,4);
  ellipse(e,E,4,4);
  ellipse(E,e,4,4);
  fill(#E6FFE5);
  ellipse(E,E,2,2);
  ellipse(e,e,2,2);
  ellipse(e,E,2,2);
  ellipse(E,e,2,2);
  
  fill(#0EFF03);
  ellipse(Ey,Ey,C,C);
  ellipse(ey,ey,C,C);
  ellipse(ey,Ey,C,C);
  ellipse(Ey,ey,C,C);
  fill(#C1FFBF);
  ellipse(Ey,Ey,C-7,C-7);
  ellipse(ey,ey,C-7,C-7);
  ellipse(ey,Ey,C-7,C-7);
  ellipse(Ey,ey,C-7,C-7);
  
  fill(#079300);
  ellipse(Ex,Ex,3,3);
  ellipse(ex,ex,3,3);
  ellipse(ex*N,Ex*N,3,3);
  ellipse(Ex*N,ex*N,3,3);
  
popMatrix();  

}







