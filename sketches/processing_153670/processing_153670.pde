
int x1 = -600 ;
int x2 = 0 ;
int x3 = -600 ;
int x4 = 0 ;
int xb = -300 ;
 
int xt = 850 ;
 
PFont Josefin ;
 
PImage barca ;
PImage onda ;
PImage onda2 ;
PImage onda3 ;
PImage onda4 ;

 
void setup() {
  size(800,600);
  background(255);
  noStroke();
  ellipseMode(CENTER);
  barca = loadImage("barca.png");
  onda = loadImage("onda.png");
  onda2 = loadImage("onda2.png");
  onda3 = loadImage("onda3.png");
  onda4 = loadImage("onda4.png");


  frameRate(20);
}
 
void draw() {
  background(150,255,255);
   
  
//Barca
  image(barca,xb,70,774,660) ;
  
  xb = xb + 1 ;
  if (xb > 850) {
    xb = -300 ;
  }
  
   
   
//Onde
  image(onda,x1,0,1400,800) ;
  x1 = x1 + 5 ;
  if (x1 > 0) {
    x1 = -600 ;
  }
  image(onda2,x2,0,1400,800) ;
  x2 = x2 - 4 ;
  if (x2 < -600) {
    x2 = 0 ;
  }
  image(onda3,x3,0,1400,800) ;
  x3 = x3 + 3 ;
  if (x3 > 0) {
    x3 = -600 ;
  }
  image(onda4,x4,0,1400,800) ;
  x4 = x4 - 2 ;
  if (x4 < -600) {
    x4 = 0 ;
  
  }
}


