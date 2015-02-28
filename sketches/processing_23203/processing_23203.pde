

void setup(){ 
size (200,200); }
void draw (){ 
  background (255);

ellipseMode(CENTER);
rectMode(CENTER);

// zoog body
stroke(0);
fill(246,202,165);
rect(mouseX,mouseY,20,100);
fill(255);


// zoog head
fill(246,202,165);
ellipse(mouseX,mouseY-30,60,60);

//zoog antennas
triangle(mouseX-60,mouseY-90,mouseX-30,pmouseY-55,pmouseX-20,mouseY-55);
triangle(mouseX+60,mouseY-90,mouseX+30,pmouseY-55,mouseX+20,pmouseY-55);

// zoog eyes
fill(mouseX,0,mouseY);
ellipse(mouseX-19,mouseY-30,10,12);
ellipse(mouseX+19,mouseY-30,15,15);

// zoog legs
stroke(0);
line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);

// zoog left hand 
stroke(0);
line(mouseX-10,mouseY+20,pmouseX-30,pmouseY-10);
line(mouseX+10,mouseY+20,pmouseX+30,mouseY+30);

}




