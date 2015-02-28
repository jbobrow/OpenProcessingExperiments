
int k=-180;void setup(){
  
size(400,400);
ellipseMode(CENTER);
rectMode(CENTER);
}
void draw(){
  background(0);
 
ellipse(k+mouseX+200,k+mouseY+100,100,100);
rect(k+mouseX+200, k+mouseY+200, 60, 100);
rect(k+mouseX+120, k+mouseY+180, 100, 30);
rect(k+mouseX+280, k+mouseY+180, 100, 30);
fill(0);
filter(BLUR,2);
ellipse(k+mouseX+180,k+mouseY+95,20,10);
ellipse(k+mouseX+220,k+mouseY+95,20,10);
ellipse(k+mouseX+200,k+mouseY+200,5,5);
ellipse(k+mouseX+200,k+mouseY+180,5,5);
ellipse(k+mouseX+200,k+mouseY+220,5,5);
fill(225);
stroke(mouseX,mouseY,2500);



}








