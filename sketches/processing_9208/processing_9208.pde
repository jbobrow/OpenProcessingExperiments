
void setup () {
    size(500,500);
    smooth();
}
  
void draw() {
  
  background(255);
  
 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(175);
  rect(mouseX,mouseY, 20,100);
  
  stroke(0);
  fill(20);
  ellipse(mouseX,mouseY-30,60,60);
  
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-10,10,20);
  
  stroke(0);
  fill(200,8,6,150);
  ellipse(mouseX,mouseY-5,5,10);
  
  fill(mouseX, 0, mouseY);
  ellipse(mouseX-20,mouseY-30,16,32);
  ellipse(mouseX+20,mouseY-30,16,32);
  
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  stroke(0);
  line(mouseX-20,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+20,mouseY+50,pmouseX+10,pmouseY+60);
  
  stroke(0);
  line(mouseX-5,mouseY+10,pmouseX-20,pmouseY+30);
  line(mouseX+5,mouseY+10,pmouseX+20,pmouseY+30);
  
  
}



