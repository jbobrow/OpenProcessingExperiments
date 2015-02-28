
float elA = 250;
float elB = 250; 
float elC = 50;
float elD = 50;
float elE = 250;
float elF = 70;


void setup() {
  size (500,500);
  smooth();
  colorMode (RGB, 255, 255, 255, 100);
}

void draw() {
  noStroke();
  fill ( random ( 0, 255) ) ;
  ellipse ( elA, elC, elB, elB);
  elA = random ( 50,255);
  elB = random ( 120,255);
  elC = random ( random ( 0,255) ,250);
  elD = random ( 250,100);
  elE = random ( 120,random(0,255));
  elF = random ( random( 255,0 ), 120);
  
  fill ( 120,20,40 );
  ellipse ( random ( 0,255), random(0,255), random (0 , 255), random( 0,255));
}


void mousePressed(){
  ellipse(random(0,255), random(0,255), elF, elC);
}

void keyPressed(){
   saveFrame("random_enes.png");
}
  

