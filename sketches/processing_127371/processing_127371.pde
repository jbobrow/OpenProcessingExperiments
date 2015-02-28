
void setup() {
   
  size(500,300); 
  smooth();
  frameRate(30);
}
 
void draw() {
  
  background(255); 
   
 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
   //body 
  stroke(0);
  fill(220,8,12);
  rect(mouseX,mouseY,20,90);
 
  //  head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-50,60,60);
  
 
  // eyes
  
  fill(mouseX,0,mouseY);
  ellipse(mouseX-17,mouseY-54,14,18);
  ellipse(mouseX+17,mouseY-54,14,18);
 
  //  legs
  stroke(0);
  
  line(mouseX-10,mouseY+50,pmouseX-14,pmouseY+80);
  line(mouseX+10,mouseY+50,pmouseX+14,pmouseY+80);
   
  //hands
stroke(1);
strokeWeight(2);
line(mouseX-10,mouseY-20,pmouseX-30,pmouseY+10);
line(mouseX+10,mouseY-20,pmouseX+30,pmouseY+10);
noStroke();
ellipse(pmouseX-30,pmouseY+10,10,10);
ellipse(pmouseX+30,pmouseY+10,10,10);
fill(255);
 
 
// looooooooongggg nose
ellipse(mouseX+7,mouseY-37,6,5);
ellipse(mouseX-7,mouseY-37,5,5);
rect(mouseX,mouseY-25,16,5);
stroke(1);
 
line(mouseX,mouseY-65,mouseX,mouseY-53);
 
//mouth
ellipse(mouseX+1,mouseY-30,7,10);
  
  fill(220,8,12);
   
 }
