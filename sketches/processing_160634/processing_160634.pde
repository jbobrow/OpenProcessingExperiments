
PImage yyy;
float speed= 1.0;
float move;

void setup() {

size(800,500);
yyy=loadImage("http://www.wallpaperfly.com/thumbnails/detail/20120711/son%20goku%20goku%20dragon%20ball%20z%201920x1080%20wallpaper_www.wallmay.com_10.jpg");
}
void draw(){
move=move+speed;
image(yyy,10,move);
if (move > 5) {
move=0
}
}
