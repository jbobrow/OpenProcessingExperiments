

//declare an image or variable
PImage deer;
PImage cloudsI;
PFont Helvetica48; 
int ellipseX;
int ellipseY;

void setup() {
  size(1000,450);
  //initialize that image by connecting it with an actual file
  deer = loadImage("deer.jpg");
  cloudsI = loadImage("cloudsI.jpg");

  background (176,226,255);
  ellipseX = 1;
  Helvetica48 = loadFont("Helvetica-Light-48.vlw");
}

void draw () {
  //draw that image
  //image(myImage, x, y, width, height);
 

  image(cloudsI,0,0);
  image(cloudsI,500,0);
  image(deer,600,240);
   
   textFont(Helvetica48);
  text("virtual barf bag", 350, 70);


 
  if(mousePressed) {
    fill(0);
    fill(random(255), random(255), random(255));
  } else {
    fill(random(255), random(255), random(255));
    fill(255);
  }
 
  
  
  //body
  rectMode(CENTER);
  fill(139,90,0);
rect(350,350,375,100);
//head
fill(184,134,11);
ellipse(175,300,150,105);
//whites of eyes
fill(255,250,240);
ellipse(200,300,32,20); 
ellipse(119,300,32,20); 
//irises 
 fill(138,54,15);
 if(mousePressed) {
    fill(0);
    fill(random(255), random(255), random(255));
  } else {
    fill(random(255), random(255), random(255));
    fill(255);
  }

ellipse(200,300,25,18);
ellipse(119,300,25,18);
//pupils
fill(41,36,33);
ellipse(200,300,15,15);
ellipse(119,300,15,15);
//white eye reflections
fill(255,250,240);
ellipse(200,300,5,5);
ellipse(119,300,5,5);
//random color nose
 fill(41,36,33);

  
ellipse(150,330,40,25);
//nostrils
fill(192,192,192);
ellipse(145,325,15,4);
//ears
fill(139,37,0);
triangle(210,265,255,275,245,350);
triangle(110,265,90,275,105,335);
//legs
rect(175,420,25,55);
rect(525,420,25,55);
//leg separation
fill(41,36,33);
rect(175,420,3,55);
rect(525,420,3,55);

    
  fill(3,3,3);
  if(mousePressed) {
    fill(0);
    fill(random(255), random(255), random(255));
  } else {
    fill(random(255), random(255), random(255));
    fill(255);
  }
  ellipse(mouseX, mouseY, 150, 150);
  
}
  




