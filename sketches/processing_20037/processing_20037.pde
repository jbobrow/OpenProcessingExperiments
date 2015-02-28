


float linesX = 60; 
float linesY = 30; 
float w = 1200; 
float h = 600; 
float cw = (w)/linesX; 
float ch = (h)/linesY;
int bgc = 10;

ForceLine[] lines = new ForceLine[int(linesX*linesY)];
Attractor[] attractor = new Attractor[12];

int G = 1000;

/////////////////////////////////////////////////////
void setup() {

  size(1200, 600);
  smooth(); 
  noLoop(); 
  
  

  for (int i=0; i < attractor.length; i++) {
    attractor[i] = new Attractor( random(0,600), random(0,1200)  );
  }
  for (int ix = 0; ix<linesX; ix++) {
    for (int iy=0; iy<linesY; iy++) {
      lines[ix+iy*int(linesX)] = new ForceLine(ix*cw,+iy*ch);
    }
  }
}

void draw() {
  background(bgc);

  for (int i=0; i < attractor.length; i++) {
    attractor[i].x = random(width); 
    attractor[i].y = random(height);
    attractor[i].update();
  }  
  for (int i=0; i < lines.length; i++) {
    lines[i].update();
  }
}

void mousePressed() {
  redraw();
}



void keyPressed() {
   saveFrame("final14.capa.jpg");
}

//void mousePressed() {
 // setup();
//saveFrame("final13.1.jpg");

/////////////////////////////////////////////////////

class ForceLine {
  float x,y;
  PVector a; 
  
  ForceLine(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void update() {
    a = new PVector(); 
    for (int i = 0; i < attractor.length; i++) {
      a.add(attractor[i].getAccel(x,y));
    }
    render();
  }
  
  void render() {
    if (a.mag() < 40) {
      stroke(0,0,0);
      
      
     strokeWeight(0);
      fill(255-10*a.x);
       beginShape();
     vertex (x+10,y);
    vertex (x+ 5+a.x,y + a.y+5);
    vertex (x,y+10);    
      vertex  (x+5 + a.x,y+15+a.y);  
   vertex (x+10,y+20);  
   vertex (x+15+a.x,y+15+a.y);  
   vertex (x+20,y+10);
 vertex (x+15+a.x,5+y+a.y);  
    vertex (x+10,y);  
      
     

endShape();



 
       beginShape();
     vertex (x,y-10);
     vertex (x-5+a.x,y + a.y-5);
     vertex (x-10,y);    
       vertex  (x-5 + a.x,y+5+a.y);  
    vertex (x,y+10);  
    vertex (x+5+a.x,y+5+a.y);  
    vertex (x+10,y);
    vertex (x+5+a.x,-5+y+a.y);  
    vertex (x,y-10);  
      
     

endShape();
    }
    
  }
}
/////////////////////////////////////////////////////
class Attractor {
  float x,y;
  
  Attractor(float _x, float _y ) {
    x = _x;
    y = _y;
  }
  
  void update() {
    render(); 
  }
  void render() {
      stroke(255,0,0);
      line(x-4, y, x+4, y);
      line(x, y-4, x, y+4);
  }
  PVector getAccel(float px, float py) {
    PVector a = new PVector(0,0,0); 
      float d2 = sq(dist(px,py,x,y));
      if (d2 > 10) {
        a.x = G * (x-px) / d2;
        a.y = G * (y-py) / d2;
      }
      return a; 

   }
}


