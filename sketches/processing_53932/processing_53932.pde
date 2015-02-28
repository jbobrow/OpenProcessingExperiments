
//y position variable

float y = 0.0;

void setup(){
  //screen size
  size(250, 250);
  //background colour
  background (255);
  smooth();
}

void draw(){
  //sets frame rate to 45
  frameRate (45);
  //center placement
  translate (125,125);
  //no border shapes
  noStroke();
  //rotate at 0.1 plus the y variable so that it would spin
  rotate(PI/0.1+y);
  //draw rectangle that grows in the value of y.  
  rect(0,0,y,y-40);
  //R colour subtracts by y value
  fill(230-y,255,255);
  //draw rectangle that grows in the value of y
  rotate(PI/0.1+y);
  rect(70,70,y,y-40);
  //G colour subtracts subtraction by y value
  fill(150,255-y,244);
  //increase y value by 0.3
  y += 0.3;
  //when y value reaches 100, sets it back to 0
  if (y > 100){
    y= -0.0;
  }
  
  
}
                                
