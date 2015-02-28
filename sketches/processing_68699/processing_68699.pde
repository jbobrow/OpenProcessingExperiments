
int x=0;

int y=0;

void setup(){

size(800,600);

smooth();

noFill();

background(225);

}

void draw(){

background(225);

fill(255,0,0);

rect(x,y,100,50);

x=x+1;

y=y+1;

fill(0,0,0);

ellipse(x+20,y+50,40,40);

x=x+1;

y=y+1;

ellipse(x+40,y+50,40,40);

x=x+1;

y=y+1;

ellipse(x+60,y+50,40,40);

x=x+1;

y=y+1;

ellipse(x+80,y+50,40,40);

x=x+1;

y=y+1;

}
