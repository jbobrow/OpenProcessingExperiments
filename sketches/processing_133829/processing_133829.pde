

// TODO: put all your variable declarations here
float arcX;
float arcY;
float arcW;
float arcH;

void setup() {
  size(600,600);  
  smooth(); 
  background(255);  
}

void draw() {

  arcX = random(600);
  arcY = random(550);
  arcW = random(300);
  arcH = random(350);

  noStroke();
 
  fill(228, 74, 77, 50);
  arc(arcX, arcY, arcW, arcH, 0, HALF_PI);
 
  fill(38, 161, 141, 50);
  arc(arcX+200, arcY-30, arcW, arcH, HALF_PI, PI);
  
  fill(255, 178, 72, 50);
  arc(arcX-100, arcY+60, arcW, arcH, PI, PI+HALF_PI);
  
  fill(32, 76, 87, 50);
  arc(arcX+40, arcY+200, arcW, arcH, PI+HALF_PI, TWO_PI);
}


