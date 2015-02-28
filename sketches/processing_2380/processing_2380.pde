
/*
Frogs
ak@angelakwong.com
June, 2009

source code inspired by Jean-Michel


*/

int mode = 0; 
int numBalls =25; 
Dot[] d = new Dot[numBalls]; 
 
void setup(){ 
  size(600, 600); 
  background(0, 0, 255); 
  smooth(); 
  for (int i=0; i<d.length; i++){ 
    d[i] = new Dot(random(width), random(height), random(-5, 5), random(-10, 10), random(10,80), i, d); 
  }  
}  
void mouseReleased(){ 
  mode=0;  
  for (int i=0; i<d.length; i++){ 
    d[i] = new Dot(mouseX, mouseY, random(-7, 7), random(-10, 10), random(10,30), i, d); 
  } 
 
} 
 
void mousePressed(){ 
  mode=1; 
} 
 
void draw(){ 
  background(0); 
  for (int i=0; i<d.length; i++){ 
    if (mode==0){ 
      d[i].move(); 
    }  
    else{ 
      d[i].house(); 
    } 
    d[i].display(); 
    d[i].connect(); 
  } 
 
} 
class Dot{ 
  float x, y; 
  float vx, vy; 
  float r; 
  float g = 0.1; 
  float f = .99; 
  int id; 
  Dot[] frog; 
  Dot(float xpos, float ypos, float velx, float vely, float rayon, int idme, Dot[] otherid){ 
    x  = xpos; 
    y  = ypos; 
    vx = velx; 
    vy = vely; 
    r  = rayon; 
    id = idme ; 
    frog = otherid; 
  } 
  void display(){ 
    noStroke(); 
    fill(5, 250,200, 30); 
    rect(x, y, r, r);  
    fill(255); 
    ellipse(x, y, 5, 5);  
  } 
  void house(){ 
    x +=  (mouseX - x) * 0.5; 
    y +=  (mouseY - y) * 5; 
  } 
  void move(){ 
    vy*= f; 
    vy+= g;  
    if (y + r/2 >height){ 
      y  = height- r/3; 
      vy *= -1;  
    } 
    if (x+ r/2>width){ 
      x = width - r/2; 
      vx *= -1 ; 
    } 
    if (x- r/2<0){ 
      x = 0+r/2; 
      vx *= -1;  
    } 
 
    x += vx; 
    y += vy; 
  } 
  void connect(){ 
    for (int i = id+1; i < d.length; i++){ 
      float dist2 = dist(frog[i].x, frog[i].y, x, y) ;  
      if (dist2<127){ 
        stroke(0, (-dist2*4)+255); 
        line(frog[i].x, frog[i].y, x, y); 
      } 
      else{ 
        noStroke();  
      } 
    }  
  } 
} 


