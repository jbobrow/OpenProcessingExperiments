
//import processing.pdf.*;



//Initialisation du programme
void setup()//void=fct
{
size(400,400);//taille écran
smooth(); //rendu moins pixelisé
frameRate(20); //fréquence d'execution du programme
//beginRecord(PDF,"motif.pdf");
}

//Dessin
void draw()//commande dessin
{
  float rayon = random(50);
  float couleur = random(250);
  float transparence = random(120);
  noStroke();
  fill(couleur,0,0,transparence);
ellipse(mouseX,mouseY,rayon,rayon);
ellipse(400-mouseX,mouseY,rayon,rayon);
ellipse(mouseX,400-mouseY,rayon,rayon);
ellipse(400-mouseX,400-mouseY,rayon,rayon);


}
//
void mousePressed()  //qd on appuis sur la souris 
{
  println("souris!");
 //saveFrame("monImage-#####.jpg");
  
}
//
void exit()//
{
    //endRecord();
    super.exit();

}


