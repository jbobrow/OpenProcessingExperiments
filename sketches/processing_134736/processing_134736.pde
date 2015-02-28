
/* @pjs preload= "seacreature.jpg"; */
/* @pjs preload= "seacreature2.jpg"; */
/* @pjs preload= "seacreature3.jpg"; */
/* @pjs preload= "seacreature4.jpg"; */
/* @pjs preload= "seacreature5.jpg"; */
void setup() {
size (1200,800);background(255, 255, 255);
}

void draw()
{

PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
one = loadImage("seacreature.jpg");
two = loadImage("seacreature2.jpg");
three = loadImage("seacreature3.jpg");
four = loadImage("seacreature4.jpg");
five = loadImage("seacreature5.jpg");
image(one, 30, 30);
image(two, 100, 450);
image(three, 450, 50);
image(four, 850, 250);
image(five, 600, 500);
noStroke();

// Declaring variables

int x;
int y;

x= 775;


pushMatrix();
fill (90, 213, 255) ;
ellipse (35, 60, 55, 55);
ellipse(mouseX,60,55,55);
fill (71, 232, 231) ;
ellipse(mouseX, 120, 50, 50);
//ellipse(45, 120, 50, 50);
fill (78, 255, 204) ;
ellipse(mouseX, 180, 45, 45);
//ellipse(35, 180, 45, 45);
fill (90, 213, 255) ;
ellipse(mouseX, 240, 40, 40);
//ellipse(45, 240, 40, 40);
fill (71, 232, 231) ;
ellipse(mouseX, 300, 35, 35);
//ellipse(35, 300, 35, 35);
fill (78, 255, 204) ;
ellipse(mouseX, 340, 30, 30);
//ellipse(45, 340, 30, 30);
fill (90, 213, 255) ;
ellipse(mouseX, 380, 25, 25);
//ellipse(35, 380, 25, 25);
fill (71, 232, 231) ;
ellipse(mouseX, 410, 20, 20);
//ellipse(45, 410, 20, 20);
fill (78, 255, 204) ;
ellipse(mouseX, 440, 15, 15);
//ellipse(35, 440, 15, 15);

fill (90, 213, 255) ;
ellipse(900, mouseY, 25, 25);
//ellipse(900, 40, 25, 25);
fill (71, 232, 231) ;
ellipse(920, mouseY, 25, 25);
//ellipse(920, 80, 25, 25);
fill (78, 255, 204) ;
ellipse(900, mouseY, 25, 25);
//ellipse(900, 120, 25, 25);
fill (90, 213, 255) ;
ellipse(880, mouseY, 25, 25);
//ellipse(880, 160, 25, 25);
fill (71, 232, 231) ;
ellipse(900, mouseY, 25, 25);
//ellipse(900, 200, 25, 25);

fill (78, 255, 204) ;
ellipse(1100, 750, 55, 55);
fill (90, 213, 255) ;
ellipse(1080, 690, 50, 50);
fill (71, 232, 231) ;
ellipse(1100, 640 , 45, 45);
fill (78, 255, 204) ;
ellipse(1080, 600, 40, 40);
fill (90, 213, 255) ;
ellipse(1100, 550, 35, 35);
fill (71, 232, 231) ;
ellipse(1080, 510, 30, 30);
fill (78, 255, 204) ;
ellipse(1100, 470, 25, 25);
fill (90, 213, 255) ;
ellipse(1080, 430, 20, 20);
fill (71, 232, 231) ;
ellipse(1100, 400, 15, 15);
fill (78, 255, 204) ;
ellipse(500, x, 25, 25);
ellipse(520, x - 40, 25, 25);
ellipse(500, x- 80, 25, 25);
ellipse(520, x - 120, 25, 25);
ellipse(500, x- 160, 25, 25);
ellipse(520, x- 200, 25, 25);
ellipse(500, x- 240, 25, 25);
ellipse(520, x- 280, 25, 25);
ellipse(500, x- 320, 25, 25);
ellipse(520, x- 360, 25, 25);
popMatrix();
}


