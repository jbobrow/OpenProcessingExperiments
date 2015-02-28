
float speed = 10;
int diameter = 4;
float x;
float y;

PImage bee;


void setup () {
  size(300, 300);
  frameRate(30);
  smooth();
  bee=loadImage("bee.png");
}
 
void draw() {
  println(frameRate);
int x=mouseX;
int y=mouseY;



  
if (mousePressed==false) {
  background(234, 221, 109);
} else {
  background(109, 159, 234);

}
  

 
// bg
line(0, 270, 300, 270);
  
// head and eyes
fill(82, 192, 28);
smooth();
ellipse(x-50, y-50, 75, 175);
fill(0, 0, 0);
 
if (mousePressed==false) {
  ellipse(x-60, y-10, 10, 10);
  ellipse(x-20, y-10, 10, 10);
} else {
  //black
  ellipse(x-60, y-10, 25, 25);
  ellipse(x-20, y-10, 25, 25);
  //white left
  fill(255);
  ellipse(x-57, y-8, 14, 14);
  ellipse(x-61, y-15, 5, 5);
  //white right
  ellipse(x-17, y-8, 14, 14);
  ellipse(x-21, y-15, 5, 5);
}
  
// mouth
fill(224, 243, 14);
ellipse(x-40, y+10, 50, 18);
fill(0);
if (mousePressed==true) {
   ellipse(x-40, y+10, 30, 2);
}
 
// body
fill(82, 192, 28);
ellipse(x-50, y+63, 50, 50);
  
// shoes
fill(0, 0, 0);
ellipse(x-70, y+90, 40, 15);
ellipse(x-30, y+90, 40, 15);

//ARGH BEES
if (mousePressed == false) {
x += random(-speed, speed);
y += random(-speed, speed);
image(bee, x, y, diameter, diameter);

fill(212,0,0);
x += random(-speed, speed);
y += random(-speed, speed);
image(bee, x+10, y+10, diameter, diameter);

fill(245,127,0);
x += random(-speed, speed);
y += random(-speed, speed);
image(bee, x-10, y-10, diameter, diameter);

} else {
  x += random(-speed*2, speed*2);
y += random(-speed*2, speed*2);
image(bee, x, y, bee.width/8, bee.height/8);

fill(212,0,0);
x += random(-speed*2, speed*2);
y += random(-speed*2, speed*2);
image(bee, x+10, y+10, bee.width/8, bee.height/8);

fill(245,127,0);
x += random(-speed*2, speed*3);
y += random(-speed*2, speed*3);
image(bee, x-10, y-10, bee.width/8, bee.height/8);

}

}
  



