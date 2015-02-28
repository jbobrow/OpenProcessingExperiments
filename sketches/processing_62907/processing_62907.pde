
int x,y,x1,y1,xc,yc;
void setup(){
  size(500,500);  
  noStroke();
  smooth();
}
void draw(){
  x=width-mouseX; //se mueve en sentido contrario al mouse
  y=height-mouseY;
  x1=mouseX;//se mueve siguiendo al mouse
  y1=mouseY;
  xc=255-x1;//en base a la posicion del mouse cambia el color de fondo y de los circulos
  yc=255-y1;
  if(mousePressed==true){
  fill(255, xc, xc, 15); //rectangulo tamaño del lienzo con transparencia para que de efecto de barrido
  rect(0, 0, width, height);
  fill(0, 0, xc); //cirulo que se mueve en oposicion al mouse
  ellipse(x, y, 50, 50);
  fill(0,xc, 0); //cirulo que se mueve como el mouse
  ellipse(x1, y1, 50, 50);
  }else{ // si el mouse no esta presionado, se invierten los colores de los circulos y el fondo
  fill(0, xc, xc, 15);
  rect(0, 0, width, height);
  fill(255, 255, xc);
  ellipse(x, y, 50, 50);
  fill(255,xc, 255);
  ellipse(x1, y1, 50, 50);
  };
}



