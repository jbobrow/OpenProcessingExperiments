

//Posición y velocidad coordenadas
int _x;
int _y;
int velX;
int velY;


void setup(){
  
//Nombre y título del trabajo
println("Sergio González Sánchez. Grupo 3. Práctica 3: Pinguino rebot");

//Dimensiones de la pantalla
size(400,400);

//Ocultar cursor
noCursor();

//Se definen las variables de velocidad y posición donde se moverá el personaje
_x = width/2;
_y = height/2;
velX = 2;
velY = 2;
}

void draw(){
  //Se define el color de fondo
  background(_y,400,_x);
  fill(245,207,15);
  
  //Posicion de la figura dependiendo de la velocidad
  _x = _x+velX;
  _y = _y+velY;


//Partes del personaje:

//Cuerpo
stroke(0,0,0);
fill(0);
ellipse(_x,_y,width*0.75,height*0.75);


//Ojos blanco
strokeWeight(0);
stroke(0,0,0);
fill(255,255,255);
ellipse(_x-45,_y-90,width*0.2,height*0.2);
ellipse(_x+45,_y-90,width*0.2,height*0.2);


//Barriga
ellipse(_x,_y+55,width*0.6,height*0.45);


//Ojos negro
fill(0,0,0);
ellipse(_x-40,_y-80,width*0.1,height*0.1);
ellipse(_x+40,_y-80,width*0.1,height*0.1);


//Pico
fill(237,197,50);
strokeWeight(2);
stroke(250,150,0);
triangle(_x+30,_y-45,_x,_y+10,_x-30,_y-45);


//Límites de la pantalla:

//Posición x
if((_x-155<0)||(_x+155>width)){
  velX = -velX;
}
//Posición y
if((_y-150<0)||(_y+150>height)){
  velY = -velY;
}
}

//Damos la orden de que el personaje vuelva al centro presionando el mouse
void mousePressed(){
 _x=width/2;
 _y=height/2;
}


