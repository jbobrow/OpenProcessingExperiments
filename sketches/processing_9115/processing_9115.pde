
//variable, nombre entier (=int); int=integer/"nombre entier"
int compteur = 0;
float vitesseSouris=0;

void setup()
{
 size(400,400); 
}


void draw()
{
 vitesseSouris=dist(mouseX,mouseY,pmouseX,pmouseY)/4;

 //dessiner un carré sur tout l'écran (=fond) en blanc
  //background(255,255,255);
  
    strokeWeight(vitesseSouris);
    

    stroke(random(300),random(300),random(300),100);
    
  //contient la variable du dessin précédent
  line(pmouseX,pmouseY,mouseX,mouseY);
  
  ellipse(pmouseX,pmouseY,vitesseSouris,vitesseSouris);
  

}
void mousePressed()
{
 compteur=compteur+3; 
}

