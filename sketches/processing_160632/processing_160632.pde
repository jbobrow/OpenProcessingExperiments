
PImage bug;
float speed = 6.0;
float move;

void setup()
{
size(500,300);
bug = loadImage("http://www.pestcontrolsupplies.co.uk/Lib/Img/News%20Images/2013March/RhinoBeetleMain.jpg");
PFont font;
font = loadFont("New Times Roman"); 
textFont(font, 40); 
}

void draw(){
text("Rhino-horned beetle",50,50);
move=move+speed;
image(bug,move);
if (move > 500) {
move=-100;
}
}
