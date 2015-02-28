
// j'intègre des images
PImage vac;
PImage clope;

 
void setup(){
  size(800,500);}
  
  void draw ()
{

  //On va générer du glitch grâce à cette deuxième partie
vac = loadImage("vac.jpg");
clope = loadImage("clope.jpg");
  blend(clope, mouseY,mouseY,mouseX,mouseX,0,0,800,500,SOFT_LIGHT);
  blend(vac, mouseX, mouseX, mouseY, mouseY, 0, 0, 800,500,DIFFERENCE);

/* Différent type de blend qui m'intéresse
DIFFERENCE,HARD_LIGHT, SOFT_LIGHT, OVERLAY
*/
}



