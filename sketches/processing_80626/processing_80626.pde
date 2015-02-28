
void setup ()
{
size(400,400);
background(255);
smooth();


}



void draw()

{

 // créer une variable --"Monpetitpanier" est un nom inventé pour la variable. 
 // L'utilisation du "=" permet d'attribuer une valeur 
// Je peux designer d'autres valeurs pour d'autres variables.

int Mavariable1;
Mavariable1=400;

int Mavariable2;
Mavariable2=1000;

int Mavariable3;
Mavariable3=400;

int Mavariable4;
Mavariable4=1000;

//MaPositionX permet de changer les coordonnés.

int MaPositionx;
MaPositionx=400;

int Mapositiony;
Mapositiony=1000;


// Je dessine une ellipse dont la coordonnée est la valeur contenue dans Mavariable1.
  
noFill();
stroke(#96EDF0);
ellipse(mouseX,mouseY,Mavariable3,Mavariable4);

stroke(#083A3B);
ellipse(mouseX,mouseY,Mavariable1,Mavariable2);

stroke(#2EFAFF);
ellipse(mouseX,mouseY,Mavariable1,Mavariable2);

stroke(#F7FF2E);
ellipse(mouseX,mouseY,MaPositionx,Mapositiony);




//println donne les coordonnées des déplacements.
 
println(Mavariable1); 
loop();
}


