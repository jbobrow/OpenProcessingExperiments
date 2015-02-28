
float x;
float y;
float easing = 0.03;
PFont belizio;
PFont century;
String word = "follow";
String word2 = "lead";

void setup()
{
  size(600, 600);
  smooth();
  belizio = loadFont("BelizioBoldItalic-48.vlw");
  century = loadFont("CenturyGothic-Italic-48.vlw");
  textAlign(LEFT,BOTTOM);
}

void draw()
{
 float targetX=mouseX;
 float targetY=mouseY;
x += (targetX -x) * easing;
y += (targetY -y) * easing;
background(224,241,255);

fill(93,68,32);
textFont(century);
textSize(25);
text(word,x,y);

fill(211,83,82);
textFont(belizio);
textSize(35);
text(word2, mouseX, mouseY);

//ellipse(x,y,12,12);

}


