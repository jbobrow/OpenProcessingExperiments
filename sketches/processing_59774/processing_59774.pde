
int radius = 18;
float x,y,t=0,yo,in=0.52,fi=5.76;
float speed = 1;
float speed2 = 2.5;
int direction = 1;
void setup() {
size(600, 450);
smooth();
ellipseMode(RADIUS);
noStroke();
y=height-20;
yo=height-20;
x = 280;
}
void draw() {
background(0);
y+=speed2*t;
if ((0==yo-y)||((y==height-70)&&(x>=50)&&(x<=220))||(y>=height-20)||((y==height-70)&&(x>=350))&&(x<=520)||((y==height-145)&&((x<=85)||(x>=490)))||((y==height-220)&&(((x>=90)&&(x<=210))||((x>=250)&&(x<=370))||((x>=410)&&(x<=490))))||((y==height-280)&&(((x>=490)&&(x<=580))||((x>=110)&&(x<=200))))||((y==height-340)&&((x>=380)&&(x<=480)))||((y==60)&&((x>=250)&&(x<=383))) ){
yo=y;
t=0;
}
if(y<=height-20){
if ((120==yo-y)||((y==height-70)&&((x<50)||((x>220)&&(x<360))||(x>520)))||((y==height-145)&&(((x>85)&&(x<490))))||((y==height-220)&&((x<90)||((x>210)&&(x<250))||((x>370)&&(x<410))||(x>490)))||((y==height-280)&&((x<110)||(x>580)||((x>200)&&(x<490))))||((y==height-340)&&((x<380)||(x>480)))||((y==60)&&((x<250)||(x>383))) ){
t=1;
}
}
if ((key == 'e') || (key == 'E')) {
speed = 2;
}
if ((key == 'f') || (key == 'F')) {
speed = 1;
}
if (keyPressed) {
if ((key == 'w') || (key == 'W')) {
if(y>=20){
if(y==yo){
yo=y;
t=-1;
}
}
}
if ((key == 'a') || (key == 'A')) {
if(x>=20){
direction=-1;
x += speed * (direction);
arc(x, y, radius, radius, 3.67, 8.9);
}
}
if ((key == 'd') || (key == 'D')) {
if(x<=580){
direction=1;
x += speed * direction;
}
}
}
if(direction==1){
in=0.52;
fi=5.76;
}
if (direction==-1){
in=3.67;
fi=8.9;
}
if((y==height-320)&&((x>=190)&&(x<=270))){
y=height-20;
x=20;
}
fill(237,14,14);
arc(320,80,30,80,PI,2*PI);
rect(260,80,113,10);
fill(123);
arc(x, y, radius, radius, in,fi);
noFill();
fill(124,224,222);
rect(60,height-50,150,10);
rect(360,height-50,150,10);
rect(0,height-125,75,10);
rect(200,height-125,200,10);
rect(500,height-125,100,10);
rect(100,height-200,100,10);
rect(260,height-200,100,10);
rect(420,height-200,60,10);
rect(500,height-260,70,10);
rect(120,height-260,70,10);
rect(390,height-320,80,10);
rect(200,height-320,60,10);
fill(255);
textSize(10);
text("Mantener oprimido 'h' o 'H' para obtener ayuda respecto al juego",0,0,200,30);
noFill();
if(keyPressed){
if((key=='h')||(key=='H')){
background(255);
textSize(20);
fill(0);
text("Este juego trata de saltar de bloque en bloque hasta llegar al porton rojo de la parte superior,hay bloques falsos y bloques tampa los cuales dificultaran un poco el juego,lo comandos son: \n-'d' o 'D': andar a la derecha.\n-'a'o'A': andar a la izquierda.\n-'w'o'W': saltar.\n-'e'o'E': aumentar velocidad.\n-'s'o'S': disminuir velocidad.\nMucha suerte y a jugar.",0,0,width,height);
noFill();
}
}
if((y==60)&&((x>=280)&&(x<=360))){
background(240,123,123);
textSize(30);
fill(0);
text("felicitaciones, si usted esta leyendo esto significa que a podido terminar el juego lo cual implica que andaba un poco(por no decir bien) desparchado, felicitaciones.",0,0,width,height);
noFill();
}
}

