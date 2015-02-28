
String myText;
String myText1;
String myText2;
PFont myfont;
PImage pic;
PImage pic1;
PImage pic2;


void setup() {
  background (0);
size(800,800);
myText = "hello world...";
myText1 = "Speak to the earth and"; 
myText2 = "it shall teach thee";
myfont = loadFont("Monospaced-48.vlw");
 pic = loadImage ("4.jpg");
 pic1 = loadImage ("2.jpg");
pic2 = loadImage ("5.jpg"); 
}

void draw() {

  textFont(myfont);
  text(myText1, 100, 300);
  text(myText2, 100, 500);
  text(myText,400,700);
image (pic, 40,50);
image (pic1, 200,170);
image (pic2, 350, 300);
tint (150,150,150,150); 
}

