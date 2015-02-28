

void setup() {
  size(500, 500);

  
}


 
void draw() {
  background(255);
   
 
  //head
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 200, 160);
   
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(mouseX-50, mouseY-30, 40, 40);
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(mouseX+50, mouseY-30, 40, 40);
   
  //pupil
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(mouseX-50,mouseY-30,20,20);
   
  //pupil
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(mouseX+50, mouseY-30, 20, 20);
   
   //mouth
  stroke(0);
  strokeWeight(0);
  fill(190,42,56);
  ellipse(mouseX, mouseY+20, 100, 60);
 
   
  //body
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(mouseX, mouseY+200, 250, 300);
   
   
  //bodyyellow
stroke(0);
strokeWeight(0);
fill(246,207,24);
ellipse(mouseX, mouseY+220, 200, 220);
   
   //body
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(mouseX, mouseY+240, 195, 220);
   
    //foot
  stroke(0);
  strokeWeight(0);
  fill(234, 126, 27);
  ellipse(mouseX+70, mouseY+355, 130, 30);
   
   //foot
  stroke(0);
  strokeWeight(0);
  fill(234,126,27);
  ellipse(mouseX-70, mouseY+355, 130, 30);
   
 //arm
stroke(0);
strokeWeight(30);
fill(0);
line(mouseX-195, mouseY+250, mouseX-75, mouseY+100);
 
//arm
stroke(0);
strokeWeight(30);
fill(0);
line(mouseX+205, mouseY+250, mouseX+75, mouseY+100);
  
 strokeWeight(0);
   
 
}
