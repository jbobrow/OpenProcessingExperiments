
int x=0;
int y=0;
int value= 0;
PFont font;
PImage heart;
void setup () {
  size (500,500);
 // heart=loadImage("Love_heart.jpg");
  //image(heart,mouseX,mouseY);
 
}

void draw(){
//background(255);
heart=loadImage("love heart.png");
  image(heart,mouseX-190,mouseY-150,heart.width,heart.height);
font = loadFont("MaturaMTScriptCapitals-48.vlw"); 
textFont(font);
fill( 120,30,50,250);
text("Illusion", 25, 40); 
fill(0, 0, 0,10);
text("in", 25, 60);
fill(0, 10, 10, 10);
text("Love", 15, 90);
fill(0,0,0,0);
if(mousePressed == true) {
    noCursor();
  } else {
    cursor(HAND);
  }

}
void mouseDragged()
{
 // x=mouseX;
 // y=mouseY;
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}





