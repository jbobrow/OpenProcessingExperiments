
float posX1=0,posY1=height/4, posX2=0, posY2=height/2;
float T=10;
float vel;
float x1=2*PI;
float x2=2*PI;
float theta;

void setup(){
size(700,500);
vel=2*PI*1/T;}

void draw(){
background(0);
//dibujar coordenadas
stroke(255);
line(0,0,0,height);
line(0,height/4,width,height/4);
line(0,3*height/4,width,3*height/4);

//pintar función oscilador simple
translate(0, height/4);
for(theta=0;theta<=width;theta+=vel)
  {point(theta,100*sin(PI/20*theta)*exp(-0.02*theta));}
//añadir velocidad
x1+=vel;
//actualizar posiciones
posX1=x1;
posY1=100*sin(PI/20*x1)*exp(-0.02*x1);
//dibujar elipse que sigue la trayectoria del oscilador simple
fill(255);
ellipse(posX1,posY1,20,20);

//dibujar función oscilador combinado
translate(0, height/2);
for(theta=0;theta<=width;theta+=vel)
  {point(theta,50*sin(PI/80*theta)+50*sin(PI/30*theta));}
//añadir velocidad
x2+=vel;
//actualizar posiciones según la función
posX2=x2;
posY2=50*sin(PI/80*x2) + 50*sin(PI/30*x2);
//dibujar elipse
fill(255);
ellipse(posX2,posY2,20,20);

}




