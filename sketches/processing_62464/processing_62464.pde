
void setup (){
size(400, 400);
background(#BDADC9);
}

void draw(){
float x= random(400);
float y= random(400);
smile (x, y);
}
void smile(float x, float y){
frameRate(5);
fill(#F6FF00);
for (int i=5; i<25; i=i+25){
strokeWeight(2);
ellipse(x,y, 20, 30);
arc (x, y, i, i, 0, PI);
arc (x-i, y-3, 5, 5, PI, TWO_PI);
arc (x+i, y-3, 5, 5, PI, TWO_PI);
}
}

