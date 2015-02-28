

boolean button = false;
float  x = 100;  // x location of square
float  y = 0; // adivina >D
float r = 255; // colores del circulo
float g = 0; 
float b = 0;
float bx = 0;  //variables del primer rectangulo
float by = height/3 ;
float br = 0;
float bg = 10;
float bb = 0; // hasta aqui vaeriables del primer rectangulo
float r2 = 0; // variables del segundo rectangulo
float g2 = 0;
float b2 = 0;
float r3 = 20; //variables del tercer rectangulo
float g3 = 30;
float b3 = 13;
float speed = 0; // velocidad del cuadro
float gravity = .1; // la nueva variable para la gravedad

void setup() {
  size (300,300);
}

void draw() {
  background (180);
   fill (br,bg,bb);
  rect (bx,by,width,height/3);
   fill (r2,g2,b2);
   rect (0,height/3,width,height/3);
   fill (r3,g3,b3);
   rect (0,200,width,height/3);
  
  // Dibuja el cuadro
  fill (r,g,b);
  noStroke ();
  smooth();
  ellipseMode(CENTER);
  ellipse (x,y,20,20);

  
  if (button) {
  y = y + speed; // agrega la velocidad al lugar
  
  speed = speed + gravity;  // con esto agregas gravedad
  
  if ( y < height/3) {
    br = br + random(-7,7);      //con esto le cambias de color a los rectangulos
    bg = bg + random(-3,3);
    bb = bb + random(-2,2);
  }else if (y > height/3 && y < 200){
   r2= r2 + random(-3,3) ;
   g2 = g2 + random(-7,7);
   b2 = b2 + random (-4,4); 
  } else if (y > 200) {
    r3 = r3 + random(-3,3);
    g2 = g2 + random(-4,4);
    b2 = b2 + random(-8,8);
  }
  
  // si el cuadro llega al fondo
  // dale reversa a la velocidad
  if ( y > height) {
    speed = speed *- .95; // multiplicando por -0.95 en vez de 
    //-1 le quita velocidad a la peolota cada que rebota, 
    //a esto se le conoce como @dampening effect y es un efecto 
    //mas real si no la pelota bota para siempre
  }
} else if (!button){
  y = 0;
} 
 br = constrain(br,0,255);
 bg = constrain(bg,0,255);
 bb = constrain(bb,0,255); // hasta aqui vaeriables del primer rectangulo
 r2 = constrain(r2,0,255); // variables del segundo rectangulo
 g2 = constrain(g2,0,255);
 b2 = constrain(b2,0,255);
 }
void mousePressed(){
  button = !button;
}


