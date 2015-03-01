
int ellipseX;
int triangleX;
int rectY;
int rectX;

void setup() {
  size(700, 700);
  smooth();
  ellipseX = 1;
  
  
  
}

void draw() {
  if(mousePressed) {
    fill(0);
    fill(random(255), random(255), random(255));
  } else {
    fill(random(255), random(255), random(255));
    fill(255);
  }
  background(191, 239, 255);
  noStroke();
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
//tail
triangle(535,300,545,305,triangleX,330);
triangleX = triangleX +1;
  }



