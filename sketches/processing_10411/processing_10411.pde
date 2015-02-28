
PFont font;
float r; 
float g; 
float b; 
float a; 
float diam;

float y = 50.0;
float speed = 1.0;

int direction = 30;
void setup() {

 
size(675, 600);
font = loadFont("TrebuchetMS-Bold-48.vlw");
textFont(font);
textSize(18);
background (0);
smooth();
noStroke();
ellipseMode(RADIUS);

}
void draw() {
 
fill(g);
textSize(47); 
text("MANTRAMASANA",15,451);

text("TRAMASANAMAN",15, 540);
textSize(57); 
text("AMASANAMAN",10, 498);


fill(r,g,b);
ellipse (192,300,80,80);
fill(r,g);
ellipse (192,300,50,50);
fill(r);
ellipse (192,300,10,50);
ellipse (192,300,50,10);
line(180,290,200,310);
fill(255);
rect (400,50,240,150);
rect (400,290,240,50);
rect (400,530,240,25);
rect (385,0,5,675);
rect (665,0,10,675);
rect (650,0,5,675);
fill(r,g,b,a);
ellipse (192,300,100,100);
ellipse (192,300,90,90);
rect (400,35,240,5);
rect (400,5,240,25);
rect (400,280,240,5);
rect (400,560,240,5);
rect (400,570,240,5);
ellipse(33, y+50, diam,55);
ellipse(73,y,diam,diam);
ellipse(113,y+50,diam,55);
ellipse(153,y,diam,diam);
ellipse(193,y+50,diam,55);
ellipse(233,y,diam,diam);
ellipse(273,y+50,diam,55);
ellipse(313,y,diam,diam);
ellipse(353,y+50,diam,55);
fill(0);
textSize(12); 

text("Color Mantram.",410, 70);
textSize(9);
text("Halla la combinacíón de color que prefieras.",410, 85);
text("Variaciones: Arrastra el mouse dentro del área. ",410, 100);
text("Reinicia: Haciendo click en el área.",410, 115);
text("Mantener la visión fija en una combinación",410,130);
text("unos instantes, luego buscar otra combinación.",410,145);
text("Alternar.",410,160);
text("Color mantram requiere de movimientos mínimos y",410,175);
text("suaves; mente alerta y receptiva a la vez.",410,190);
text("Color Mantram es un juego de distensión mental. ",410, 310);
text("No busques, encuentra. ",410, 325);
text(" ",410, 330);
text("By Lumina. Buenos Aires. Argentina.",410, 550);
y += speed * direction;
if ((y-30 > height-diam) || (y+10 < diam)) {
direction = -direction;
}
}

void mouseMoved(){
 
  // Each time through draw(), new random numbers are picked for a new ellipse. 
  g = random(255);
  r = random(255); 
  b = random(255); 
  a = random(255); 
  diam = random(20);
 
}

void mousePressed(){
 
    background(0);
    
 
} 


