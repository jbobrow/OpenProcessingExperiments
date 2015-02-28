
PImage img; 
ArrayList pincel1; 
 
 
void setup(){ 
  size(680,460, P3D); 
  smooth(); 
  pincel1 = new ArrayList(); 
  background(255); 
  pincel2(); 
  img = loadImage("alcoba.jpg"); 
} 
color pal(PImage i, int x, int y){ 
  color c = i.get(x,y); 
  return c; 
} 
 
void draw(){ 
   for(int i = 0; i < pincel1.size(); i++){ 
    Pincel p = (Pincel)pincel1.get(i++); 
    p.dibuja(); 
  } 

} 
 
void pincel2(){ 
  int sp = 100; 
  for(int i = 20; i < height/3; i++){ 
    Pincel p = new Pincel(0, i); 
    p.ang = 100; 
    pincel1.add(p); 

  }  
} 
class Pincel{ 
  int x, y; 
  float ang, rad; 
  int seed; 
 
  Pincel(float px, float py ){ 

    seed =round(random(10)); 
  } 
 
 
  void dibuja(){ 
    noiseSeed(seed); 
    ang += (random(second()/random(-100, 100)) / 3); 
 
    x += (cos(ang)*15); 
    y += (sin(ang)*15);

    fill (pal(img, x, y)); 
 
    noStroke(); 
  ellipse(x,y,random(3, 6),random(10, 30)); 

 
    if (x < 0) x += width*2; 
    if (y < 0) y += height*2; 
    if (x > width) x -= width*10; 
    if (y > height) y -= height*10;
 
  } 
} 
 
void mousePressed(){  
  saveFrame("mini.jpg");  
  println("fotograma grabado");} 
 
 
 


