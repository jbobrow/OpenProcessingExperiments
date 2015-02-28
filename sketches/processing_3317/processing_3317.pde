
Pincel p;


void setup(){
  size(800, 400);
  background(33,3,28); 
  smooth();
  p = new Pincel();
}


void draw(){
  p.dibuja();
}


class Pincel{
  float x, y;
  float diam;
  color col;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 20;
  }

  void dibuja(){
    calc();
        rotate(dist(mouseX , mouseY , x, y)*millis()*0.000001 );
    fill(156,124,183,random(100,150));
        if (mousePressed){
          fill(185,47,95,125);
        }
    stroke(77,20,124);
    if (mousePressed){
      stroke (245,151,225);
    }
    strokeWeight(2);
    ellipse(x,y , diam, diam); 
    fill(113,55,152);
        if (mousePressed){
          fill(155,56,91);
          
         //usando el mouse cambian los colores de los objetos
        }
    ellipse(x,y, diam/3, diam/3);
    
    rotate(dist(mouseX , mouseY , x, y)*millis()*0.0001 );
    
        fill(234,121,210,random(100,150));
        if (mousePressed){
          fill(229,184,240,125);
        }
    stroke(131,16,107);
    if (mousePressed){
      stroke (79,10,95);
    }
    strokeWeight(2);
    rect(x+20,y+20, diam, diam); 
    fill(250,220,243);
        if (mousePressed){
          fill(234,208,240);
          
        }
    rect(x+27,y+27, diam/3, diam/3);
  }

  void calc(){
    x += random(-50, 50);
    y += random(-50, 50);
    
    x = x % width;
    y = y % height;
    
    if (x < 0) x *= -1;
    if (y < 0) y *= -1;
  }
}


void mousePressed(){
  p.diam += 1; //con el mouse aumenta el tamaño del ellipse
  
}

void keyPressed (){
  p.diam = 0;
    background(33,3,28); 
    //al apretar una tecla los objetos desaparecen, estos vuelven apretando el mouse

}

