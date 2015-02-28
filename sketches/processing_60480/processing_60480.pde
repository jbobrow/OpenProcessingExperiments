
PImage img1;
PFont font;
float a = 0; //alpha
float x1 = -150; //start G off screen
float x2 = 500; //start www off screen
float x3 = 420; //left square off screen
float x4 = -40; //right sqaure off screen

void setup(){
size(400, 400); //BG size
smooth();

img1 = loadImage("logo1.jpg"); //preloads image

font = loadFont("Arial.vlw"); //loads font
textFont(font);
}

void draw(){
image(img1, 0, 0); //draws image

fill(100, 100, 100, a);
  if (a < 255);{ //changes alpha value (opacity)
  a = a + 1;
rect(0, 125, 425, 150);
}

textSize(20);
fill(100);
text("www.garethewilliams.co.uk", 20, x2); //writes text
  if (x2 > 380){ //motion
  x2 = x2 - 1;
}

textSize(300);
fill(250, 250, 250);
text("G", x1, 290);
  if (x1 < 80){ //motion
  x1 = x1 + 1.70;
}

fill (100);
rect(x3, 0, 40, 40);
  if (x3 > 0){
  x3 = x3 - 3;
}

fill (100);
rect(x4, 360, 40, 40);
  if (x4 < 360){
  x4 = x4 + 3;
}

}

