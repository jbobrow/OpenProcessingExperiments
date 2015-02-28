
int ellipseXPosition;
int ellipseYPosition;
int speed;
float a;

void setup()
{
size(320, 480); //ställ in fönstrets storlek
ellipseXPosition = 10;
ellipseYPosition = 40;
frameRate(10);
speed = 1;
a = 0;
}
void draw()
{
background(0,0,0); // svart bakgrund
stroke(255, 255, 0); //Gul fyllnadsfärg
point(40, 40); //stjärnor
point(120, 60); //stjärnor
point(30, 140); //stjärnor
point(172, 75); //stjärnor
point(302, 45); //stjärnor
point(83, 90); //stjärnor
point(300, 175); //stjärnor
noStroke(); // Inga kantlinjer
fill (112,184,255,a); // Blå himmel
rect(0, 0, width, height/2); // Ritar himlen
fill(8,194,54,a); // Grönt gräs
rect(0, height/2, width, height/2); // Ritar marken
noStroke();
fill(77,77,77); // grått berg
beginShape(POLYGON); //Ritar berg
vertex(-10, height/2);
vertex(60 , height/2-150 );
vertex(150 , height/2-40);
vertex(210 , height/2-70 );
vertex(300 , height/2 );
endShape();
stroke(255, 176, 0); //Orange linjefärg
fill(255, 255, 0); //Gul fyllnadsfärg
ellipse(ellipseXPosition , ellipseYPosition, 20, 20); //Ritar solen
ellipseXPosition = ellipseXPosition + speed; //hastigheten solen rör sig
if(ellipseXPosition > width+10) //Om solen rört sig till slutet vad vidden
{
ellipseXPosition = 0; //ändra opaciteten på färgen till 0
a = 0;
}
if(ellipseXPosition < 150) //om solens position är mindre än 150
{
a = a + 2; // öka opaciteten på färgen med +2
}
if(ellipseXPosition > 230) // om solens position är större än 230
{
a = a - 5; // minska opaciteten på färgen med -5
}
}

