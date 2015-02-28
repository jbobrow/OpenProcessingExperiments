
size(200,200);
background(255);

int x = 100;
int y = 100;
int ancho = 100;
int altura = 100;

//todos los variables que siguen son referentes al ancho y altura
int ojo_izq_x =  x + int(ancho*0.2); //pos x de ojo izquierda
int ojo_izq_y =  y - int(altura*0.2);//pos y de ojo izquierda
int ojo_izq_ancho = int(ancho*0.2); //ancho de ojo izquierda
int ojo_izq_altura = int(altura*0.05); //altura de ojo izquierda

int ojo_der_x =  x - int(ancho*0.2); //pos x de ojo derecha
int ojo_der_y =  y - int(altura*0.2);//pos y de ojo derecha
int ojo_der_ancho = int(ancho*0.2); //ancho de ojo derecha
int ojo_der_altura = int(altura*0.2); //altura de ojo derecha

int son_x = x; //sonrisa x
int son_y = y + int(altura*0.2); //sonrisa y
int son_ancho = int(ancho*0.5); //ancho de sonrisa 
int son_altura = int(ancho*0.3); //altura de sonrisa
float com_izq =  radians(10); //comisura derecha
float com_der = radians(170); //comisura izquierda
int grosor_linea = int(ancho*0.03);


smooth();
strokeWeight(grosor_linea);
fill(255,255,0);
ellipse(x,y,ancho,altura); //cara
fill(0);
ellipse(ojo_izq_x, ojo_izq_y, ojo_izq_ancho, ojo_izq_altura); //ojo izq
ellipse(ojo_der_x, ojo_der_y, ojo_der_ancho, ojo_der_altura);  //ojo der
noFill();
arc(son_x,son_y, son_ancho, son_altura, com_izq, com_der); //sonrisa







