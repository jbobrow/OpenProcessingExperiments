
//Moving the rect()
int posX = 0;
void setup(){
size(400,400);
}

void draw(){
posX = posX+1;
background(50);
rectMode(CENTER);
rect(posX, height/2, 50, 50);

println(posX);
}
