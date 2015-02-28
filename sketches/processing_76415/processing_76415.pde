
float angle;
float circleRadius;
int fillHue;


void setup(){
  size(800, 600);
  background(0);
  angle = 1;
  circleRadius = 5;
  fillHue = 0;
}

void myDraw(float c,  float d){
   float a = (circleRadius)*cos(radians(angle));
   float b = (circleRadius)*sin(radians(angle));
  
  ellipse(a+c, b+d, 20, 20);
  angle+=137.5;
  circleRadius+=.3;

//Trying to get the reset to work.  
/*  if ((c <= 0) || (c >= width)) {
    println("OMG?");
    c = width/2;
    d = height/2;
    fill(0);
  } */
}

void myDraw2(float c, float d){
  float a = (circleRadius)*cos(radians(angle/10)*.1);
  float b = (circleRadius)*sin(radians(angle)); 
  
  ellipse(a+c, b+d, 20, 20);
  angle+=-7;
  circleRadius+=.3;

// Trying to get the reset to work. 
/*  if ((c <= 0) || (c >= height)) {
    println("OMG!");
    c = width/2;
    d = height/2;
    fill(0);
  } */
}
  
void draw(){
  //First Function Button
  rect(50, 50, 50, 50);
  fill(0);
  textSize(28);
  text("F1", 60, 85);
  noFill();
  fill(255);
  if((mouseX > 50) && (mouseX < 100) && (mouseY > 50) && (mouseY < 100)){
    if(mousePressed){
      myDraw2(570, 400);
    }
  }
  
  //Second Function Button
  rect(50, 150, 50, 50);
  fill(0);
  textSize(28);
  text("F2", 60, 185);
  noFill();
  fill(255);
  if((mouseX > 50) && (mouseX < 100) && (mouseY > 150) && (mouseY < 200)){
    if(mousePressed){
      myDraw(430, height/2);
    }
  }
  
  //Clearing the Screen
    //Second Function Button
  rect(50, 250, 50, 50);
  fill(0);
  textSize(28);
  text("C", 65, 285);
  noFill();
  fill(255);
  if((mouseX > 50) && (mouseX < 100) && (mouseY > 250) && (mouseY < 300)){
    if(mousePressed){
      background(0);
    }
  }
   
      
  
}


