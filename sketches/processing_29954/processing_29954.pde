
class Bola {

  float x, y, d;
  float vx, vy;
  float vel;
  
  color c;
 
  Bola(float x_, float y_, float d_, float vel_) {
    x = x_; y = y_; d = d_;
    vel = vel_;
    c = color(200, 200, 0);
  }

  void velocidad() {
    for (int i = 0; i < flechas.size(); i++) {
      Flecha f = flechas.get(i);
      if (dist(f.x, f.y, x, y) < 5) {
        if (f.estado == 0) {
          vx = vel;
          vy = 0;
        }
        if (f.estado == 1) {
          vx = 0;
          vy = vel;
        }
        if (f.estado == 2) {
          vx = -vel;
          vy = 0;
        }
        if (f.estado == 3) {
          vx = 0;
          vy = -vel;
        }        
      }
      
      if (dist(f.x, f.y, x, y) < 2*f.l) {      
        f.bolaEncima = true;
      }
    }
  }

  void draw() {
    
    velocidad();
    
    x = x + vx;
    y = y + vy;
    
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
    
    //noFill();
   // strokeWeight(10);
   // stroke(c);
    
    //ellipse(x, y, d, d);
    piraa(x,y,d);
    
    
    
  }
  

  void piraa(float miX, float miY, float miW){
    fill (0,0,255);
ellipse (miX + miW/4,miY,miW,miW/2);

//beginShape(TRIANGLE_FAN);
//vertex(miX + miW/4 -miW/2, miY);
//vertex(miX + miW/4 , miY/3); 
//vertex(miX + miW/4 -miW, miY); 
//vertex(miX, miY+2); 
//vertex(miX/2, miY); 
//vertex(miX, miY/3); 
//vertex(miX + miW/4 -miW/2, miY);
//vertex(miX + miW/4 , miY/3); 
//vertex(miX + miW/4 -miW, miY); 

//vertex(miX - miW/2, miY);
//vertex(miX + miW/4-miW/2 , miY/3); 
//vertex(miX + miW/4-miW/2, miY); 
//vertex(miX + miW/4 - miW, miY); 
//vertex(miX + miW/4, miY); 
//vertex(miX, miY/3); 
//ndShape();
rect (miX-miW/2,miY-miW/3,miW/3,miW/3);

ellipse (miX+miW/2,miY,miW/10,miW/10);
fill (255,0,0);
ellipse (miX+miW/2,miY,miW/16,miW/16);

float d = (miW/4)/4;

fill (255);

beginShape(TRIANGLES);
vertex(miX+miW/2+d, miY);
vertex(miX+miW/2+d+d, miY);
vertex(miX+miW/2+d+(d/2), miY+(2*d));

vertex(miX+miW/2+d+d+(d/2), miY);
vertex(miX+miW/2+d+d, miY + (2*d));
vertex(miX+miW/2+(d*3), miY+(2*d));

vertex(miX+miW/2+(d*3), miY);
vertex(miX+miW/2+(d*4), miY);
vertex(miX+miW/2+(d*3)+(d/2), miY+(2*d));

endShape();

  }
}

