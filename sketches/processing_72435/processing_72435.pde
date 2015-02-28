
//float circleX=0;
//float circleY=0;
float rectX=0;
float rectY=0;

void setup(){
  size(400,400);
  smooth();
  background(0);
}

void draw(){

  
  noStroke();
  stroke(255);
  fill(255,255,255,random(255));
  
 // ellipse(circleX,circleY+5,30,30);
  rect(rectX,rectY+5,15,15);
  
 // circleX=circleX+(frameCount%30);
 // circleX=circleX%width;
  
  rectX=rectX+(frameCount%10);
  rectX=rectX%width;
  
// circleY=circleY+1;
  //circleY=circleY%width;
  
  rectY=rectY+5;
  rectY=rectY%width;
  
}

