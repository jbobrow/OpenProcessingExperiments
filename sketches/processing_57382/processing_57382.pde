
int radius = 10;
float w;
float y;
float d;
float x;
//why wont this work - PImage img;
PImage img;
PFont font;
//int f = 180 //fill colour - body and head
String quote = "beep beep";
 
void setup(){
  size(720, 480);
smooth();
 
strokeWeight(2);
background(204, 40, 100);
ellipseMode(RADIUS);

 img = loadImage("circuit.png"); // save transparent images as png
 
 font = loadFont("AmericanTypewriter-Light-48.vlw");
textFont(font);
 
}
 
void draw(){
  
   w = random (-100, 800);
y = random(-100, 800);
d = random(-100, 800);
x = random(-100, 800);
  
   image(img, 0, 0); 
   
displayRobot();
functionWink();
functionRadiowaves();
functionBeepbeep();
}
  
void displayRobot(){
  
fill(100);                  //antennea
stroke(mouseY, mouseX, 100);
ellipse(width/2, 80, 10, 10);
stroke(100);
strokeWeight(2);
line(width/2, 105, width/2, 90);

noFill();                    //antenna waves
stroke(100, mouseY, mouseX);
ellipse(width/2, 80, 30, 30);
 noFill();
stroke(mouseY, 100, mouseX);
ellipse(width/2, 80, 50, 50);
 
  stroke(180);                //head 
  fill(180);
ellipse(width/2, 155, 50,50); 
 
fill(mouseY, mouseX, 100);
ellipse(340, 145, 5, 5); //left eye

noStroke();   //body
fill(180);
triangle(width/2, 205, width/2-60, 350, width/2+60, 350);
 
fill(100, mouseX, mouseY);     //buttons
ellipse(width/2, 230, 5, 5);
fill(mouseX, 100, mouseY);
ellipse(width/2, 245, 5, 5);
fill(mouseY, mouseX, 100);
ellipse(width/2, 260, 5, 5);
 
  strokeWeight(2);                 //wheel
  stroke(100);
  line(width/2, 350, width/2, 360);
  stroke(180);
  fill(180); 
  ellipse(width/2, 380, 20, 20);
  fill(100);
  ellipse(width/2, 380, 10, 10);
}
 
 void functionWink(){
  
   if (mousePressed == true){   //wink
  fill(100);
}else{
fill(mouseX, mouseY, 100);
}
ellipse(380, 145, 10, 10); //right eye
  
  noFill();       //mouth
stroke(100);
strokeWeight(2);
if(mousePressed){
  arc (width/2, 155, 40, 40, 0.7, 2.1); //smile
}else{
arc(width/2, 155, 40, 40, 1, 2.1); 
}
 }
 
void functionRadiowaves(){

   float d = dist(mouseX, mouseY, width/2, 80); //antenna radar
  if (d < radius) {
    radius++;
fill(0,0);
strokeWeight(2);
stroke(222, 31, 187, 90);
  }else{
    fill(255, 0);
  }
  ellipse(width/2, 80, radius, radius);

}

void functionBeepbeep(){
 
 if (keyPressed) {  //beepbeep words
   fill(150+w, y, d, x);
   text(quote, w, y, d, x);
 }
 
}


