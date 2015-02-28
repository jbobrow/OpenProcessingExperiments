
//Carissa Gadil
//Week 1 Project

void setup(){
size(200,200);
smooth();
frameRate(30);
background(204,250,246);
}

void draw(){
background(204,250,246);

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
}

void mousePressed() {
println("Take me to your leader!");
}

