
float x=200; //x co-ordinate
float y=200;// y co-ordinate
float angle=0.0;
float offset=60;
float scalar=20;
float speed=0.1;
int eyeHeight=65;
int bodyHeight=75;//body height of purple ellipse
int braceHeight=100;//weight of the braces
int bodyWidth=65;
PImage img;

float easing=0.02;

void setup(){
  size(500,400);
smooth();
ellipseMode(CENTER);
rectMode(CENTER);
img=loadImage("media image.jpg");
}


void draw(){
image(img,0,0);
//translate(mouseX,mouseY);
x+=random(-6,6);
y+=random(-6,6);
x=constrain(x, 200,400);
y=constrain(y,150,300);
//float x=offset+cos(angle)*scalar;
//float y=offset+sin(angle)*scalar;
  
  
//background(222);
//middle connector of the eyes
stroke(0);
fill(255,247,100);
rect(x,y-45,100,y-100);

//drawing the two large eyes
fill(0,5,150);
stroke(25,150,255);
strokeWeight(4);
ellipse(x-50,y-30, bodyWidth/2, eyeHeight);
ellipse(x+50,y-30, bodyWidth/2, eyeHeight);

//drawing the small eyes and pupils
fill(255, 150,255);
noStroke();
ellipse(x-50, y-10, 20,20);
ellipse(x+50, y-10, 20,20);
stroke(255);
point(x-50,y-30);
point(x+50,y-30);

//Drawing the circular body
fill(255,150,250);
stroke(255,247,100);
ellipse(x,y+75,bodyWidth+20, bodyHeight+50);

//Drawing the legs
stroke(25,150,255);
line(x-50,y+150,x-25,y+100);
line(x+25,y+100, x+50,y+150);

//drawing the feet
stroke(25,150,255);
fill(255,100,25);
rect(x-50,y+150,bodyWidth/2,5);
rect(x+50, y+150,bodyWidth/2, 5);
smooth();

//drawing the braces for the body
stroke(100);
strokeWeight(4);
line(x-60,y+75,x+60,y+75);
fill(255,247,100);
strokeWeight(2);
line(x-5,y+40,x-5,y-braceHeight);
line(x+5,y+40,x+5,y-braceHeight);

angle+=speed;
}

