
//el dibuis de la granota es mourà de manera al·leaotria i li canviarà el color de les galtes segons la posició
// el color del fons variará segons el lloc on apretem el cursor dins la pantalla
//primer definim les entitats i les variables 
int a;
int b;
int _x;
int _y;
int posx, posy, velx, vely;
color colorback;

//donem valor a les entitats i donem la mida a la pantalla a més de ordres com que no volem que es vegi el cursor
void setup(){
size(400,400);
a=width;
b=height;
noCursor();
_x=width/2;
_y=height/2;
posx=width/2;
posy=height/2;
velx=3; //donem valor a la velocitat
vely=3;
colorback=255; //definim el color inicial del fons com a blanc
}

void draw(){
background(colorback); //definir color de fons segons colorback 
posx= posx+velx; 
posy= posy+vely;// definim posició X i Y del dibuix  segons la velocitat
dibuixargranota(posx, posy); //posició inicial del dibuix
if((posx<(a/1.1)/2) || (posx>a-(a/1.1)/2)) {
  velx=-velx;} //definir els rebots en X per quan xoqui amb els límits del dibuix aqest no surti si no que reboti 
if((posy<(b/2.5)) || (posy> b-(b/1.75)/2)) {  
 vely=-vely; } // repetim el procés fet en X però en Y tenin en compte que a l'alçada de l'elipse se li ha de sumar la dels ulls
}

void mousePressed(){
colorback=color(mouseX,mouseY,0);
//donem valor al fons segons la posició en la qual apretem el mouse segons els eixos X i Y de manera que cada cop que s'apreti el mouse 
//en una zona diferent de la pantalla el color del fons canvïi
} 



void dibuixargranota(int _x, int _y)
{
stroke(0); strokeWeight(4); fill(80,230,50); ellipse(_x,_y,a/1.1,b/1.75); //el·lipse verda que forma la cara
stroke(0); fill(255); ellipse(_x-a/5,_y-b/4, a/2.5, b/2.5);ellipse(_x+a/5,_y-b/4, a/2.5, b/2.5); // blanc dels ulls
stroke(0); fill(0); ellipse(_x-a/13, _y-b/4.5, a/8, b/8); ellipse(_x+a/13, _y-b/4.5, a/8, b/8); // nineta de color negra
stroke(0); strokeWeight(8); line(_x,_y+b/5,_x-a/5,_y+b/10); line(_x,_y+b/5,_x+a/5,_y+b/10); //boca 
fill(255,posx,posy); strokeWeight(1); stroke(255,196,225); ellipse(_x-a/3.75,_y+b/15, a/8, b/8); ellipse(_x+a/3.75,_y+b/15, a/8, b/8); 
//mofletes al costat de la boca i fem que el seu color varii de forma sutil al moures per la pantalla
}

 


