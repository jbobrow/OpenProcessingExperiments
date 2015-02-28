
Pincel[] p;



void setup(){
  size(500, 500);
  colorMode(RGB);
  for (int i = 0; i <500; i++){
    float r = 0 + (i*0.92);
    float g = 0 + (i*0.48);
    float b = 0 + (i*1.43);
    stroke(r,g,b);
    line(i,0,i,500);
  }

  smooth();

  p = new Pincel[100];

  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
  }
}


void draw(){

  for(int i = 0; i < 100; i++){
    p[i].dibuja();
  }

}


class Pincel{
  float x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 30;
    col = color(random(150,255),random(0,70),random(50,230));
    edad = 1;
    edadMax = round(random(500, 1000));
  }

  void dibuja(){
    calc();
    noStroke();

    fill(col);
    ellipse(x,y, diam, diam); 

    fill(255,255,255);
    ellipse(x,y, diam/2, diam/2);
  }

  void calc(){
    x += random(-10, 10);
    y += random(-10, 10);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    if(edad >= edadMax) col = color(0);

  }
  //if(Pincel.color(0) = true) exit();

}
void keyPressed(){
  noLoop();
}

void mousePressed(){
  redraw();
  loop();
}





