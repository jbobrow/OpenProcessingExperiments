

void setup()
{
size(400,400);
background(157,222,209);
}

void draw()
{
  
noFill();
background(157,222,209);

// variable de positionX //
int mpx;
mpx = 10;
// variable de positionY //
int mpy;
mpy = 10;

//petit rect noir//
fill(0);
rect(mpx,mpy,50,50);
//moyen rect changement de couleur//
fill(mouseX,59,85,100);
rect(mpx+20,mpy+10,80,80);
//grand rect mauve//
fill(198,206,199,150);
rect(mpx+40,mpy+30,100,150);

//ellipse interactive//
fill(mouseX,mouseY,200,70);
ellipse(mouseX,mouseY,300,300);
println(mouseX);

//triangle interactif lié au centre du cercle//  
triangle(mouseX,mouseY,160,100,200,250);
println(mouseX);
}


