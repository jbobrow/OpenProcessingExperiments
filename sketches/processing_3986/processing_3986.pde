
//*Basado en "Raices Negras" de Sofía Quintana y en "Brushing Ritoque" de Pablo Reveco

PImage img; 
ArrayList pinceles; 
 
void setup(){ 
  size(900, 675); 
  smooth(); 
  pinceles = new ArrayList(); 
  background(255); 
  masPinceles(); 
  img = loadImage("ritoque.jpg"); 
  colorMode (HSB); 
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
 

 
void masPinceles(){ 
  int sp = 8; 
  for(int i = 0; i < height; i++){ 
    Pincel p = new Pincel(0, i); 
    p.ang = 0; 
    pinceles.add(p); 
  }  
} 
class Pincel{ 
  int x, y, x2, y2; 
  float ang, rad; 
  int edad, edadMax, seed;
  boolean vivo;
 
  Pincel(int px, int py){
    x = px; 
    
    
    edad=0;
    rad = 10;
   edadMax = round(random(1000)); 
   vivo = true;
   seed=round(random(100000));
  } 
 
 
 
  void dibuja(){ 
    // sólo si está vivo 
    if(vivo){ 
      calc(); 
    } 
 
  } 

  void calc(){
    noiseSeed(seed); 
 
    ang += (noise(millis()/2000*PI) - 0.5) * PI/4; 
 
    x2 = round(x + cos(ang) * rad); 
    y2 = round(y + sin(ang) * rad); 
 
float h,s,b;

    h = hue (pal(img, x, y)) + random (20,40); 
    s = saturation (pal(img, x, y)) + random (80); 
    b = brightness (pal(img, x, y)) + random (30,60); 
    

    stroke(h,s,b); 
    strokeWeight(random(1));
   
 line(x,y, x2, y2);
    x = x2; 
    y = y2; 
 
    if (x < 0) x += width; 
    if (y < 0) y += height; 
    if (x > width) x -= width; 
    if (y > height) y -= height; 
 
edad ++; 
    
 
    // y muere si ya es tiempo 
    if(edad >= edadMax) vivo = false; 
 
 
 
  } 
 
} 
 



