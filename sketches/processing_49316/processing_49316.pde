
float i;

void setup(){
size(1280,960);
rectMode(CENTER); 
}
void draw(){
background(242,206,24);
i = random(0,5100);
fill(5,255,2);
rect(mouseX,mouseY,300,250);
fill(255,0,9);
ellipse(mouseX,mouseY,20,20);

fill(i);
ellipse(mouseX-60,mouseY-45,100,100);
fill(i);
ellipse(mouseX+60,mouseY-45,100,100);

fill(7,83,232);
rect(mouseX-200,mouseY-175,100,100);
rect(mouseX+200,mouseY-175,100,100);

fill(255,0,226);
ellipse(mouseX-60,mouseY-45,50,50);

fill(255,0,226);
ellipse(mouseX+60,mouseY-45,50,50);
fill(255,0,226);
ellipse(mouseX-200,mouseY-175,50,50);
fill(255,0,226);
ellipse(mouseX+200,mouseY-175,50,50);
rect(mouseX,mouseY+250,100,250);
fill(255,0,226);
ellipse(mouseX,mouseY+400,300,300);
rect(mouseX,mouseY-225,150,125);
rect(mouseX,mouseY-150,275,50);
}




