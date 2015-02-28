
class Snow {
  float x = random(width);
  float y = random(-10,0);
  int dia;
  float spd = random(-0.5,1.0);

  Snow(float tmpX, float tmpY, int tmpDia) {
    x = tmpX;
    y = tmpY;
    dia = tmpDia;
  }

  void move() { 
    x += random(-spd, spd);
    y += random(1.0);

//    if(x > width || x < 0){
//      x *= -1;
//    }

    if (y > height + dia) {
      x = random(width);
      y = 0;
      spd = random(-1.0,1.0);
    }
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, dia, dia);
  }
}


