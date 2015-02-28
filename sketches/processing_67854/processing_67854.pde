
//Creado por Nieva Ortega Jair Ivan 
int x,y;
void setup(){
  size(400,400);}
void draw(){
  background(230);
  noFill();
  strokeWeight(5);
  smooth();
  x=int (random(400));
  y=int (random(400));
  if((x!=160) && (y!=50)){
    stroke(255,0,0);
    ellipse(x,y,50,50);
  }
  else{
   stroke(250,0,0);
   ellipse(160,50,50,50);
   noLoop();
  }
  noFill();
  stroke(0,0,255);
  ellipse(50,50,50,50);
  noFill();
  stroke(255,255,0);
  ellipse(75,75,50,50);
  noFill();
  stroke(0);
  ellipse(105,50,50,50);
  noFill();
  stroke(0,255,0);
  ellipse(130,75,50,50);
  }

