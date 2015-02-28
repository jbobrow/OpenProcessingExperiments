
//P2_b: dibuix d'una cara i una pilota seguida per el mouse.

int x,y;

void setup()
{
size (500,500);
}

void draw()
{

stroke (0,0,0); //color de la linea.
strokeWeight (2); //gruix de la linea.
background (255,255,255); //color del fons.
fill (255,233,26); //color i dibuix de la cara.
ellipse (250,250,250,250);
fill (255,255,255);
ellipse (210,210,75,75);
ellipse (290,210,75,75);
fill (0,0,0); //color i dibuix dels ulls que es mouen respecte la posició X del mouse.
ellipse (210,210,10+mouseX/20,10+mouseX/20);
ellipse (290,210,10+mouseX/20,10+mouseX/20);

line (200,300,300,300); //linea de la boca.

//definició, dibuix i color de la pilota que seguiex al mouse i canvia la seva forma depenent de la posició X,Y del mouse.

x=mouseX;
y=mouseY;
fill (222-mouseX/2,31+mouseX/2,31+mouseX/2);
ellipse (x,y,50+mouseX/10,50+mouseY/10);
}


