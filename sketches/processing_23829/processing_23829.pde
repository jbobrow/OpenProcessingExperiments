
float beginX = 200.0;
float beginY = 300.0;
float endX = 100.0;
float endY = 240.0;
float distX; 
float distY; 
float exponent = 3.0; 
float x = 0.0;
float y = 0.0; 
float step = 0.01;
float pct = 0.0;

float r=1;

void setup() { 
  size(350, 350); 
  noStroke(); 
  smooth();
distX = endX  - beginX; 
distY = endY  - beginY;

 PImage img;
  img = loadImage("smile.png"); 
  image(img, 0, 0);


}

void draw() { 
smooth();
  fill(0); 
  pct += step; 
  if (pct < 1.0) {
x = beginX + (pct * distX); 
y = beginY + (pow(pct, exponent) * distY);
  }
 fill(255,8,96); 
 noStroke();
 ellipse(x, y, 2, 2);
 


 

  smooth();
  fill(169,232,180);
  ellipseMode(CENTER);
  ellipse(130,150,r,r);
  ellipse(240,150,r,r);
  
  
  // Increase the rectangle size
  r++ ;
  

  if (r > 70) {
    r =0;
    stroke(252,156,190);
  }
}





    





