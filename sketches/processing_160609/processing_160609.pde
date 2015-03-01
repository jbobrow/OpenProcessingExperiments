
PImage yyy;
float speed = 2.0;
float move;

void setup() {

size (900,600);
yyy=loadImage("https://31.media.tumblr.com/04331487d02bb726dbb37ed3dbd61345/tumblr_nblavayEwA1tlzulpo1_1280.jpg");
}
void draw (){
move=move+speed;
//background(random(0,100),random(50,200),random(0,255));
image(yyy,20,move);
if (move > 2) {
move=0;
}
}
