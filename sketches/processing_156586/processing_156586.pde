
//Animation II - Trigonometry functions

//Sine Function y=sinx as the x value goes up, the y value changes in a sine wave pattern
//map function 0 to 10, everything from 1-5 will give me a 0. everything from 6-10, will give me a 1
//i.e. the range is compressed because of the map function

//Begin Example

PImage amphora;
PImage poppy;
int posX = 500;
PFont myFont;

void setup(){
size(600, 600);
amphora = loadImage("amphora.png");
poppy = loadImage("poppy.gif");
myFont = loadFont("ChaparralPro-Regular-48.vlw");
}

void draw(){
background(255);
image(poppy, 0, 0, poppy.width/2, poppy.height/2);
image(amphora, posX, poppy.height*3 - amphora.height); 

posX -= 3;



//Add text
textAlign(CENTER);
textFont(myFont, posX/8);
fill(50, 50, 150);
text("Athenian Amphora", width/2, height/2);
}


