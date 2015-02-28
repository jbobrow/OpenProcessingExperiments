
PFont avenir;
String logoName = "LANGUAGE TECHNOLOGY CONFERENCE";

void setup()
{

size (400,400);
background (0);
fill(255);
noStroke();
textAlign(LEFT,TOP);
textMode(CENTER);
avenir = loadFont("Futura-Medium-48.vlw");
//textFont(avenir, 15);
smooth();
}
void draw()
{


rect(150,150, 25,52);
rect(220,156, 25,52);
rect(150,202, 50,25);
rect(195,133, 50,25);
noFill();
stroke(255);

text(logoName,150,265, 82,80);

}

