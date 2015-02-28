
int x = 200;
int y = 50;
PImage img;
 
float easing = 0.02;
 
void setup() {
 size(600, 600);
  smooth();
  noStroke();
  img = loadImage("space.jpg");
  ellipseMode(RADIUS);
  
}
 
void draw() {
  background(255, 127, 80);
  image(img, 0, 0, mouseX * 2, mouseY * 2);
  
  int targetX=mouseX;
  x+= (targetX-x)*easing;
  if (mousePressed) {
    y = 140;
  } else{
    y = 40;
  }
  
//head and antenna
fill(248, 248, 255);
triangle(x+100, y+30, x+85, y+170, x+115, y+170);
ellipse(x+100, y+ 25, 20, 20);
ellipse(x+5, y+250, 30, 30);
ellipse(x+195, y+250, 30, 30);

//legs
strokeWeight(8);
stroke(248, 248, 255);
line(x+100, y+345, 300, 525);
line(x+80, y+345, 290, 525);
line(x+120, y+345, 310, 525); 

noStroke();


//head and eye
fill(224, 255, 255);
ellipse(x+100, y+250, 100, 100);

fill(180);
ellipse(x+100, y+250, 50, 50);

fill(80);
ellipse(x+100, y+250, 30, 30);

//bottom circle decoration
fill(224, 255, 255);
ellipse(300, 600, 80, 80); 

fill(255, 127, 80);
rect(200, 560, 200, 20);

fill(80);
ellipse(300, 570, 20, 20);



}


