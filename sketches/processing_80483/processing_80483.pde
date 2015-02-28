
void setup()
{
size(800,600);

//Fond de couleur blanc
background(230);
}

void draw()
{
  
//Contours de couleur noir
stroke(25);

//Remplissage rectangle
fill(230);

//Épaisseur des contours du rectangle 
strokeWeight(60);

//Création rectangle 
rect(200,200,400,200);

//Contours du triangle de couleur noir
stroke(230);

//Remplissage triangle avec variation de couleurs (noir au rouge)
fill(mouseX/3+mouseY/3,mouseX/150+mouseY/150,mouseX/30+mouseY/40);

//Épaisseur des contours du triangle 
strokeWeight(50);

//Création forme triangle
triangle(220,180,400,300,220,420);

}


