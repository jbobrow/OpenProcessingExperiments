
float circulox;
int circuloy;
int dim;
//int velocidad=2;
float velocidad=0.5;
int r=25;
int g=56;
int b=75;

void setup(){
  size(600,600);
  background(255);
  circulox=100;
  circuloy=100;
  dim=150;
  frameRate(10);
  }//cierre segundo setup 
void draw(){
//background(255);
fill(255,20);
rect (0,0,600,600);
noStroke();
 //ellipse(circulox, circuloy,dim,dim); 
 fill (r,g,b);
 //fill (220,24,68);
// ellipse(circulox+1, circuloy+1,dim/2,dim/2); 
 fill (r+25,g+65,b+85);
//fill (32,84,256);
ellipse(random(width), random(height),dim/4,dim/4);
 // ellipse(random(width), random(height),dim/4,dim/4);
  //fill (r+96,g+125,b-198); RELLENO DE COLOR Y SIGIENTE RANDOM DE COLOR
  fill (random(0,255),random(0,255), random(0,255), random(0,255));
  // ellipse (random(width), random(height), dim, dim);
  float dim2=random(100);
    // ellipse (random(width), random(height), dim2, dim2);
    ellipse (mouseX+random(50), mouseY+random(50), dim2, dim2);
  // ellipse (random(width), random(height), random(100), random(100)); el tamaño es aleatorio
ellipse (random(100,300), random(height), dim, dim);
 // fill (190,57,209);
 //circulox=circulox+20;//animacion del circulo
// circulox=circulox+velocidad;
 println(circulox);
 
}// fin dibujo elipse
void mousePressed(){
  background(255);
} //fin de resetear fondo
