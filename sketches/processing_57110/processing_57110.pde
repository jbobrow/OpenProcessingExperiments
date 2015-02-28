
void setup(){
  //Set the size of the window and attributes
  size(200,200);
  smooth();
  frameRate(30);
}
void draw(){
  //Draw a white background
  background (255);
  
  //Draw Boo's head
stroke(0);
  fill(255,255,0);
  ellipse(mouseX,mouseY,35,35);
  //Draw Boo's eyes
    fill(0);
  ellipse(mouseX-5,mouseY,5,5);
  ellipse(mouseX+5,mouseY,5,5);
  
  //Draw Boo's smile and body
  strokeWeight(3);
  noFill();
  arc(mouseX,mouseY,25,15,0,PI);
  line(mouseX,mouseY+18,mouseX,mouseY+38);
  line(mouseX-20,mouseY+30,mouseX+20,mouseY+30);
  line(mouseX+10,mouseY+80,pmouseX+10,pmouseY+90);
  line(mouseX-10,mouseY+80,pmouseX-10,pmouseY+90);
  
  //Draw Boo's skirt
stroke(0);
  strokeWeight(1);
  fill(0,mouseX,mouseY);
  triangle(mouseX,mouseY+40,mouseX+20,mouseY+80,mouseX-20,mouseY+80);
}
void mousePressed(){
  println("Geia sou!");
}
  

