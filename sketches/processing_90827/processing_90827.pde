
void setup()
{

size(500,520);
background(255);

smooth(); 
}



void draw()
{
//Ma variable de sur les diametres qui sont identiques
int Diametre1;
Diametre1=90;

int Diametre2;
Diametre2=50;
noFill();
strokeWeight(15);
stroke(#9FB416,150);
ellipse(250, 200, Diametre1, Diametre1);

ellipse(250, 300, Diametre1, Diametre1);

ellipse(200, 250, Diametre1, Diametre1);

ellipse(300, 250, Diametre1, Diametre1);


strokeWeight(15);
stroke(#D87314,120);
ellipse(250, 220, Diametre2, Diametre2);

ellipse(250, 280, Diametre2, Diametre2);

ellipse(220, 250, Diametre2, Diametre2);

ellipse(280, 250, Diametre2, Diametre2);

println(Diametre1);

noLoop();
}


