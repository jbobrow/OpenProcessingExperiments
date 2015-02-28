
//Carissa Gadil
//Week 1 Project

float r = 0;
float g = 0;
float b = 150;

void setup() {
size(200,200);
smooth();
frameRate(30);
}

void draw() {
background(r,g,b);

//Orientation  
ellipseMode(CENTER);
rectMode(CENTER);

//Body
stroke(0);
fill(171,135,185);
rect(mouseX,mouseY,20,100);

//Head
stroke(0);
fill(255);
ellipse(mouseX,mouseY-30,60,60);

//Eyes
fill(mouseX,0,mouseY);
ellipse(mouseX-18,mouseY-30,16,32);
ellipse(mouseX+18,mouseY-30,16,32);

//Buttons
stroke(201,47,39);
fill(201,47,39);
ellipse(mouseX,mouseY+10,6,6);
ellipse(mouseX,mouseY+20,6,6);

//Legs
stroke(0);
line(mouseX-10,mouseY+50,pmouseX-15,pmouseY+70);
line(mouseX+10,mouseY+50,pmouseX+15,pmouseY+70);

  if(mouseX > width/2){
    r = r + 1;
  } else {
    r = r - 1;
  }
  
  if(r > 255) {
    r = 255;
  } else if (r < 0) {
    r = 0;
  }
}

void mousePressed() {
println("Take me to your leader!");
}

