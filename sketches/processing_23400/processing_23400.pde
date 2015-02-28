
void setup () {
  size(300,300);
  smooth();
  rectMode(CENTER);
  frameRate(30);
  background(40,100,150);
}

void draw () {
  noStroke();
  
  fill(mouseX,200,mouseY);       //CHANGES COLOUR WITH MOUSE
    ellipse(110,70,30,30); //left head knob
    ellipse(150,50,30,30); //centre head knob
    ellipse(190,70,30,30); //right head knob
    rect(150,190,10,100); //leg stalk
  stroke(mouseX,200,mouseY);
  strokeWeight(4);
    line(150,150,190,200); //right arm
    line(150,150,110,200); //left arm
  noStroke();
  fill(250,240,170);
    ellipse(150,100,100,100); //head
    triangle(120,270,150,230,180,270); //foot
    ellipse(190,200,20,20);
    ellipse(110,200,20,20);
  fill(255);
    ellipse(150,100,60,70); //eye
  fill(0);
    ellipse(150,115,20,30); //pupil
 
}

void mousePressed () {
  background(0);          //UFO APPEARS SINGLE TIME WITH EACH MOUSE CLICK
  fill(150);   
    ellipse(mouseX,mouseY-10,30,30); //ufo cockpit
  fill(200);
    ellipse(mouseX,mouseY,50,30); //ufo body
  fill(255,0,0);
    ellipse(mouseX,mouseY+10,10,10); //red light centre
    ellipse(mouseX-15,mouseY+5,8,8); //red light left
    ellipse(mouseX+15,mouseY+5,8,8); //red light right
}

void keyPressed () {
  background(40,100,150);   //RETURN TO NORMAL
}

