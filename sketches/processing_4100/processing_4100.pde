
ArrayList list; 

float r, g, b, variable = 10; 
float size = 8; 
float sizeNorm = 4; 
 
PGraphics lineas; 
 
void setup() { 
  size(600, 700); 
  background(#3C0052); 
  r = random(355);  
  g = random(255); 
  b = random(100); 
  list = new ArrayList(); 

  lineas = createGraphics(width, height, JAVA2D); 
  lineas.smooth(); 

} 
int k; 
int m = -22; 
 
void draw() { 
  list.add(new Ball(width/2, height/2, 0, 0, r, g, b, variable / 2)); 
  r += random(-variable, variable); 
  g += random(-variable, variable); 
  b += random(-variable, variable); 
     
  if(mousePressed) {
   if(mouseButton == LEFT) sizeNorm += 1; 
   else sizeNorm = max(sizeNorm-1, 0); 
  } 
   
  m =5;
  if(keyPressed) { 
    if(key == 'l') { 
      m = -5; 
    } 
  } 
  k = (int)random(list.size()); 
   
  lineas.beginDraw(); 
  lineas.background(0, .8); 
  for(int a = 0; a < list.size(); a++) { 
    Ball b = (Ball) list.get(a); 
    b.run(); 
  } 
  Ball b = (Ball) list.get(k); 
  size = min(sizeNorm/dist(b.x, b.y, mouseX, mouseY), 10); 
  if(keyPressed & key == 'k') { 
    size = 4; 
  } 
  for(int a = 0; a < list.size(); a++) { 
    b = (Ball) list.get(a); 
    b.show(); 
  } 
  lineas.endDraw(); 
  image(lineas, 0,0); 
} 
 
class Ball { 
  float x, y, dx, dy;  
  float ox, oy; 
  float r, g, b, variable; 
   
  Ball(float x, float y, float dx, float dy, float r, float g, float b, float v) { 
    this.x = x; 
    this.y = y; 
    this.dx = dx; 
    this.dy = dy; 
    this.r = r; 
    this.g = g; 
    this.b = b; 
    variable = v; 
  }   
   
  void run() { 
    ox = x; 
    oy = y; 
//    x += dx; 
//    y += dy; 
//    dx += (mouseX-x)/100; 
//    dy += (mouseY-y)/100; 
    float ang = atan2(mouseY-y, mouseX-x); 
    float dist = dist(x, y, mouseX, mouseY); 
    if(dist == 0) return; 
    x += 25*cos(ang)/sqrt(dist)*m; 
    y += 25*sin(ang)/sqrt(dist)*m; 
//    size = 10/dist; 
  } 
   
  void show() { 
    r += random(-variable, variable); 
    g += random(-variable, 250); 
    b += random(-variable, variable); 
    lineas.strokeWeight(size); 
    lineas.stroke(color(r, g, b, variable)); 
    lineas.line(x, y, ox, oy); 
  } 
} 


