
int squareW = 1;
int squareH =1;
int growth = 1; //speed and x intergers
float r;
float g;
float b;

void setup(){
size (400, 300);
rectMode(CENTER); //set it to center mode
background (20, 40, 170);
}

void draw(){
  
  noStroke();
  r = random (255);
  g = random (255);
  b = random (255);
  fill (r, g, b, 60);
  rect (width/2, height/2, squareW, squareH); //draw a square
  squareW = squareW + growth; //x is always adding the speed to itself
  squareH = squareH + growth;
  if (squareW > width || squareW < 0){ //if x gets more than the width OR (||)
  //less than 0
    growth= growth * -1; //than the speed value becomes negative 
  } //therefore x will be ading negative to itself
}
  



