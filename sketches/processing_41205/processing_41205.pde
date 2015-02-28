
Carro miCarro1;
Carro miCarro2;
Carro miCarro3;

void setup () {
  size(600, 450);
  miCarro1 = new Carro(3,30, 5);
  miCarro2 = new Carro(5, 150, 10);
  miCarro3 = new Carro(2, 375, 3);
}

void draw() {
  background(127);
  miCarro1.move();
  miCarro1.bounce();
  miCarro1.drawCar();
  
  miCarro2.move();
  miCarro2.bounce();
  miCarro2.drawCar();
  
  miCarro3.move();
  miCarro3.bounce();
  miCarro3.drawCar();

}

class Carro {

  int x_speed;
  int x_position;
  int y_position;
  int carScale;
  color c;


  Carro(int n, int m, int o) {
    c = color(255, 0, 0);
    x_speed = n;
    y_position = m;
    carScale = o;
    x_position = 1;
  }

  void move() {
    x_position += x_speed;
  }

  void bounce() {
    if ((x_position >= width - 180/carScale) || (x_position <= 0)) {
      x_speed *= -1;
    }
  }

  void drawCar() {
    fill(c);
    rect(x_position, y_position, 18*carScale, 8*carScale);
    fill(0);
    ellipse(x_position+3.5*carScale, y_position+7.5*carScale, 4*carScale, 4*carScale);
    ellipse(x_position+15*carScale, y_position+7.5*carScale, 4*carScale, 4*carScale);
    fill(254);
    ellipse(x_position+3.5*carScale, y_position+7.5*carScale, 1.8*carScale, 1.8*carScale);
    ellipse(x_position+15*carScale, y_position+7.5*carScale, 1.8*carScale, 1.8*carScale);
    fill(80, 150, 230);
    rect(x_position+.8*carScale, y_position+.8*carScale, 5*carScale, 3*carScale);
    rect(x_position+6.6*carScale, y_position  + .8*carScale, 5*carScale, 3*carScale);
    }
}

