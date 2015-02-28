
PImage img;
PFont font;

float rightEllipse;
float leftEllipse;
float easing=0.05;

String quote = "hello to you too";

int x=250;
int y=250;

void setup(){
 size(500,500);
  smooth(); 
 img = loadImage("landscape1.png");
 font = loadFont("RotondoSilver-27.vlw");
 textFont(font);
 background(56,148,203);
 noStroke();
}
 
void draw(){
 
//img
image(img, 0, 0);


//neck
noStroke();
fill(255,172,139);
rect(185, 210, 30, 20);

//hair
stroke(227,59,142);
line(200, 150, 200, 200);
line(180, 160, 200, 200);
line(220, 150, 200, 200);


//ears
fill(163, 1, 81);
ellipse (180, 184, 10, 10);
ellipse (220, 184, 10, 10);


//head
noStroke();
fill(255,97,56);
ellipse (200, 200, 50, 50);



//eyes
fill(255);
ellipse(196, 190, 8, 11);
ellipse(210, 193, 8, 11);

//arms
fill(121, 189, 143);
triangle(300, 250, 250, 180, 240, 280);
triangle(150, 250, 80, 180, 240, 280);

//body
noStroke();
fill(0, 163, 136);
ellipse(200, 305, 150, 150);
fill(190);

ellipse(mouseX, mouseY, 20, 20);
if(mousePressed == true) {



//ellipse(150, 280, 100, 50);
  //stroke (0);
  fill(0, 163, 136);
  
ellipse(200, 305, 180, 180);
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
ellipse(200, 380, 140, 30);
fill(190,235,159);
ellipse(220,380, 25, 25);
ellipse(195,380, 25, 25);
ellipse(170,380, 25, 25);


}








