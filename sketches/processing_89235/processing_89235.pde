
void setup()
{size(400,200);
background(255);}

void draw()
{
background(255);

//Je déclare de variables pour les couleurs utilisées dans mes triangles
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

// Premier coin en haut à gauche
translate(x,z);
noStroke();
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
}


