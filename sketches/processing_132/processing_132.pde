
float s = 1.20;  // max circle size difference; 
float c = -0.01; // increment or decrement (contract or expand);
float p = 550.0; // start cicle size;
float f = 0.95; // tightness of spiral;  
float e = 5.0; // embedded spiral cooridinate x or y;
float m = 0.8; // embedded spiral multiplier;
int x = 300; // circle origin x;
int y = 300; // circle origin y; 
int i = 0; // increment to repeat embedded spirals;
Crescent drawCrescent; // draws gray circles;

int count = 0; // counter for offset;
float littler1; // randomly offset spiral;
float littler2;
float littler3;  
float littler4;
float littler5;
float littler6;
float littler7;
float littler8;
    
void setup()
{
  size (600,600);
  smooth ();
  background (250,250,0);
  framerate (10);
  drawCrescent = new Crescent(); // class for gray circle
}

void draw()
{
  p = 550.0; // resets variables; spells pies!
  i = 0;
  e = 5.0;
  s += c;
  drawCrescent.topcirc(); // draws initial gray circle
  if (s < 0.70) { // constrains expansion and contraction between if statements
    c = 0.01; 
  };
  if (s > 1.20) { 
    c = -0.01; 
  }; 
  
  
  if (count % 160 == 0)
  {
    
 littler1 = random(-5,5); // randomly offset spiral;    
 littler2 = random(-5,5); 
 littler3 = random(-5,5);   
 littler4 = random(-5,5); 
 littler5 = random(-5,5); 
 littler6 = random(-5,5); 
 littler7 = random(-5,5); 
 littler8 = random(-5,5);  
  
  }
  count++;
          
 for (int i = 0; i <= 20; i++ ) { // for loop to create spiral crescents
    ellipse (x+e+littler1,y+littler2,p*s,p*s); // draws yellow circle, offset x...
    drawCrescent.topcirc(); // calls fucntion to draw gray circle, set p and e, and reset yellow color
    ellipse (x+littler3,y+e+littler4,p*s,p*s); // rotate crescent 90 degrees...
    drawCrescent.topcirc();
    ellipse ((x-e)+littler5,y+littler6,p*s,p*s); // rotate again, offset y slightly...
    drawCrescent.topcirc();
    ellipse (x+littler7,(y-e)+littler8,p*s,p*s); // and again...
    drawCrescent.topcirc();
    e++; // spiral distance from center origin increments once each repetition of for loop
  }
}

class Crescent 
{
  void topcirc() // top gray circle
  {
    stroke (50);
    fill (50);
    ellipse (x,y,p,p);
    p *= f; // redefines circle size, smaller by f
    e *= m; // redefines spiral distance from origin, smaller by m
    stroke (250,250,0);
     fill (250,250,0);
  }
}

