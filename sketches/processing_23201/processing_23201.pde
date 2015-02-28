
void setup(){
  
  size(500,500);
  smooth();
  frameRate(50); //set to 50 frames per second
  
}

void draw(){
  
  //crazy duck
  background(34,160,222); //light blue
  ellipseMode(CENTER); 
  rectMode(CENTER);
  
  //crazy duck head
  stroke(255,213,0);
  fill(255,213,0);
  ellipse(mouseX,mouseY-75,150,150);
  
  //crazy duck smile
  stroke(255,141,0); //orange
  strokeWeight(5);
  line(mouseX-60,mouseY-60,pmouseX+100,pmouseY+100);
  
  //crazy duck body
  stroke(255,213,0);
  fill(255,213,0);
  ellipse(mouseX,mouseY+100,225,250);
  
  //crazy duck feet
  stroke(255,141,0); //orange
  fill(255,141,0); //orange
  rect(mouseX-62,mouseY+200,50,50);
  rect(mouseX+62,mouseY+200,50,50);
  
  //crazy duck eyes
  stroke(255); //white
  fill(255);
  ellipse(mouseX-35,mouseY-85,40,40);
  ellipse(mouseX+30,mouseY-75,60,60);
  
  //crazy duck pupils
  stroke(0);
  fill(0);
  ellipse(pmouseX-35,pmouseY-85,10,10);
  ellipse(pmouseX+40,pmouseY-80,30,30);
  
  //crazy duck light in pupils
  stroke(pmouseX,150,pmouseY); //colour changes with mouse location
  fill(mouseX,150,mouseY); //colour changes with mouse location
  ellipse(pmouseX-37,pmouseY-87,3,3);
  ellipse(pmouseX+45,pmouseY-85,10,10);
  
  
}

void keyPressed(){
  stroke(255,0,200); //feet flash to pink
  fill(255,0,200); //feet flash to pink
  rect(mouseX-62,mouseY+200,50,50);
  rect(mouseX+62,mouseY+200,50,50);
  

}

void mousePressed(){
  println("quaaaack!");
  
}

