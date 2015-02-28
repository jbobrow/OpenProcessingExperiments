
class Alcool{

  PImage img;
  float x;
  float y;
  float carreX;
  int carreLargeur;
  int carreHauteur;
  float vitesse;
  
  Alcool(float x, float y, PImage img, float carreX, int carreLargeur, int carreHauteur) {
  this.x = x;
  this.y = y;
  this.img = img;
  this.carreX = carreX;
  this.carreLargeur = carreLargeur;
  this.carreHauteur = carreHauteur;
  
   vitesse = random(1,7);
  }


  void draw() {

    y = y + vitesse;
    image(img,x,y);
    fill(0,0,0,0);
    rect(carreX, y, carreLargeur, carreHauteur);

  }






}//Fin class Alcool

