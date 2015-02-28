
void setup(){
size(300,300);
}

void draw(){
  
int x = 120;
background(0);

fill(0,mouseX,mouseY);
noStroke();
rect(mouseY, mouseY, mouseX, mouseY);

fill(255,0,0);
noStroke();
ellipse(x, mouseY+50, 50, 50);

fill(255,255,0);
noStroke();
rect(x+50, mouseX/2, 25, 50);

fill(0,0,255);
noStroke();
rect(x*2, mouseY*2, 75, 25);

fill(0,255,0);
noStroke();
rect(150-x, mouseX, 150, 50);

fill(255, 165, 0);
noStroke();
rect(x/2, mouseY, 25, 200);


}



