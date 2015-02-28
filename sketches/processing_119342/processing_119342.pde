
class Obstacle{
  float posX, posY, size;

  Obstacle(float posX, int posY){
    this.posX = posX;
    this.posY = posY;
    size = 50;
  }
  
  void show(){
    stroke(255);
    strokeWeight(5);
    line(posX, posY, posX, posY-size);
  }
  
  void changeSize(float size){
    this.size = size;
  }
  
  void move(int speed){
    posX = posX + speed;
  }

}

