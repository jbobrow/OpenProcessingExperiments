
float Xpos =300;
float Ypos =600;
boolean  isThatTrue = false;
int x = 0;

void setup(){
size (800,400);
smooth();
PFont score;
textSize(20);
score = createFont("verdana",20);
}

void draw(){
  background (0);
  text(x,200,70);
  text("Score",120,70);
  PImage b;
   PImage d;
b=loadImage("b.jpg");
 image(b, Xpos, Ypos, 50,25);
 Ypos+=7; 
 
d=loadImage("d.jpg");
 image(d, mouseX ,340, 60,60);
  
 if (Ypos>=400){
 Ypos = 0;
  Xpos = random(0,800);
 }
 

 if (Xpos>=mouseX-50 && Xpos<=mouseX + 50 && Ypos >= 300){
  Ypos = 0;
  Xpos = random(0,800);
  x++;
 }
 
 if(x>=5){
 x=5;
 text("You Win!!!!",200,200);
 text("click to restart",300,300);
 Ypos = 0;
 }

if (mousePressed == true){
  x=0;
}

}


