
class Sand { 

  float x;
  float y;

  float dx;
  float dy;

  float p; 
  float g; 
  int c; 
  float w;

  Sand() { 
    x=   random(width/2- 300, width/2 + 300);
    y =  random(height/2 -300, height/2 + 300);

    p = random(1.0); 
    c = int(random(100,256)); 
    g = random(0.01, 0.1);
    dx = random(-0.1, 0.1);
    dy = random(-0.1, 0.1);
    w = random(-0.1, 0.1);
  } 

  void render() {
    stroke(c,c,30, 70);

    x +=  int(dx + (dx)*sin(p + cos(w)));
    y +=  int(dy + (dy)*cos(p + sin(w)));
    point(x, y);

    stroke(c, c, 50,50);

    point( x,y);

    if ( x > width || y > height) {

      x=   random(width/2- 300, width/2 + 300);
      y =  random(height/2 -300, height/2 + 300);
      p = random(1.0); 
      c = int(random(100,256)); 
      g = random(0.01, 0.1);
      dx = random(-0.1, 0.1);
      dy = random(-0.1, 0.1);
    }


    p  += 0.3;
    w  += 0.3;
    dx += 0.1;
    dy += 0.1;
  }
} 


