
int pos, vel;
int sz = 20;

void setup(){
size(300,200);
pos = width/2;
vel = 5;
}

void draw(){

background(0);

//actualitzamos la posición
pos = pos+vel;

//dibujamos
ellipse(pos,height/2,sz,sz);

//comprobamos si está en los límites de la ventana
//si lo está, invertimos el signo de la velocidad:
if((pos<0)||(pos>width)){
vel = -vel;
} 
}
