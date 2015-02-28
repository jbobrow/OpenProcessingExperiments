
/* @pjs preload="idea3.png,apple_white2.png,apple.png"; */

PImage imgA;
PImage img;
PImage imgB;
int x, y;
int flag;
int ypos;
int eSize;
int eSize2 = 3;
float r;
float g;
float b;

void setup() {
size(450, 450);
noStroke();
smooth();
fill(0);
  
flag = 0;
 
eSize = 250;
x = width/2;
y = height/2;
ypos = height/2;
imageMode(CENTER); 
}
 
void draw() {
imageMode(CENTER);
imgA = loadImage("idea3.png");//mouse point
img = loadImage("apple_white2.png"); //center kuro Apple
imgB = loadImage("apple.png");//random Apple
  
if (mousePressed) cursor();
else noCursor();
background(#ffffff);
//haikei
for(int y = 0; y <= height; y +=10){
for(int x = 0; x <= width; x += 10){
ellipse(x, y, eSize2, eSize2);
}
} 

if( mouseX>=150 && mouseX<=300 && mouseY>=150 && mouseY<=300){
if(mousePressed == true){
flag = 1;
} 
println("Mouse Click");
}
//random Apple otiru//
if(flag ==1){
    
ypos = ypos+5;
tint(r,g,b);
image(imgB,225,ypos,50,50);
noTint();
if(ypos > height){
flag = 0;
ypos = height/2;
}
}
//random Apple otiru//
image(img,225,225,eSize,eSize);
image(imgA,mouseX, mouseY);
println(flag);
}
//center kuro Apple//
void mouseClicked(){
if( mouseX>=150 && mouseX<=300 && mouseY>=150 && mouseY<=300){
    println("Mouse Click");
}  
  r = random(255); //color
  g = random(255); //color
  b = random(255); //color
}
 
void mousePressed(){
if( mouseX>=150 && mouseX<=300 && mouseY>=150 && mouseY<=300){   
    eSize = 150;
    println("Mouse Click");
 }
}
 
void mouseReleased(){
  if( mouseX>=150 && mouseX<=300 && mouseY>=150 && mouseY<=300){   
  eSize = 250;
  println("Mouse Click");    
 }  
}
//center kuro Apple//



