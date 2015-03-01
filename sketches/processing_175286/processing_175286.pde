
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
if(x == 15){
r = random(0,255);
g = random(0,255);
b = random(0,255);
x = 0
}
line(mouseX,mouseY,0,500)
line(mouseX,mouseY,500,500);
line(mouseX,mouseY,0,0);
line(mouseX,mouseY,500,0);
line(mouseX,mouseY,250,250);
fill(mouseY,mouseX,100);
ellipse(mouseX,mouseY,100,100);
x = x + 1;
}
