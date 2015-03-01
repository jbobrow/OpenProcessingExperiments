
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
g = random(0,255);
b = random(0,255);
x = 0;
}
ellipse(250,250,mouseX,mouseY);
x = x + 1;
}

