
int x = 0;

void setup(){

size(400,400);
}

void draw(){
background (255);
fill(470,180,0);
ellipse(x,200,30,30);
fill(250);
noStroke();
triangle(x-3,200,x+20,185,x+20,215);

fill(0);
ellipse(x+50,200,15,15);

x = x+3;
}

