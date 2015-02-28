
void setup() {
  size(700, 700);
  background(#FFFFFF);
  smooth();
}
void draw() {
  fill(0, 5);
  rect(0, 0, 900, 900);
  
 noFill();
 noStroke();
  fill(#000000, 47);
  ellipse(mouseX, mouseY,100,100);
 
noFill();

      float r = random(60,300);
     strokeWeight(0.5);
  stroke(mouseX/2, mouseY/2, 0);
      ellipse(mouseX,mouseY,r,r);
      
       float y = random(50,250);
     strokeWeight(0.5);
  stroke(mouseX/2, mouseY/2, 0);
      ellipse(mouseX,mouseY,y,y);
      
       float q = random(25,200);
     strokeWeight(0.5);
  stroke(mouseX/2, mouseY/2, 0);
      ellipse(mouseX,mouseY,q,q);
      
        float t = random(7,150);
     strokeWeight(0.5);
  stroke(mouseX/2, mouseY/2, 0);
      ellipse(mouseX,mouseY,t,t);
      
      
       float v = random(4,50);
      stroke(#ffffff);
      ellipse(mouseX,mouseY+40,v,v);
      float e = random(4,50);
      stroke(#ffffff);
      ellipse(mouseX+40,mouseY,e,e);
        float a = random(4,50);
      stroke(#ffffff);
      ellipse(mouseX,mouseY-40,a,a);
      float b = random(4,50);
      stroke(#ffffff);
      ellipse(mouseX-40,mouseY,b,b);
       

}



