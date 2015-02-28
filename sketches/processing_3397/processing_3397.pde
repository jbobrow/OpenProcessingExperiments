
Pincel p;


void setup(){
  size(800, 400, P3D);
  background(0);
  smooth();
  p = new Pincel();
}


void draw(){
  p.dibuja();
}


class Pincel{
  float x, y, z;
  float diam;
  color col;

  Pincel(){
    x = random(width);
    y = noise(height);
    z = random(width/height);
    diam = 30;
   col = color(random(120,200), noise(50,150), height*2, z);
  }

  void dibuja(){
    calc();

    fill(random(250,260),random(240,250),random(55,60));
    ellipse(x,y, diam, diam); 
    ellipse(x,y, z, diam/2);
    rect(x,y,z,diam/PI);
  }

 void calc(){
    x += random(-100, 200);
    y += random(-100, 100);
    
    x = x % width*PI;
    y = y % height;
    
    if (x < 0) x *= -100;
    if (y < 0) y *= -100;
   
   
  }
}


void mousePressed(){
 p.diam += 1; 
}

void keyPressed(){
  saveFrame("ojitos.jpg");
  println("fotograma grabado");
}



