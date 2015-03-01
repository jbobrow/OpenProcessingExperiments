
PImage bug;
float speed =6.0;
float move;

void setup()
{
size(500,300);
bug = loadImage("http://www.pestcontrolsupplies.co.uk/Lib/Img/News%20Images/2013March/RhinoBeetleMain.jpg");
}

void draw(){
move=move+speed;
image(bug,30,move);
if (move > 500) {
move=-500;
}
}
