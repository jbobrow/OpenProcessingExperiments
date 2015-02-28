
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

int Mavariable1;
Mavariable1=3;

// Je peux designer d'autres valeurs pour d'autres variables.

int Mavariable2;
Mavariable2=200;

int Mavariable3;
Mavariable3=200;

int Mavariable4;
Mavariable4=30;

//MaPositionX permet de changer les coordonnés.

int MaPositionx;
MaPositionx=200;

int Mapositiony;
Mapositiony=10;


// Je dessine une ellipse dont la coordonnée est la valeur contenue dans Mavariable1.
  
noFill();
stroke(#E8D313);
ellipse(mouseX,Mavariable3,Mavariable4,mouseY);

stroke(#E413E8);
ellipse(mouseX,Mavariable2,Mavariable1,mouseY);

stroke(#F5F3E1);
ellipse(mouseX,Mavariable2,Mavariable1,mouseY);

stroke(#8EF2BA);
ellipse(mouseX,MaPositionx,Mapositiony,mouseY);




//println donne les coordonnées des déplacements.
 
println(Mavariable1); 
loop();
}


