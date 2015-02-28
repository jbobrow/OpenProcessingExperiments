
Walker w;

void setup() {
  size(800,600);
  w = new Walker();
  background(255);
  noStroke();  
}

void draw() {
  w.display();
  w.step();
}

class Walker {
 
  int x =  width/2;
  int y = height/2;
  int size = 10;
  int alpha = 255;
  
 void display() {
   pushMatrix();
     translate(x, y);
     rotate( random(0,TWO_PI) );
      fill(0,alpha);
      rect(0,0, size, size);
   popMatrix();
 } 
 
 void step() {
    int xchoice = int(random(3))-1;
    int ychoice = int(random(3))-1;
    x += xchoice*5;
    y += ychoice*5;
    size = (int)random(10,100);
    alpha = (int)random(0,5);
    if( x > width )
      x = 0;
    else if( x<0)
      x = width;
    if ( y > height )
      y = 0;
    else if ( y<0 )
      y = height;
  }
 
}


