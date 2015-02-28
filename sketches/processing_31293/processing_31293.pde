
int circleA = 0;
int circleB = 100;

int circleC = 400;
int circleD = 0;

int circleE = 500;
int circleF = 400;

int circleG = 100;
int circleH = 500;

int circleI = 1;
int circleJ = 1;

int circleK = 1;
int circleL = 1;

int circleM = 1;
int circleN = 1;

int circleO = 1;
int circleP = 1;

void setup() {
  size(500,500);
  background(255);
  strokeWeight(0);
}

void draw() {
//draws first circle 
  stroke(255);
  fill(5,110,252,100);
  ellipse(circleA,circleB,200,200);
  
  circleA = circleA +1;

//second circle  
  stroke(255);
  fill(255,0,0,100);
  ellipse(circleC,circleD,200,200);
  
  circleD = circleD + 1; 
 
 //third circle  
  stroke(255);
  fill(255, 0,213,100);
  ellipse(circleE,circleF,200,200);
  
  circleE = circleE -1;  
 
  //fourth circle  
  stroke(255);
  fill(44,160,19,100);
  ellipse(circleG,circleH,200,200);
  
  circleH = circleH -1;  
  
   //first growing circle  
  stroke(255);
  fill(255, 247,0,100);
  ellipse(100,100,circleI,circleJ);
  
  circleI = circleI +2;
  circleJ = circleJ +2;  
  
   //second growing circle  
  stroke(255);
  fill(116,196,255,100);
  ellipse(400,400,circleK,circleL);
  
  circleK = circleK +2;
  circleL = circleL +2;  

   //third growing circle  
  stroke(255);
  fill(243,155,255,100);
  ellipse(400,100,circleM,circleN);
  
  circleM = circleM +1;
  circleN = circleN +1; 
  
    //fourth growing circle  
  stroke(255);
  fill(63,255,0,100);
  ellipse(87,337,circleO,circleP);
  
  circleO = circleO +1;
  circleP = circleP +1; 
}

