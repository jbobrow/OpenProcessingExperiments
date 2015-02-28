
void setup (){
  size(350,350);
  smooth();
}
 
 
 
void draw ()
{
  //Je déclare des variables pour les valeurs de mes triangles
int Val1 = 50;
int Val2 = 300;
//Je déclare des variables pour les couleurs de mes triangles
color vert = color(0,250,25);
color rouge = color(250,0,25);
color bleu = color(0,0,250);
//Je déclare une variable pour la transparence
int transp = 25;

fill(vert,transp);
noStroke();
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));


fill(rouge,transp);
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));

fill(bleu,transp);
triangle(random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2),random(Val1,Val2));
}



