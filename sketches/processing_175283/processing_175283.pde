
void setup(){
size(500,500);
background(255,255,255);
}

float x = 0;
float r = 0;
float g = 0;
float b = 0;

void draw(){
background(r,g,b);
if(x == 50){
r = random(0,255);
g = random(0,255);
b = random(0,255);
x = 0;
}
fill(mouseX/2,50,90);
ellipse(250,250,mouseX,mouseY);
ellipse(250,250,mouseY,mouseX);
ellipse(250,250,mouseX/2,mouseY/2);
x = x + 1;

fill(mouseY/2,50,90)
rect(25,25,mouseX/2,mouseY/2)
rect(375,25,mouseY/2,mouseX/2)
rect(25,375,mouseY/2,mouseX/2)
rect(375,375,mouseX/2,mouseY/2)
}
