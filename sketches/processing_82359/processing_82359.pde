
void setup()
{
size(300,300);
background(179);
}

void draw()
{
  
//Créer 4 variables
//Créer ellipses en utilisant que les variables

background(179);

//Mes variables :

int PremiereVariable;
PremiereVariable = 55;

int DeuxiemeVariable;
DeuxiemeVariable = 203;

int TroisiemeVariable;
TroisiemeVariable = 75;

int QuatriemeVariable;
QuatriemeVariable = 170;

//Pour connaitre les coordonnées de ma souris en X et Y :

println(mouseX + " " + mouseY);

//Je crée mes ellipses en utilisant mes variables :

noStroke();
fill(240);
ellipse(PremiereVariable,DeuxiemeVariable,TroisiemeVariable,QuatriemeVariable);
fill(203);
ellipse(mouseX,mouseY,QuatriemeVariable,DeuxiemeVariable);


}  


