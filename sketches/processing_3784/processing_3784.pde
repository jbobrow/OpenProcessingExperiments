


//extraido de  Class Ejemplos

PImage img;
ArrayList pinceles;


void setup(){
  size(400,400);
  smooth();
  pinceles = new ArrayList();
  background(255);
  masPinceles();
  img = loadImage("ritoque.jpg");
  colorMode (HSB);
}
color pal(PImage i, int x, int y){ //función para atrapar el color de la foto
  color c = i.get(x,y);
  return c;
}

void draw(){
  for(int i = 0; i < pinceles.size(); i++){
    Pincel p = (Pincel)pinceles.get(i);
    p.dibuja();
  }
  fill(255,5);//crea el velo
  rect(0,0,640,427);
}

void masPinceles(){
  int sp = 0;
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
    /*entre más alto queda el radio, más rápido se llena la pantalla
     de los pínceles en forma de espirales abiertas. Elegí dejarlo en 2 para obtener
     un resultado más parecido a la lluvia.*/
    seed = round(random(10000000));
  }


  void dibuja(){
    noiseSeed(seed);
    ang += (noise(millis()/random(3500,4500)) - 0.5) * HALF_PI;

   // x += round(cos(ang) * rad); 
    y += round(sin(ang) * rad+4);//la curvatura del pincel y solo cae desde arriva




    float h,s,b; 
    h = hue (pal(img, x, y)) +random(180,240); 
    s = saturation (pal(img, x, y))+random(50); 
    b = brightness (pal(img, x, y)) +random(40); 
    fill(h,s,b);
    //strokeWeight(random(1,PI*(random(2,4))));
    noStroke();
    ellipse(x,y,4,4); //figura de las gotas

    if (x < 0) x += width;
    if (y < 0) y += height;
    if (x > width) x -= width;
    if (y > height) y -= height;//el pincel no escapa del marco

  }
}

void keyPressed(){ 
  saveFrame("mini.jpg"); 
  println("fotograma grabado");
}







