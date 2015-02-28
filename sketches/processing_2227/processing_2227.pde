
/*  Alba G. Corral  */ 
 
int posx,posy; 
 int direccion = 1;
 
int distancia; //distancia entre cada linea 
 
int conty1,contx1,contx2,conty2; 
//color c = color(#999999); 
 
void setup() 
{ 
  size(800,700);//ponemos el posx y el posy de la ventana 
  background(0);
  noStroke();//deshabilita la posibilidad de poner borde 
  smooth(); 
  iniciar(); 

} 
 
void draw() 
{  
  contx1 = contx1 - distancia; 
  conty1 = conty1 + (distancia*direccion); 
  conty2 = conty2 - distancia; 
  contx2 = contx2 + distancia; 
  if (conty1 > height) {direccion =direccion * -1; background(0);} 
    if (conty1 < 0) {direccion =direccion * -1; background(0);} 
  if (conty1 > height/2){ 
  contx1 = contx1 - contx2; 
  conty1 = conty1; 
  conty2 = conty2; 
  contx2 = contx2 - contx1; 
  distancia=int(random(4,4)); 
  
 } 
  
  
  
 
 
   //line(x1, y1, x2, y2) 
  line(contx1,posy,posx,conty1); 
  line(posx,conty1,contx2,posy); 
  line(posx,conty2,contx1,posy); 
  line(posx,conty2,contx2,posy); 
 
} 
void iniciar(){ 
  // saveFrame("estrella-####.png"); 
  // delay(2000); 
   background(color(#000000)); 
 
  stroke(#04930F); 
  distancia=int(random(2,10)); 
  posy = height/2; 
  posx = width/2; 
  contx1 = posx; 
  conty1 = 0; 
  contx2 = posx; 
  conty2 = posy*2; 
   
   
   
   
   
 
 
} 
void mousePressed() { 
iniciar(); 
stroke(#F2F700); 
} 
 
void mouseReleased() { 
   background(#1A0C76); 
  loop(); 
} 
void keyPressed() { 
    if (key == 'b' || key == 'B') { 
     iniciar(); 
    } 
     if (key == 's' || key == 'S') { 
     saveFrame("estrella-####.png"); 
  } 
} 


