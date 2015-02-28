
Car[] cars = new Car[50];

void setup(){
  size (800,800);
  smooth();
  for (int i = 0; i < cars.length; i = i+1){
    cars[i] = new Car (color (random(200)),0,50*i,random(20));
  }
}
void draw () {
  background (155,100,43);
  for (int i = 0 ; i<cars.length; i = i+2){
    cars [i].drive();
    cars [i].display();
  }
}


