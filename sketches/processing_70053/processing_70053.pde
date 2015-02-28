
class Particule
{
  //Membres vars de la classe
  float x=0;
  float y=0;
  float d=5;
  float vx=0;
  float vy=0;

  //Constructeur
  Particule(float x_, float y_)
  {
    this.x = x_;
    this.y = y_;
    this.d = random(10, 90);
    this.vx = random (-3, 3); 
    this.vy = random (-3, 3);
  }

  //Methode
  void display()
  {
    
    this.x = this.x + this.vx;
    this.y = this.y + this.vy;

      ellipse(this.x, this.y, this.d, this.d);
  }
}; 

//Particule p01 = ... ;


