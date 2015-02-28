
//variables de l'oeil
float xoeil=200;
float yoeil=200;
float xpupille;
float ypupille;
float xcible;
float ycible;
float d=100; //diametre oeil

void setup()
{
size(400,400);
smooth();
}

//change destination de loeil
void mousePressed()
{
xcible=mouseX;
ycible=mouseY;
}

void draw()
{
background(0);

//dessine l'ellipse de l'oeil
fill(255);
ellipse(xoeil, yoeil, d,d);

xoeil = xoeil + (xcible-xoeil) * 0.1;
yoeil = yoeil + (ycible-yoeil) * 0.1;

//dessine la pupille
fill(0);
ellipse(xpupille, ypupille, 30,30);


//calcul angle pupille
float rad = atan2(mouseY-yoeil, mouseX-xoeil);
float distance = dist(mouseX,mouseY,xoeil, yoeil);
distance = constrain(distance, 0, (d/2) - 15) ;
xpupille = xoeil + cos(rad) * distance;
ypupille = yoeil + sin(rad) * distance;

}
