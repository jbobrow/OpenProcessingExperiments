
class Ball {
  int Diameter=2;
  float r=255;
  float posX=250;
  float posY=250;
  float speedX=3;
  float speedY=2;


  void move() {
    fill(r, 100);
    ellipse(posX, posY, Diameter, Diameter);
    posX+=speedX;
    posY+=speedY;

    if (posX > width) { 
      posX = 0;
    }
//    if (posX < 0){
//      posX= width;
//    }

    if (posY > height){
      posY = 0;
    }

//    if (posY < 0){
//      posY = height;}

    if (speedY < 2)
    {
      Diameter = 7;
//      r = 200;
    }

    if (speedY < 1.6)
    {
      Diameter = 4;
//      r = 150;
    }

    if (speedY < 1.2)
    {
      Diameter = 2;
//      r = 100;
    }
  }
}



