
void setup(){
  size(200,200);
}

void draw() {
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
//draw zoogs body 
stroke(0);
fill(150);
rect(mouseX,mouseY,20,100);

//draw zoogs head
stroke(0);
fill(255);
ellipse(mouseX,mouseY-30,60,60);

//draw zoogs eyes
fill(0);
ellipse(mouseX-19,mouseY-30,16,32);
ellipse(mouseX+19, mouseY-30,16,32);

//draw zoogs legs
stroke(0);
line(mouseX-10,mouseY+50,mouseX-10-10,mouseY+50+10);
line(mouseX+10,mouseY+50,mouseX+10+10,mouseY+50+10);
}

