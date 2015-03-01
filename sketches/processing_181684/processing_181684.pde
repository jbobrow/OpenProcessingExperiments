
float diametre = 10.0;
String texte= "     @";
char caractere ='s';
PFont maFonte;
PImage monImage;


void setup()
{
size(700,700);
background(0);
noCursor();
frameRate (10);
maFonte=loadFont("Helvetica-16.vlw");
textFont(maFonte);
monImage=loadImage("Image3.png");
println(monImage.width);
}

void draw()
{
 //filter(BLUR,1);
  //background(128);
  image(monImage,mouseX,mouseY);
  diametre=random(20,50);
  noStroke();
  fill(0,255,255);
//ellipse(mouseX,mouseY,diametre,diametre);
fill(110,110,110);
//text("texte",mouseX,mouseY);

text(texte,mouseX,mouseY+5);
}
void keyPressed()
{
texte=texte+key;
}

