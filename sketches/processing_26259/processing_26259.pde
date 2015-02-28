
int x;
PFont JazzLetPlainFont; 
PImage DNAE;

void setup(){ 
size(600,600);
x = 0;
JazzLetPlainFont=loadFont("JazzLetPlain-48.vlw");
DNAE = loadImage("DNAE.jpg");}

void draw(){ 
  image(DNAE,mouseX,mouseY);

fill(105);

text("WOW!!",200,200);
fill(0,30);
textFont(JazzLetPlainFont);
text("A.Q",random(600),random(300));
fill(39,105);
text("OMG",100,100);
fill(150,189);
text("uuuuuuu!!!",300,300);

}


