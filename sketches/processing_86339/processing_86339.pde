
void setup() {
size(400,400);
background(255);
smooth();
}
/*je vais essayer de créer une succession de carré, car je m'interesse
aux formes géométrique et aux structures, afin de jouer par la suite sur
les effets de contrastes et de profondeurs de champs.*/



void draw()
{
  
  int L;
 L = 60;
 
  int H;
 H = 60;
 
fill(#676464,80);
//jouer la transparence des formes

rectMode(CENTER);
rect(230,230,H,L);
rect(170,170,H,L);
rect(170,230,H,L);
rect(230,170,H,L);

//forme de depart

fill( #393838,90);
rect(200,200,H,L);

fill(#F7E61E);
triangle(170, 200, 230, 200, 200, 170);
triangle(170, 200, 200, 230,230,200);

fill(#A0A0A0);
triangle(140,140,140,200,200,140);

triangle(200,140,260,140,260,200);


triangle(200,260,260,260,260,200);


}


