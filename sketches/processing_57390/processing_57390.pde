
float x=250;
float y=250;
float h=100;
float w=100;
int bodyHeight =150;
float easing = 0.02;

void setup(){
  
  size(400, 400);
  background(255);
  smooth();
  
  
}

 
 void draw(){
   background(255);
   int targetX = mouseX; 
  x += (targetX - x) * easing;
  
  if (mousePressed){
    bodyHeight=150;
  }else {
    bodyHeight= 100;
  }
  background(255);
  
  //legR
  line(x, y, x+60, y+60);
 //legL
  line(x, y, x-60, y+60);
 //footR
 fill(161, 86, 237); 
 ellipse(x+60, y+60, w/5, h/5);
 //footL
 ellipse(x-60, y+60, w/5, h/5);

noStroke();
//body
fill(161, 86, 237);
  ellipse(x, y, w, bodyHeight);
    

//head
fill(6, 196, 137);
  ellipse(x, y-50, w-40, h-40);
//eyeL
fill(31, 83, 222);
  ellipse(x-40, y-40, w/2-10, h/2-10);
 fill(0);
  ellipse(x-40, y-40, w/5, h/5);
//eyeR
fill(31, 83, 222);
  ellipse(x+40, y-40, w/2-10, h/2-10);
fill(0);
  ellipse(x+40, y-40, w/5, h/5);



 //eyebrowL
 noFill();
 stroke(0);
 strokeWeight(4);
  arc(x-40, y-40, w-40, h-40, PI, PI+HALF_PI);
  
  //eyebrowR
    arc(x+40, y-40, w-40, h-40, PI+HALF_PI, TWO_PI);

 }

