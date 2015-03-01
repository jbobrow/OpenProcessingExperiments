
PImage yyy;
float speed = 4.0;
float move;

void setup()
{
size(500,500;
yyy = loadImage("http://www.pestcontrolsupplies.co.uk/Lib/Img/News%20Images/2013March/RhinoBeetleMain.jpg");
}

void draw(){
move=move+speed;
//background(random(0,100),random(50,200),random(0,255));
image(yyy,40,move);
if (move > 4) {
move=0;
}
