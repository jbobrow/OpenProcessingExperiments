
void setup(){
size(400,600);
background(224,58,25,50);
  
}



void draw(){

  if (frameRate <30) return;

  noStroke();
  fill(67,56,28,50);
  rect(mouseX,mouseY,mouseY,mouseX);
  
 noStroke();
  fill(190,200,209,50);
  ellipse(mouseX,mouseY,random(50-200),random(50-200));
  
 noStroke();
  fill(224,91,25,50);
  ellipse(mouseX,mouseY,random(10-500),random(10-500));
  
 noStroke();
 fill(224,58,25,50);
rect(mouseX,mouseY,random(10-900),random(10-900)); 

 noStroke();
  fill(33,38,49,10);
  ellipse(mouseX,mouseY,random(500-1000),random(500-1000));
  
} 
