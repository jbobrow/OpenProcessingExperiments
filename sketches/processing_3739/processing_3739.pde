
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
  Pincel p = new Pincel(mouseX, mouseY);
  pinceles.add(p);
}

void masPinceles(){
  int sp = 5;
  for(int i = 0; i < height; i++){
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
    x = round(px);      
    y = round(py);
    rad = 6;
    /*entre más alto queda el radio, más rápido se llena la pantalla
    de los pínceles (test it). Por ende elegí dejarlo en 6 para obtener
    un resultado más estable y atractivo.*/
    seed = round(random(100000));
  }


  void dibuja(){
    noiseSeed(seed);
    ang += (noise(millis()/random(3500,4500)) - 0.5) * HALF_PI;

    x += round(cos(ang) * rad);
    y += round(sin(ang) * rad);//la curvatura del pincel
    
   
    

    stroke(pal(img, x, y));
    strokeWeight(random(1,PI*(random(2,4))));
    point(x,y); 
    
    if (x < 0) x += width;
    if (y < 0) y += height;
    if (x > width) x -= width;
    if (y > height) y -= height;//el pincel no escapa del marco

  }
}

//HELL YEAH!!!
//nota: los puntos negros de los bordes me son inexplicables





