
class Car {
  float xP;
  float yP;
  float xMove;
  color CarColor;
  
   Car(color cC, float tXp, float tXy, float tXMove) {
    CarColor = cC;
    xP = tXp;
    yP = tXy;
    xMove = tXMove;
  }
   
  void showCar() {
    if (xP > width - 20 || xP < 0)
      CarColor = color(random(200),random(200),random(200));
    fill(CarColor);
    rect(xP,yP,40,10);
  }
  
  void driveCar() {
    xP = xP + xMove;
   }
    
}

Car[] theCar;
 
void setup(){
  size(500,350);
  theCar = new Car[4];
  for(int i = 1; i < 4; i = i + 1)
    theCar[i] = new Car(color(255),20,i*50+50, random(1,15));
}
 
void draw(){
  background(175);
  for(int i = 1; i < 4; i = i + 1){
    theCar[i].showCar();
    theCar[i].driveCar();
  }
  for(int i = 1; i < 4; i = i + 1){
    if(theCar[i].xP > width - 20 || theCar[i].xP < 0){
      theCar[1].xMove*=-1;
      theCar[2].xMove*=-1;
      theCar[3].xMove*=-1;
    }
  }
}

