
//modified by Class Exampless

PImage img;
ArrayList pinceles;


void setup(){
  size(600,600);
  smooth();
  pinceles = new ArrayList();
  background(255);
  masPinceles();
  img = loadImage("ritoque.jpg");
}
color pal(PImage i, int x, int y){ 
  color c = i.get(x,y);
  return c;
}

void draw(){
  for(int i = 0; i < pinceles.size(); i++){
    Pincel p = (Pincel)pinceles.get(i);
    p.dibuja();
  }
  fill(255,2);
  rect(0,0,600,600);
}

void mousePressed(){
  Pincel p = new Pincel( mouseX,mouseY);
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
    x = round(py);      
    y = round(px);
    rad = 2;
   
    seed = round(random(10000000));
  }


  void dibuja(){
    noiseSeed(seed);
    ang += (noise(millis()/random(3500,4500)) - 0.5) * HALF_PI;

    x += round(cos(ang) * rad);
    y += round(sin(ang) * rad+7);




    stroke(pal(img, x, y));
    strokeWeight(random(1,PI*(random(2,4))));
    point(x,y); 

    if (x < 0) x += width;
    if (y < 0) y += height;
    if (x > width) x -= width;
    if (y > height) y -= height;

  }
}
void keyPressed(){  
  saveFrame("mini.jpg");  
  println("fotograma grabado");
} 








