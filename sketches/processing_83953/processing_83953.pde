
void setup()
{size(400,400);
background(200);}

void draw()
{
noFill();
background(200);
//Je déclare une variable de typer integer
int Variable1;
//Je lui attribue le chiffre 100 grace au signe =
Variable1 = 100;

//Je déclare une variable de typer integer
int Variable2;
//Je lui attribue le chiffre 150 grace au signe =
Variable2 = 150;

//Je déclare une variable de typer integer
int Variable3;
//Je lui attribue le chiffre 200 grace au signe =
Variable3 = 200;

//Je déclare une variable de typer integer
int Variable4;
//Je lui attribue le chiffre 250 grace au signe =
Variable4 = 250;
stroke(0);
strokeWeight(30);
ellipse(mouseX,mouseY,Variable1,Variable2);

translate(100,50);
noStroke();
fill(204,102,54,50);
ellipse(Variable1,Variable2,Variable3,Variable4);
fill(204,102,54,50);
ellipse(Variable1,Variable2,Variable1,Variable1);
ellipse(Variable1,Variable2,Variable1,Variable2);
fill(204,52,54,50);
ellipse(Variable1,Variable2,Variable2,Variable3);
noFill();


}


