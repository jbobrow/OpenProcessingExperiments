
void setup(){
size(500,500);
x=random(0,500);
y=random(0,500);
predatorP={x,y};
rectMode(CENTER);
}

void draw(){
   predator=ellipse(predatorP[0],predatorP[1],20,20);
}
