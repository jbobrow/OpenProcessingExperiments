
Pincel[] p;


void setup(){
  size(500, 500);
  noLoop(); 

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
 // velo();
}


class Pincel{
  float x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 10;
    col = color(100);
    edad = 1;
    edadMax = round(random(500, 1000));
  }

  void dibuja(){
    calc();
    noStroke();
    
    fill(col);
     float angle = map(millis(), 0, width, 0, PI); 
  translate(208,208); 
  rotate(angle); 

    rect(x,y, 3*diam, diam); 
    
    fill(100, 100, 0);
    rect(x,y, diam/2, diam/2);
  }

  void calc(){
    x += random(-2, 2);
    y += random(-2, 2);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    if(edad >= edadMax) col = color(0);
  }
}


void mousePressed(){
  for(int i = 0; i < 100; i++){
    p[i].col = color(red(p[i].col+40) + random(-100, 10), green(p[i].col)  + random(-10, 100), blue(p[i].col)  + random(-50, 50));
  }
}

void velo(){
  fill(0,10);
  rect(0,0,width, height); 
}

void keyPressed(){ 
  redraw();  
} 





