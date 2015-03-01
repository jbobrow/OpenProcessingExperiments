


void setup(){
size(200,200);

}

void draw(){
background(0);
stroke(250);

strokeWeight(3);
stroke(250);
line(mouseX-20,mouseY-20,mouseX+20,mouseY+20);
line(mouseX+20,mouseY-20,mouseX-20,mouseY+20);

fill(mouseX,0,0);
ellipse(mouseX,mouseY,mouseY*0.25,mouseY*0.25);

ellipse(mouseX+20,mouseY-20,mouseY*0.25,mouseY*0.25);
ellipse(mouseX-20,mouseY-20,mouseY*0.25,mouseY*0.25);

}


