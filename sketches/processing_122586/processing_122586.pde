
void setup() {
  size(500, 500); //grootte document
  smooth();
  frameRate(30);
}

void draw() {
  background(0); //achtergrond kleur
  
  rectMode(CENTER);        //body
  stroke(255);
  fill(mouseX,0,mouseY);
  rect(mouseX, mouseY, 50, 80);
  
  line(mouseX-70, mouseY-25, mouseX-25, mouseY+10); //left arm
  line(mouseX+70, mouseY-25, mouseX+25, mouseY+10); //right arm
  line(mouseX-20, mouseY+40, pmouseX-30, pmouseY+80); //left leg
  line(mouseX+20, mouseY+40, pmouseX+30, pmouseY+80); //right leg
  
  ellipseMode(CENTER);    //head
  stroke(255);
  fill(mouseX,0,mouseY);
  ellipse(mouseX, mouseY-40, 100, 75);
  
  ellipseMode(CENTER); //left eye
  stroke(255);
  fill(255);
  ellipse(mouseX-15, mouseY-35, 20, 25);
  
  ellipseMode(CENTER); // left eye pupil
  stroke(0);
  fill(0);
  ellipse(mouseX-10, mouseY-40, 10, 15);
  
  ellipseMode(CENTER); //right eye
  stroke(255);
  fill(255);
  ellipse(mouseX+15, mouseY-35, 20, 25);
  
  ellipseMode(CENTER); // right eye pupil
  stroke(0);
  fill(0);
  ellipse(mouseX+10, mouseY-35, 10, 15);
  
  stroke(mouseX,0,mouseY);
  line(mouseX-40, mouseY-95, pmouseX-5, pmouseY-50); // left antenna
  line(mouseX+40, mouseY-95, pmouseX+5, pmouseY-50); // right antenna
}
void mousePressed(){
 
  println("Meow"); 
}
