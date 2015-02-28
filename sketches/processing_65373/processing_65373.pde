
class Layer{
  color couleur;
  int dia;
  float count;
  float speed=random(.1);
  float currentdia;
  //constructor
  Layer(color Couleur,int Dia){
    couleur=Couleur;
    dia=Dia;
    count=0;
  }
  void display(){
     if((mousePressed)&&(mouseButton==LEFT)){
       count+=speed;
    currentdia=dia*(1-sin(count));
    noStroke();
    fill(couleur,30);
    ellipse(mouseX,mouseY,currentdia,currentdia);   
    }
  }

}


