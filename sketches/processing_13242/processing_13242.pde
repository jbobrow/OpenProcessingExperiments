
void setup(){
size(500, 500);
smooth();
background(0, 140, 220);
noStroke();
fill(30,150,40);
ellipse(300,130,230,100);
ellipse(50,280,150,70);
ellipse(400,410,400,200);
}

void draw(){
  
}


void mousePressed() {
    stroke(0);
    fill(180,235,0);
rect(mouseX-15,mouseY-11,30,22);
rect(mouseX+15,mouseY+7,4,4);
rect(mouseX+19,mouseY+10,2,1);
rect(mouseX-19,mouseY+7,4,4);
rect(mouseX-21,mouseY+10,2,1);
    fill(255);
ellipse(mouseX+15,mouseY-10,14,15);
ellipse(mouseX-15,mouseY-10,14,15);
    fill(60);
ellipse(mouseX+14,mouseY-10,9,9);
ellipse(mouseX-14,mouseY-10,9,9);
line(mouseX-15,mouseY-1,mouseX,mouseY+3);
line(mouseX,mouseY+3,mouseX+15,mouseY-1);
point(mouseX-2,mouseY-4);
point(mouseX+2,mouseY-4);
}

