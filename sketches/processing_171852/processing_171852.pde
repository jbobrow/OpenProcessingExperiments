
int r=random(0, 255);

int g=random(0, 255);

int b=random(0, 255);

ball[] circleArray=new ball[1];

void setup(){

background(r,g,b);

for(int i=0;i<circleArray.length; i++){

circleArray[i]=new ball(50,50);

}

size(500,500);

}

void draw(){

for(int i=0;i<circleArray.length; i++){

circleArray[i].update();

}

}

class ball {

int VX=random(5, 5);

int VY=random(5, 5);

int x=0;

int y=0;

ball(int xP, int yP){

x=xP;

y=yP;

}

void update(){

fill(random(255),random(255),random(255));

ellipse(x,y,50,50);

x=x+VX-3;

y=y+VY-3;

}

}

