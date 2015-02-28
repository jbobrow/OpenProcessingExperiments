
int wCen, hCen, myCir, myR1, myR2, myR3; 

void setup(){
  

  size(360,600); stroke(255); smooth();
}

void draw(){wCen= width/2; hCen= 200; myCir=250;


myR1= myCir/2-2;
myR2= myCir/2-20;
myR3= myCir;
 noStroke();
fill(28,153,185);

rect(200,380,80,20);
rect(260,330,100,40);
rect(150, 420, 60,10);
rect(130, 440, 50,10);
rect(150, 460, 120,30);
 
 
  background(0);
  fill(255);
  noStroke();

PImage img1, bunny, alice2;
img1 = loadImage("img1.jpg");
image(img1,0,0,width,height);
bunny = loadImage("bunny.gif");
alice2= loadImage("alice2.gif");


  ellipse(360,200,250,250);
    ellipse(0,200,250,250);

stroke(28,153,185);
strokeWeight(3);


 ellipse(360,200,200,200);
 
  float j = map(second(), 0, 60, 0, TWO_PI) -  HALF_PI;
   float p = map(minute(), 0, 60, 0, TWO_PI) -  HALF_PI;
    float b = map(hour()% 12, 0, 12, 0, TWO_PI) -  HALF_PI;
    

    image( bunny, cos(j) * myR1 + 360, sin(j) *  myR1+hCen,120,120);
    line( 360, hCen, cos(p) * myR2 + 360, sin(p) * myR2+hCen);
    line( 360, hCen, cos(b) * myR3 + 360, sin(b) * myR3+hCen);

 
  ellipse(0,200,200,200);
 
 
  float s = map(second(), 0, 60, 0, TWO_PI) -  HALF_PI;
   float m = map(minute(), 0, 60, 0, TWO_PI) -  HALF_PI;
    float h = map(hour()% 12, 0, 12, 0, TWO_PI) -  HALF_PI;
    
    stroke(28,153,185);
    image(bunny, cos(s) * myR1+ 0, sin(s) *  myR1+hCen,120,120);
    line( 0, hCen, cos(m) * myR2 + 0, sin(m) * myR2+hCen);
    line(0, hCen, cos(h) * myR3 + 0, sin(h) * myR3+hCen);

noStroke();
fill(28,153,185);
rect(200,380,80,20);
rect(150, 420, 60,10);
rect(130, 440, 50,10);

fill(112,182,201);
rect(150, 460, 120,30);
fill(13,103,126);
rect(200, 500, 160, 50);
image(alice2, 160,100,330,600);


  PFont f;

f= loadFont("Garamond-60.vlw");
textFont(f);
text("To the Wonderland",
10,30, width, height);

stroke(28,153,185);
line(200,380,200,0);
line(150,420,150,600);
line(130,440,130,600);
stroke(13,103,126);
line(200,500,200,600);


}



