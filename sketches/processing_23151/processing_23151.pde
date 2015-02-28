
PFont f;

String mensaje = "este texto da vueltas";//string acomoda letras y numeros en el orden que se escribe
float angulo;

//PFont d;
//String mensaje2 = "me mareo";//string acomoda letras y numeros en el orden que se escribe
//float angulo2;

void setup() {
  size(800,800);
  f = createFont("Arial", 48, true); //agregar 'font o tipo de letra' a carpeta del sketch
}

void draw() {
  //background(0);
  fill (0,20);
  rect (0,0,width,height);
  fill(229, 23, 157);
  textFont(f);                
  translate(width/2,height/2);
  rotate(angulo);              
  textAlign(CENTER) ;//El texto se alinea al 'centro', prueben sin esta linea
 
  textFont(f);              
  translate(width/4,height/4);
  rotate(angulo);              
 textAlign(CENTER) ;
translate(width/8,height/8);
 rotate(angulo);              
//box (100);
  
 
  text(mensaje,0,0);
  
  angulo += 0.05;
  
  //text(mensaje2,0,0);
  
  //angulo2 += 0.05;
}


