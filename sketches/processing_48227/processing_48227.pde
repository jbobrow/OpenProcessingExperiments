
class carClass{
  
  carClass(){};
  
  void paint(){
    r = random(50, 255);
    g = random(50, 255);
    b = random(50, 150);
  }
  
  void drive(){
    tint(r, g, b);
    image(car, carX, 244);
    carX = carX - 25;
    noTint();
  }
  
}

