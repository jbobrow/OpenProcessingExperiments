
float x, y, x1, y1;
float angulo;
float tono;
float tamano;
int sentido;

void setup() {
size (700, 700);
colorMode (HSB, 400);
smooth();
noStroke();
background (0);
x=width/2;
y=0;
x1=width/2+10;
y1=0;
angulo=0;
tono=255;
tamano=0;
frameRate(20);
}

void draw() {
translate (x, y);
rotate(angulo);
scale(tamano);
fill(tono, 300, 300);
beginShape();
bezier(50, 40, -10, -10, 0, 100, 50, 110);
bezier(50, 40, 110, -10, 100, 100, 50, 110 );
endShape(CLOSE);
translate (x1, y1);
scale(tamano);
fill(tono, 300, 300);
beginShape();
bezier(50, 40, -10, -10, 0, 100, 50, 110);
bezier(50, 40, 110, -10, 100, 100, 50, 110);
endShape(CLOSE);
y=y+2;
angulo=angulo+.1;
tono=tono-.8;
tamano=tamano-.003;
y1=y1+.5;


if (sentido==1){
fill(tono,300,300,20);
ellipse(0,0,250,20);
y=y+2;
angulo=angulo+.1;
tono=tono-.8;
}
if ((x==width/2)&&(y+20==800)){
y=0;
background(0);
tono=255;
noLoop();
}
}
