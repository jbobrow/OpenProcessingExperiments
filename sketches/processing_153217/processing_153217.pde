
void setup(){
size(1000,800);
}

void draw(){
background(255);
drawCircle(width/2,height/2,200);
}

void drawCircle(float x, float y, float radius){
noStroke();
fill(radius*5,mouseY/6,mouseX/6+radius*2);
rectMode(CENTER);
rect(x,y,radius+mouseX/50,radius+mouseY/50);

if (radius>10){
drawCircle(x+radius,y,radius/2);
drawCircle(x-radius,y,radius/2);
drawCircle(x,y+radius,radius/2);
drawCircle(x,y-radius,radius/2);
}
}
