
PImage photo;
PFont f;

void setup() {
  size(600, 400);
  photo =loadImage("thanks.jpg");
  f = createFont("EverydayTypo", 75, true);
  noStroke ();
 
  }
  
  void draw(){
  image (photo ,0, 0);
  //albero tronco
  fill(124,48,1,250);
  rect(115,250,9,150);
  
  fill(124,48,1,200);
  rect(122,250,10,150);
  
  fill(124,48,1,150);
  rect(132,250,9,150);
  
  //albero foglie
fill(0,121,27,230);
triangle(60,250,127,170,195,250);

fill(0,121,27,200);
triangle(70,200,127,130,185,200);

fill(0,121,27,150);
triangle(80,150,127,90,175,150);

//testo
textFont(f,75);
fill(255);
text("Buon", 295,100);

textFont(f,75);
fill(255);
text("Natale", 270,170);

textFont(f,75);
fill(255);
text("Tanti", 300,280);


textFont(f,75);
fill(255);
text("Auguri", 270,340);

if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  text("Buon", 295,100);
  
  
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
    text("Natale", 270,170);
  
  
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  text("Tanti", 300,280);
  
  
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  text("Auguri", 270,340);
  
  
  noSmooth();
  noStroke();

//stella

fill(241,242,0);
translate(width/4.7, height/4.4);
rotate(frameCount/10.0);
rect(-1,-15,4,30);



 }
  



