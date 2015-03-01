
int X= 0;

int Y= 0;

int mario= 50;

void setup(){

size(500,500);

background(255,0,255);

}

void draw(){

stroke(mouseX,mouseY,100);

strokeWeight(mario/10);

line(X,Y,mouseX,mouseY);

X= mouseX;

Y= mouseY;

mario++;

}
