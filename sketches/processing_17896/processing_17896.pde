
void setup(){
 
background(250);
size(600,600);
smooth();
 //gère la vitesse de lecture de la boucle
frameRate(14);

strokeWeight(2);
}
 
void draw(){
 
   
  if (mousePressed == true) {
    
  /*déclaration de variable pour utiliser
  la même valeur sortie aléatoirement
  à plusieurs  endroits en même temps*/
  float a=random(0, 20);
   
  stroke(100, 20);
  ellipse(mouseX-36, mouseY+26, mouseX-35, mouseY+35-a);
    
 stroke (219,90,90);
   
  /*oeil*/
  noFill() ;
   line(mouseX-36, mouseY+26, mouseX-35, mouseY+35-a);
 
  }
}

                
                
