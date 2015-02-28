
void setup()
{size(400,200);
background(255);}

void draw()
{
background(255);

// Nombre d'image par seconde 0<x>24 x=image +/- saccadée
frameRate(24);


//Je déclare des variables pour les couleurs utilisées dans mes triangles
color rose = color(224,25,101);
color bordeaux = color(64,8,30);
color noir = color(0);
color jaune = color(242,235,95);

//Puis des variables pour tous les nombres
int x = 100;
int y = 25;
int a = 55;
int b = 90;
int c = 80;
int z = 0;
int o = 5;

//Variable pour mon niveau de transparence
int transp = 75;


  
// Premier coin en haut à gauche
translate(x,z);
stroke(0);
fill(jaune);
triangle(mouseX,mouseY,c-10,a+5,c,b);
fill(rose);
triangle(mouseX,mouseY,y,a,y,y);
fill(rose);
triangle(b,b,a,y,y,y);
triangle(x,mouseY,y,b+5,y,y);
fill(bordeaux);
triangle(mouseX,mouseY,y,a,y,y);
fill(noir);
triangle(y,y+10,y,a-5,b,a+5);
fill(jaune);
triangle(a,y,c,y,c,c-10);

//2e coin

  translate(x+x,x+x);
  rotate(radians(180));
  noStroke();
  fill(jaune);
  triangle(b,x,c-10,a+5,c,b);
  fill(rose);
  triangle(mouseX,x,y,a,y,y);
  fill(rose);
  triangle(b,b,a,y,y,y);
  triangle(x,x+y,y,b+5,y,y);
  fill(bordeaux);
  triangle(x,x,y,a,y,y);
  fill(noir);
  triangle(y,y+10,y,a-5,b,a+5);
 fill(jaune);
 triangle(a,y,c,y,c,c-10);
 
 // Coins en transparence

//coin en haut

  translate(x+x+o,x+x+o);
  rotate(radians(180));
  noStroke();
  fill(jaune,transp);
  triangle(b,x,c-10,a+5,c,b);
  fill(rose,transp);
  triangle(mouseX,x,y,a,y,y);
  fill(rose,transp);
  triangle(b,b,a,y,y,y);
  triangle(x,x+y,y,b+5,y,y);
  fill(bordeaux,transp);
  triangle(x,x,y,a,y,y);
  fill(noir,transp);
  triangle(y,y+10,y,a-5,b,a+5);
 fill(jaune,transp);
 triangle(a,y,c,y,c,c-10);

// J'ajoute une intéraction, le dernier triangle apparait seulement si l'on clique
 if(mousePressed){
// coin en bas à droite
  translate(x+x+o+o,x+x+o+o);
  rotate(radians(180));
  stroke(z);
  strokeWeight(0.5);
  fill(jaune,transp);
  triangle(b,x,c-10,a+5,c,b);
  fill(rose,transp);
  triangle(mouseX,x,y,a,y,y);
  fill(rose,transp);
  triangle(b,b,a,y,y,y);
  triangle(x,x+y,y,b+5,y,y);
  fill(bordeaux,transp);
  triangle(x,x,y,a,y,y);
  fill(noir,transp);
  triangle(y,y+10,y,a-5,b,a+5);
 fill(jaune,transp);
 triangle(a,y,c,y,c,c-10);
 }
 

 }


