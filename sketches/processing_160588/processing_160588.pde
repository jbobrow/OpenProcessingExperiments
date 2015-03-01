
PImage yyy;
float speed = 4.0;
float move;

void setup() {
size(580,350)
yyy = loadImage("http://oi60.tinypic.com/vr3m2t.jpg")
}

void draw(){
move=move+speed;
background(0,0,225);

image(yyy,360,100,move,move);
if (move >= 500) {
move=-100;
}
}



