
PFont akzidenz;
String word = "M A G N E T I C";

float angle = 0.0;

void setup()
{

size (700,700);
smooth();
akzidenz = loadFont ("AkzidenzGroteskBE-XBdCnIt-48.vlw");
textAlign(CENTER);
strokeWeight(3);
stroke(255);
}

void draw()
{
 background(25);
 
 for(int x=0; x<width; x+=25)
{
 for(int y=0; y<height; y+=25) 
 {

 pushMatrix();
  
  float angle = atan2(mouseY-y, mouseX-x);
  
  translate(x,y);

  rotate(angle);

stroke(255,x,y);
line(-20,0,15,0);

popMatrix();

textFont(akzidenz);
textSize(30);
fill(12,177,240);
text(word, mouseX, mouseY);
 }
}
}

