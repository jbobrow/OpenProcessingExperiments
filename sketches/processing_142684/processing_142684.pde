
int carX = 10 ;

void draw() {
  background(100) ;
  rect(carX, height/2, 50, 25) ;
  carX = carX + 1 ;
  if (carX > width) {
    carX = -20 ;
  }
}
  void setup() {
    size(500, 135) ;
    rectMode(CENTER) ;
  }


