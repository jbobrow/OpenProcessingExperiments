
PImage img;
PFont font;

float rightEllipse;
float leftEllipse;
float easing=0.05;

String quote = "hello to you too";



//robot position x
//robot position y
int rx = 200;
int ry = 300;


void setup(){
 size(500,500);
  smooth(); 
 img = loadImage("landscape1.png");
 font = loadFont("RotondoSilver-27.vlw");
 textFont(font);
 
 noStroke();
}
 
void draw(){
 
//img
background(56,148,203);
image(img, 0, 0);



//neck
noStroke();
fill(255,172,139);
rect(rx-15, ry-90, 30, 20);

//hair
stroke(227,59,142);
line(mouseX, ry-150, rx, ry-100);
line(mouseX-20, ry-140, rx, ry-100);
line(mouseX+20, ry-150, rx, ry-100);


//ears
fill(163, 1, 81);
ellipse (rx-20, ry-115, 10, 10);
ellipse (rx+20, ry-115, 10, 10);


//head
noStroke();
fill(255,97,56);
ellipse (rx, ry-100, 50, 50);



//eyes
fill(255);
ellipse(rx-4, ry-110, 8, 11);
ellipse(rx+10, ry-107, 8, 11);

//arms
fill(121, 189, 143);
triangle(300, 250, 250, 180, 240, 280);
triangle(150, 250, 80, 180, 240, 280);



//body
noStroke();
fill(0, 163, 136);
ellipse(rx, ry, 150, 150);
fill(190);

//ellipse(mouseX, mouseY, 20, 20);
if(mousePressed == true) {

//ellipse(150, 280, 100, 50);
//stroke (0);
fill(0, 163, 136);
ellipse(rx, ry+5, 180, 180);
fill(190);
text(quote,50,20, 500, 200);
}

noStroke();
//ellipse(150, 280, 100, 50);

//mouth
noFill();
stroke(255,215,75);
arc(205,200,25,25,0,radians(90)); 
arc(210,210,8,8,0,radians(90)); 

//legs
fill(121,189, 143);
ellipse(rx, ry+80, 140, 30);
fill(190,235,159);
ellipse(rx+20,ry+80, 25, 25);
ellipse(rx-5,ry+80, 25, 25);
ellipse(rx-30,ry+80, 25, 25);


}








