
//carolina vallejo
//animar con porcentajes
//processing 0

float xposA;
float xposB;
float yposA;
float yposB;
float perc;

void setup(){
  size (400,400);
  xposA = 0;
  yposA = 400;
  xposB = 400;
  yposB = 0;
  perc = 0;
  
}

void draw(){
  background(200,255,10);
  float myX = (1-perc)*xposA + perc*xposB;
  float myY = (1-perc)*yposA + perc*yposB;
  fill(0,255,200);
  noStroke();
  rect (myX,myY,20,20);
  perc = perc + 0.01;
  if (perc > 1){
   perc = 0; 
  }
  
  
}

void mousePressed(){
 xposB = mouseX;
 yposB = mouseY; 
  
}

