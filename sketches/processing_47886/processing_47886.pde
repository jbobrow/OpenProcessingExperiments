
void setup(){
  size(200,200);
}

void draw(){
  background(255);
  smooth();
  frameRate(30);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(150);
  rect(mouseX,mouseY,20,100);
  
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  fill(mouseX,mouseY,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-20,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+20,pmouseY+60);
}

void mousePressed(){
  stroke(0);
  println("Take me to your leader!");
}

void keyPressed(){
  background(255);
}
                
                
