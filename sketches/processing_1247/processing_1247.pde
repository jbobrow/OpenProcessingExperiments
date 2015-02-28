
int mode = 0;
int nbr =10;
Dot[] d = new Dot[nbr];

void setup(){
  size(400, 400);
  background(0, 0, 255);
  smooth();
  for (int i=0; i<d.length; i++){
    d[i] = new Dot(random(width), random(height), random(-5, 5), random(-10, 10), random(10,100), i, d);
  } 
} 
void mouseReleased(){
  mode=0; 
  for (int i=0; i<d.length; i++){
    d[i] = new Dot(mouseX, mouseY, random(-5, 5), random(-10, 10), random(10,50), i, d);
  }

}

void mousePressed(){
  mode=1;
}

void draw(){
  background(0);
  for (int i=0; i<d.length; i++){
    if (mode==0){
      d[i].bouger();
    } 
    else{
      d[i].maison();
    }
    d[i].afficher();
    d[i].relier();
  }

}
class Dot{
  float x, y;
  float vx, vy;
  float r;
  float g = 0.1;
  float f = .99;
  int id;
  Dot[] lesAutres;
  Dot(float xpos, float ypos, float velx, float vely, float rayon, int idme, Dot[] otherid){
    x  = xpos;
    y  = ypos;
    vx = velx;
    vy = vely;
    r  = rayon;
    id = idme ;
    lesAutres = otherid;
  }
  void afficher(){
    noStroke();
    fill(255, 50);
    ellipse(x, y, r, r); 
    fill(255);
    ellipse(x, y, 5, 5); 
  }
  void maison(){
    x +=  (mouseX - x) * 0.05;
    y +=  (mouseY - y) * 0.05;
  }
  void bouger(){
    vy*= f;
    vy+= g; 
    if (y + r/2 >height){
      y  = height- r/2;
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
  void relier(){
    for (int i = id+1; i < d.length; i++){
      float dist2 = dist(lesAutres[i].x, lesAutres[i].y, x, y) ; 
      if (dist2<127){
        stroke(255, (-dist2*2)+255);
        line(lesAutres[i].x, lesAutres[i].y, x, y);
      }
      else{
        noStroke(); 
      }
    } 
  }
}






