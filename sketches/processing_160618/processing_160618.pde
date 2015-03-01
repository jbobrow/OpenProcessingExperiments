
PImage yyy;
float speed = 1.0;
float move;

void setup() {

size(500,400);
yyy=loadImage("http://www.allny.com/blogs/nyc-moments/wp-content/uploads/2012/07/Times-Square.jpg");
}
void draw(){
move=move+speed;
//background)random(0,100),random(50,200),random(0,255));
image(yyy,40,move);
if (move > 4) {
move=0;
}
}

