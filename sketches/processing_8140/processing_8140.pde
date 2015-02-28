
//Un poisson nommé Tantale

void setup(){

background(255);
size(500,500);
smooth();

//gère la vitesse de lecture de la boucle
frameRate(15);

strokeWeight(2);
}

void draw(){

  background(255);
  
  /*déclaration de variable pour utiliser 
  la même valeur sortie aléatoirement 
  à plusieurs  endroits en même temps*/
  float a=random(0, 20);
  
  //bouche
  line(mouseX-50,mouseY+30,mouseX-30,mouseY+30-a);
  line(mouseX-50,mouseY+30,mouseX-30,mouseY+30+a);
  
  //corps
  line(mouseX-70,mouseY-20,mouseX-30,mouseY+30-a);
  line(mouseX-100,mouseY-20,mouseX-70,mouseY+50);
  line(mouseX-100,mouseY+45,mouseX-70,mouseY-20);
  line(mouseX-100,mouseY-20,mouseX-100,mouseY+45);
  line(mouseX-70,mouseY+50,mouseX-30,mouseY+30+a);
  
  //oeil
  line(mouseX-50,mouseY+25,mouseX-50,mouseY+23);
 
}

