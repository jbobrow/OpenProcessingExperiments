
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
if(x == 30){
r = random(0,255);
g = random(0,255)
b = random(0,255)
x = 0;
}
ellipse(mouseX,mouseY,250,250)
line(0,0,mouseX,mouseY)
line(mouseX,mouseY,500,500)
line(500,0,mouseX,mouseY)
line(mouseX,mouseY,0,500)
triangle(mouseX,mouseY,250,0,250,500)
x = x + 1
}
