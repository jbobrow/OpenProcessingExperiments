
float x,y;

void setup(){

 size(400, 400);
 noFill();
 smooth(); 

}

void draw(){
  
  background(255,255,255);
  
  stroke(0,0,255);
  strokeWeight(4);   
  ellipse(100, 100, 50, 50);
  
  stroke(0,0,0);
  strokeWeight(4);   
  ellipse(160,100 , 50, 50);
  
  stroke(255,0,0);
  strokeWeight(4);
  x = random(400);
  y = random(400);
  ellipse(x, y, 50, 50);
  
  
  stroke(255,255,0);
  strokeWeight(4);   
  ellipse(130,130 , 50, 50);
  
  stroke(0,255,0);
  strokeWeight(4);   
  ellipse(190,130 , 50, 50);
  
  if( (x >= 210.0 && x <= 230)  && (y >= 90 && y <= 110))
    noLoop();
  
}



