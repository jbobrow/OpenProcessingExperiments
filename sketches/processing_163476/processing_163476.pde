

PImage pt1;
PImage pt2;
PImage pt3;
PImage pt4;
PImage pt5;
color[] colors = new color[5];
PImage[] images = new PImage[5];
PFont f;

void setup() {
size(1000, 900);
background(250,0,250);
imageMode(CENTER);
pt1= loadImage("pinktroll.png");
pt2= loadImage("pt2.png");
pt3= loadImage("troll pink.png");
images [0] = loadImage("pinktroll.png");
images[1] = loadImage("pt2.png");
images[2] = loadImage("troll pink.png");
images [3] = loadImage ("pt3.png");
images [4] = loadImage ("trollbutt.png");
colors [0] = color(250,250,0);
colors [1] =color(0,250,250);
colors [2] = color(250,0,250);

}

void draw(){

  
  stroke(0,0,0,0);
  if (mouseX>0) {
  fill(80,150,200,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>100) {
  fill(0,40,30,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>200) {
  fill(100,20,255,10);
 ellipse(width/2,height/2,100,100);
}

if (mouseX>300) {
  fill(0,0,0,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>400) {
  fill(255,255,255,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>500) {
  fill(0,255,255,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>600) {
  fill(0,255,0,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>700) {
  fill(255,255,0,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>800) {
  fill(255,0,255,10);
  ellipse(width/2,height/2,100,100);
}

if (mouseX>900) {
  fill(0,0,255,10);
  ellipse(width/2,height/2,100,100);
}


  if(mousePressed){
PImage photo=loadImage("Confetti.png");
tint(colors[(int)random(3)]);
image(photo,mouseX,mouseY);
  
  }
display();
  

}
void display(){
  PFont f= loadFont("Helvetica-BoldOblique-200.vlw");
  fill(0,mouseX,mouseY,20);
  textAlign(CENTER);
textFont(f);
text("2COOL",mouseX,height/2);



if(mouseY>800) {
  background(250,0,250,50);
}
}
 


void mouseClicked(){
  tint(255);
  image(images[(int)random(5)],mouseX,mouseY);
}


