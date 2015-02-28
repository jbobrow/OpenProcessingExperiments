
//Aquest es un projecte creat per Carlos Cevallos Manzano 
//1r ASIX Tarda 

//variable grosor del dibuix de pantalla
int gd; 
//altres variables
int h=10;
//color linea
int c=0;
//movimiento
int d=0; 
int z=0;

void setup () {
  size (300, 300);
  noStroke (); 
  background (#000000); 
  gd=10;
  
}

void draw (){
  
  //fondo sobre el que se ejecutará las lineas
  //a = anchura // h= altura
  for (int a=0; a<=height; a=a+gd){
    for (int h=0; h<=width; h+=gd){
      fill (random(200,255),random(0,255),0, random(0,255));
      ellipse (a,h, gd, gd); 
    }
  }
  
  if (mousePressed && (mouseButton == LEFT)){
    for (int v=0; v<=300; v=v+gd){
      for (int b=0; b<=300;b=b+gd){
        fill (mouseX);
        ellipse (v,b, gd, gd); 
       }
    }
  }
 
  
  if (mousePressed && (mouseButton == RIGHT)){
    for (int v=0; v<=300; v=v+gd){
      for (int b=0; b<=300;b=b+gd){
        fill (mouseX,random(0,255),mouseY);
        rect (v,b, gd, gd); 
      }
    }
  } 
  
  int ratonX = mouseX - (mouseX % gd);
  int ratonY = mouseY - (mouseY % gd);
  fill(255);
  ellipse(ratonX, ratonY, 15,15);
  }
  


