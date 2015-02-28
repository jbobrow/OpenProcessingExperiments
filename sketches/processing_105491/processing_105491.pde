
PImage bg;
int currentcolor = 000;
int black = 000;
int grey = 180;
int white = 255;

color circleHighlight;
boolean circleOver = false;

String eraser = "x";

void setup() {
size (800,800);
background (20, 120 , 200);
bg = loadImage("bg.jpg");
    imageMode(NORMAL);
    image(bg, 0,0);
 
circleHighlight = color(100,200,80,100);
}

void draw() {
//buttons

//--select white

if (mouseX >= 20 && mouseX <= 60 && mouseY >=20 && mouseY <= 60) {
  fill(circleHighlight);
  currentcolor = white;
} else {
fill(white);
}

if (mouseX >= 20 && mouseX <= 60 && mouseY >=20 && mouseY <= 60 && mousePressed) {
  currentcolor = white;
} 


stroke(000);
ellipse(40,40,40,40);

//--select grey

if (mouseX >= 60 && mouseX <= 100 && mouseY >=20 && mouseY <= 60) {
  fill(circleHighlight);
  currentcolor = grey;
} else {
fill(grey);
}

if (mouseX >= 60 && mouseX <= 100 && mouseY >=20 && mouseY <= 60 && mousePressed) {
  currentcolor = grey;
} 


stroke(000);
ellipse(80,40,40,40);

//--select black

if (mouseX >= 100 && mouseX <= 140 && mouseY >=20 && mouseY <= 60) {
  fill(circleHighlight);
  currentcolor = black;
} else {
fill(black);
}

if (mouseX >= 100 && mouseX <= 140 && mouseY >=20 && mouseY <= 60 && mousePressed) {
  currentcolor = black;
} 

stroke(000);
ellipse(120,40,40,40);

//--draw

  if (mousePressed){
    noStroke();
    fill(currentcolor);
    ellipse(mouseX,mouseY,15,15);
    ellipse(pmouseX,pmouseY,15,15);
  }

//-erase


  if (mousePressed && mouseX >= 180 && mouseX <=220 && mouseY >= 20 && mouseY <= 60){
    background (20, 120 , 200);
    bg = loadImage("bg.jpg");
    imageMode(NORMAL);
    image(bg, 0,0);
    
  }

noStroke();
fill(225);
ellipse(200,40,40,40);
fill(grey);
textSize(40);
text(eraser,188,52);


}


