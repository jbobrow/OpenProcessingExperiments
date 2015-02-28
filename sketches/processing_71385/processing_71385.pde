
void setup(){
  size(600,600);
  background(20);
  smooth();
  frameRate(30);
}
void draw(){
  
  stroke(5);
  fill(random(255),0,random(255));
  rectMode(CENTER);
  rect(mouseX+20,mouseY+20,10,10);
  rect(mouseX-20,mouseY-20,20,20);
  rect(pmouseX-50,pmouseY-50,5,5);
  
}
  void mousePressed(){
    println("COLOR PLAY");
  }
  void keyPressed(){
    background(random(50));  
  }

