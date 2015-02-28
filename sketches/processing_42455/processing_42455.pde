
void setup() {
  size(500,500);
  background(100,200,180);
  smooth();
}
 
void draw() {
   
  fill(100,200,180,70);
  noStroke();
  rect(0,0,width,height);
  
  fill(255,70);
  stroke(40);
  strokeWeight(2);
  ellipse(mouseY-90,mouseX+15,mouseX/5,mouseX/5);
  ellipse(mouseX-40,mouseY+35,mouseX/3 ,mouseX/3);
  ellipse(mouseY+5,mouseX+70,mouseX/8,mouseX/8);
  ellipse(mouseY+80,mouseX+5,mouseY/10,mouseY/10);
  ellipse(mouseY-10,mouseX-40,mouseY/4,mouseY/4);
  
  
  
   
  //colorati blu
  fill(70,57,200,70);
  ellipse(mouseY-60,mouseX+35,mouseX/4-20,mouseX/4-20);
  ellipse(mouseX-50,mouseY+10,mouseX/4-20,mouseX/4-20);
  ellipse(mouseY-30,mouseX+15,mouseY/4-20,mouseY/4-20);
  ellipse(mouseX+40,mouseY+30,mouseY/4-20,mouseY/4-20);
   
 
  //interni
  strokeWeight(1);
  stroke(255);
  ellipse(mouseY-20,mouseX+85,mouseX/3,mouseX/3);
  ellipse(mouseY+60,mouseX+35,mouseY/5,mouseY/5);
  ellipse(mouseX+40,mouseX+50,mouseY/2,mouseY/2);
   
   
}


