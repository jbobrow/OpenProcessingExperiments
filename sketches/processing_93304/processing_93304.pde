
boolean whiteBGColour;
float r;
float g;
float b;

void setup(){
size(500,500);
background(255);
smooth();
}

void draw(){
stroke(0);
strokeWeight(abs(mouseX - pmouseX));
line(pmouseX,pmouseX,mouseX,mouseY);
}

void mouseClicked()
{
r=random(255);
g=random(255);
b=random(255);
background(r,g,b);
}



