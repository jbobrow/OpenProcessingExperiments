


float xPos = 0;
float yPos = 0;

float xRot = 0;
float yRot = 0;


void setup(){
  
  size(900, 900);
  frameRate(80);
  smooth();
  
  
  background(50);
  
}

void draw(){

  //background(50);
  fill(50,50,50,100);
  rect(0,0,width,height);
  
   noStroke();
   fill(255,200,200);
  
   //linear
   xPos = map(millis(), 0, 10000, 0, width);
   yPos = map(millis(), 0, 10000, 0, height);
   //xPos += 1;
   //yPos += 1;

  //circular
   xRot = xPos + 100*sin( map(millis(), 0, 1000, 0, TWO_PI));
   yRot = yPos + 100*cos( map(millis(), 0, 1000, 0, TWO_PI));

   ellipse(xRot, yRot, 40, 40);
  
}


