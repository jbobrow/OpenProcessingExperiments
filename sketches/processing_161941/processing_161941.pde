
PImage photo;
float speed =1.0;
float move;
 
void setup()
{
 
size(240, 155);
photo = loadImage ("http://media-cache-ak0.pinimg.com/236x/6e/65/97/6e6597770324d0b41d098cc1d815c823.jpg");
}
void draw()
{
move= move + speed;
image(photo, 0, move);
if(move > 20){
move = 0;
}
}








