
PFont miLetra;

void setup () 
{ size (400,400);
frameRate (5);
}
void draw ()
{

miLetra = createFont ("Serif.vlw");
textFont(miLetra);
fill (204,24);
textSize (random (10,80));
rect (0,0,400,400);
fill (0);
text ("Mich", random(400), random(400));
}

