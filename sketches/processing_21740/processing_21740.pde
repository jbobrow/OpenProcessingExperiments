
int circuloX = 60;
int circuloY = 70;
int crecer = 50;
void setup() {
size(100,100);
}
void draw() {
background(140,50,200);
//cuerpo
ellipseMode(CENTER);
fill(10,255,20);
ellipse(50,70,circuloX,circuloY);
//botones
fill(0);
ellipse(60,60,8,8);
ellipse(62,73,8,8);
ellipse(61,87,8,8);
//cabeza
fill(255,242,191);
ellipse(50,25,crecer,crecer);
//ojos
fill(255);
ellipse(35,20,10,10);ellipse(55,20,10,10);
fill(0);
ellipse(35,20,4,8); ellipse(55,20,4,8);
fill(250,0,0);
ellipse(60,40,5,5);
circuloX=circuloX+1;
circuloY=circuloY+1;
crecer=crecer+1;
}



