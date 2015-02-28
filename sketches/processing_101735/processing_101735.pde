
int counter;

float ruidoT1 = 0.05;
float variacionT;
float tamano1;
float tamano2;
float angulo;
float variacionX,variacionY,posX,posY;
float ruidoX= 0.007;
float ruidoY= 0.003;
void setup() {
size(800,800);
smooth();
background(250);
frameRate(10);



}
//-------------
void draw() {

variacionT += ruidoT1;
tamano1 = noise(variacionT)*35;
tamano2 = noise(variacionT)*40;
angulo = noise(variacionT)*800;
calcularPerlin();

stroke(random(250),0,0,random(25));
noFill();
ellipse(posX,posY,tamano1,tamano1);
stroke(0,random(300),0,random(25));
noFill();
ellipse(posY,posX,tamano2,tamano2);
// IIIFFFFF
//KEY PRESSEED
if(keyPressed) {
if(key == '1') {
stroke(mouseX,0,random(180),random(40));
noFill();
ellipse(posX,posY,tamano1,tamano1);

stroke(0,random(200),mouseY,random(40));
noFill();
ellipse(posY,posY,tamano2,tamano2);
frameRate(57); 
}
}
if(keyPressed) {
if(key == '2' ) {
stroke(mouseX,0,random(180),random(50));
noFill();
ellipse(posX,posY,tamano1,tamano1);

stroke(0,0,mouseX,random(50));
noFill();
ellipse(posY,posX,tamano2,tamano2);
frameRate(380); 
}
}


// LINEAAAAA !

if(keyPressed) {
if(key == '3' ) {
stroke(random(260),0,15,random(50));
noFill();
line(posY,posX,angulo,posX);
angulo++;

stroke(random(260),0,35,random(50));
noFill();
line(posX,posY,angulo,posX);
angulo++;
frameRate(50); 
}
}

//tiempo de muerte !
if(keyPressed) {
if(key == '4') {
noStroke();
fill(random(260),0,35,random(10));
ellipse(angulo,variacionT,tamano1,tamano1);
}
}
}
void calcularPerlin(){
variacionX += ruidoX;
variacionY += ruidoY;
posX = noise(variacionX) *width;
posY = noise(variacionY) *height;
}
