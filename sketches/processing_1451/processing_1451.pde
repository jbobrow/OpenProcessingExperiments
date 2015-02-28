
int k=-180;
void setup(){
  size(600,600);
  ellipseMode(CENTER);
  rectMode(CENTER);
}


void draw (){
background(255);
  ellipse(k+mouseX+200,k+mouseY+100,100,100);
  rect(k+mouseX+200,k+mouseY+200,60,100);
  rect(k+mouseX+120,k+mouseY+180,100,30);
  rect(k+mouseX+280,k+mouseY+180,100,30);
  filter(BLUR,2.0);
  ellipse(k+mouseX+200,k+mouseY+200,5,5);
   
  ellipse(k+mouseX+200,k+mouseY+180,5,5);
  ellipse(k+mouseX+200,k+mouseY+220,5,5);
  ellipse(k+mouseX+200,k+mouseY+160,10,10);
  fill(0);
  ellipse(k+mouseX+182,k+mouseY+95,20,15);
  ellipse(k+mouseX+220,k+mouseY+95,20,15);

  stroke(mouseX,mouseY,1800);
 
}


