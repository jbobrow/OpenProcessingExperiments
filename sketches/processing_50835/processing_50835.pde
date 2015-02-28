
void setup() {
  size(300,300);
  smooth();
}

void draw() {
  
  background(255);


//set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);

//bunny ear left
stroke(50);
fill(209);
ellipse(mouseX-20,mouseY-120,35,65);
line(mouseX-20,mouseY-120,pmouseX-20,pmouseY-90);

//bunny ear right
stroke(50);
fill(209);
ellipse(mouseX+20,mouseY-120,35,65);
line(mouseX+20,mouseY-120,pmouseX+20,pmouseY-90);

//bunny head
stroke(50);
fill(209);
ellipse(mouseX,mouseY-70,50,50);

//bunny nose
fill(100);
ellipse(mouseX,mouseY-65,10,10);

//bunny eye right
fill(100);
ellipse(mouseX+10,mouseY-75,5,5);
//bunny eye left
fill(100);
ellipse(mouseX-10,mouseY-75,5,5);

//bunny body
stroke(50);
fill(209);
ellipse(mouseX,mouseY,70,90);
//bunny belly button
fill(100);
ellipse(mouseX,mouseY+10,5,5);

//bunny tail
fill(100);
ellipse(mouseX-45,mouseY+10,25,25);

//bunny foot right
stroke(50);
fill(209);
ellipse(mouseX+50,mouseY+50,75,35);

//bunny foot left
stroke(50);
fill(209);
ellipse(mouseX-50,mouseY+50,75,35);

}




