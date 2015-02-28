
void setup(){
    size(500,500);
    predatorP={10,20};
    preyP={30,70};
    rectMode(CENTER);
    frameRate(3);
}

void draw(){
    frameRate(random(0,40));
    background(112);
    x=random(0,500);
    y=random(0,500);
    predator=rect(x,y,20,20);
}
    
