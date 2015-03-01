
PImage yyy;
float speed = 4.0;
float move;
 
void setup() {
 
size(1000,1000);
yyy=loadImage("http://static.comicvine.com/uploads/original/11116/111164870/3847375-1622082274-flash.png");
}
void draw(){
move=move+speed;
background(0,255);
image(yyy,20,10,move,move,370,300);
if (move > 1000) {
move=0;
}
}

