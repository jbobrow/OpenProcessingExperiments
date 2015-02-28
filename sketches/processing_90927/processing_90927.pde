
void setup (){
  size(350,350);
  smooth();

}
 
 
 
void draw ()
{
  //Je déclare une variable pour le nombre d'images par seconde
  int imasec = 10;
  frameRate(imasec);
background(255);
  //Je déclare des variables pour les valeurs de mes triangles
int Val1 = 10;
int Val2 = 340;
//Je déclare des variables pour les couleurs de mes triangles
color vert = color(0,250,25);
color rouge = color(250,0,0);
color bleu = color(0,0,250);
//Je déclare une variable pour la transparence
int transp = 60;

fill(vert,transp);
noStroke();
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));


fill(rouge,transp);
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));

fill(bleu,transp);
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));


 //Je déclare des variables pour les valeurs de mes nouveaux triangles
int Val3 = 50;
int Val4 = 250;

//Je déclare une variable pour la transparence de mes nouveaux triangles
int transp2 = 100;

noFill();
stroke(vert,transp2);
triangle(random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4));

stroke(rouge,transp2);
triangle(random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4));

stroke(bleu,transp2);
triangle(random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4),random(Val3,Val4));



}



