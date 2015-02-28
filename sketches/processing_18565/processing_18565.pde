
void setup(){
size(300,300);
}

void draw(){
  
int x = 120;
background(0);

fill(255,0,0);
noStroke();
ellipse(x, height/2, 50, 50);

fill(255,255,0);
noStroke();
rect(x+50, height/2, 25, 50);

fill(0,0,255);
noStroke();
rect(x*2, height/2, 75, 25);

fill(0,255,0);
noStroke();
rect(150-x, height/2, 150, 50);

fill(255, 165, 0);
noStroke();
rect(x/2, height/2, 25, 200);

fill(160,32,240);
noStroke();
rect(mouseX, mouseY, 25, mouseY);

}



