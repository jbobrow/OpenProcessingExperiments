
/*
A simple sketch inspired by: 
http://www.flickr.com/photos/simoncpage/4296226201/in/set-72157623099901702/lightbox/

Made by @ramayac
*/

Punto puntos[] = new Punto[50];

class Punto{
  float x, y, s;
  Punto(float x, float y, float s){
    this.x = x;
    this.y = y;
    this.s = s;
  }
}

void setup(){
  size(350, 500);
  noLoop();
  startData();
  stroke(#FFFFFF);
  strokeWeight(0.75);
  smooth();
}

void draw(){
  background(#003042);
  fill(#A54D42);
  
  for(int i = 0; i < puntos.length; i++){
    Punto p = puntos[i];
    
    line(p.x, p.y, width/2, height/2);
    ellipse (p.x, p.y, p.s, p.s);
  }
  
  ellipse(width/2, height/2, 40, 40);
  
  fill(255);
  text("FUTURISM", 250, 480);
}

void startData(){
  for(int i = 0; i < puntos.length; i++){
    float x = random(20, width-20);
    float y = random(50, height-50);
    
    float s = random(10, 35);
    puntos[i] = new Punto(x, y, s);
    //ellipse (x, y, s, s);
  }
}

void mousePressed(){
  startData();
  redraw();
  println(mouseX + ", "+ mouseY);
}
