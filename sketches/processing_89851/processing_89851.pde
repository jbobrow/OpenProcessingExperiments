
void setup(){
size(200,200);
}

void draw(){
  
 
  if(mouseX<60&&mouseX>20&&mouseY>160&&mouseY<180)
  background(255);
  else 
  background(0);
   fill(255);
  rect(20,160,40,20);
  //face and body
  fill(255,255,0); 
  rect(80,30,40,40);
  rect(80,80,40,80);
  //eye
  fill(0,0,255);
  ellipse(90,40,10,10);
  ellipse(110,40,10,10);
  //mouth
  triangle(90,60,110,60,100,50);
  //buttons
  fill(255,0,0);
  ellipse(100,100,10,10);
  ellipse(100,130,10,10);
  

}

