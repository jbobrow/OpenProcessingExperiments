
PImage photo;
float speed =2.0;
float move;

void setup()
{

size(815, 295);
photo = loadImage ("http://blog.karachicorner.com/wp-content/uploads/2012/07/timeline-covers/fb-cover-image-2.jpg");
}
void draw()
{
move= move + speed;
image(photo, 0, move);
if(move > 20){
move = 0;
}
textSize(25)
text("What's so funny?",100, 100)
}
