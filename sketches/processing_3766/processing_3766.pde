
//Inspired by Class Exampless
//Thanks 5th Class!
PImage img;
ArrayList pinceles;


void setup(){
  size(900,675);
  smooth();
  pinceles = new ArrayList();
  background(255);
  masPinceles();
  img = loadImage("ritoque.jpg");
  noStroke();
}
color pal(PImage i, int x, int y){ //función para atrapar el esquivo color
  color c = i.get(x,y);
  return c;
}

void draw(){
  for(int i = 0; i < pinceles.size(); i++){
    Pincel p = (Pincel)pinceles.get(i);
    p.dibuja();
  }
}

void mousePressed(){
  Pincel p = new Pincel(mouseY, mouseX);//cambio de eje con respecto a x e y
  pinceles.add(p);
}

void masPinceles(){
  int sp = 40;
  for(int i = 0; i < height; i+= sp){
    Pincel p = new Pincel(0, i);
    p.ang = 0;
    pinceles.add(p);
  } 
}
class Pincel{
  int x, y;
  float ang, rad;
  int seed;

  Pincel(float px, float py){
    x = round(py); // desde arriba y desde abajo
    y = round(px);
    rad = 8;
    seed = round(random(1000));
  }


  void dibuja(){
    noiseSeed(seed);
    ang += (noise(millis()/random(3500,4500)) - 0.5) * HALF_PI;

    x += round(cos(ang) * rad);
    y += round(sin(ang) * rad);//la curvatura del pincel

    if(keyPressed == true){//acá aparecen los pinceles borradores
      fill(255);
      ellipse(x,y,30,30);
    } 
    else {//se pinta de forma normal
      fill(pal(img,x,y));
    }
    ellipse(x,y,random(5,15),random(5,15)); 

    if (x < 0) x += width;
    if (y < 0) y += height;
    if (x > width) x -= width;
    if (y > height) y -= height;//el pincel no escapa del marco


  }
}



//HELL YEAH!!!
//nota: los puntos negros de los bordes me son inexplicables














