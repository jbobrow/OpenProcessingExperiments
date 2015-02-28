
void setup ()
{
size(400,400);
background(0);
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
Mavariable2=1;

int Mavariable3;
Mavariable3=400;

int Mavariable4;
Mavariable4=1;

//MaPositionX permet de changer les coordonnés.

int MaPositionx;
MaPositionx=400;

int Mapositiony;
Mapositiony=1;


// Je dessine une ellipse dont la coordonnée est la valeur contenue dans Mavariable1.
  
noFill();
stroke(#E8D313);
ellipse(mouseX,mouseY,Mavariable3,Mavariable4);

stroke(#E413E8);
ellipse(mouseX,mouseY,Mavariable1,Mavariable2);

stroke(#F5F3E1);
ellipse(mouseX,mouseY,Mavariable1,Mavariable2);

stroke(#8EF2BA);
ellipse(mouseX,mouseY,MaPositionx,Mapositiony);




//println donne les coordonnées des déplacements.
 
println(Mavariable1); 
loop();
}


