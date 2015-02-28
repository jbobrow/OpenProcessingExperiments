


//extraido de  Class Ejemplos

PImage img;
ArrayList pinceles;


void setup(){
  size(700,700);
  smooth();
  pinceles = new ArrayList();
  background(255);
  masPinceles();
  img = loadImage("ritoque.jpg");
  colorMode (HSB);
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
    rad =4;
   
    seed = round(random(10000));
  }


  void dibuja(){
    noiseSeed(seed);
    ang += (noise(millis()/random(3500,4500)) - 0.5) * PI;


    y += round(cos(ang) * rad+10);



    float h,s,b; 
    h = hue (pal(img, x, y)) +random(10,50); 
    s = saturation (pal(img, x, y))+random(100); 
    b = brightness (pal(img, x, y)) +random(40,80); 
   
    if ( keyPressed == true){
       fill(pal(img, x, y)); 
    }
    else {
    fill( h-10,s-10,b+10);
    }
    noStroke();
    ellipse(x,y,5,5); //figura de las gotas

    if (x < 0) x += width; 
    if (y < 0) y += height; 
    if (x > width) x -= width; 
    if (y > height) y -= height;//el pincel no escapa del marco 

  }
}

void mousePressed(){   
  saveFrame("mini.jpg");   
  println("fotograma grabado"); 
}  
 








