
float offset=100;
float Fade = random(0, 100);
void setup() {
  size(640, 480);
  background(0);
  smooth(2);
}
void draw() {




  color colorEntrada= color(random(100), random(150), random(255), random(255));

  Estrella ( width *0.3 + random(-30, 30), height *0.6 + random(-30, 30), width *0.5 + random(-30, 30), height *0.1 + random(-30, 30), width *0.6 + random(-30, 30), height *0.5 + random(-30, 30), colorEntrada);
}

void Estrella(float x, float y, float ancho, float alto, float Ppoint, float Tpoint, color colorcito) {


  for ( int i =0;i < 0.1;i++) {





    fill(colorcito);

    triangle( x, y, ancho, alto, Ppoint, Tpoint);
    noFill();
    stroke(random(150, 255));
    strokeWeight(0.2);
    triangle(x+random(offset), y+random(offset), ancho+random(offset), alto+random(offset), Ppoint+random(offset), Tpoint+random(offset));
    fill(0, map(mouseX, 0, width, 0, 100));
    rect(0, 0, width, height);
  }
}

