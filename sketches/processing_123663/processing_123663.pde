
 color c;
float x;
float y;
float speed;


/* @pjs preload="degradesunset.jpg","pj1.jpg", "roro.jpg","abertoaopublico.jpg","egipto.jpg", "kush2.gif", "k2.gif", "ex.jpg" ; */




void setup() {
 
  
  size(700, 600);
  PImage img;
img = loadImage("degradesunset.jpg");
background(img);

smooth ();
    frameRate (100);
   y=0;
 
c = color(255);
x = 0;
y = 100;
speed = 1;


noStroke();
fill(#FEFF00);
ellipse(350,300,300,300);
fill(#FFCF4B);
rect(0,400,700,200);

stroke(#BFAC77);
strokeWeight(2);
fill(#DBCE6A);
triangle(-100, 500, 160, 160, 350, 500);
triangle(390, 500, 600, 160, 900, 500);
fill(#F5E56D);
triangle(350, 500, 161, 161, 390, 400);
triangle(400, 400, 600, 160, 390, 500);
fill(#F5EC8A);
strokeWeight(3);
rect(327,120,100,380);
triangle(327,120,378,20,427,120);
fill(#E5DD84);
rect(310,480,130,80);

PImage bb;
bb= loadImage("k2.gif");
image(bb,500,320);

stroke(#CEC457);
noFill();
rect(328,208,100,180);
PImage hie;
hie= loadImage("pj1.jpg");
image(hie,327,120);

PImage roro;
roro = loadImage("roro.jpg");
image(roro,100,300);

PImage a1;
a1= loadImage("kush2.gif");
image(a1,45,320);



}

void draw(){ 

stroke(250);
fill(random(255),random (255), random(255));
rect(327,400,100,50);
PImage abe;
abe= loadImage("abertoaopublico.jpg");
image(abe,327,410);

for (int i = 4; i < 100; i = i+20) {
  
noStroke();
fill(random(200), random(150), random(200),random(255));
ellipse(i+105,360,10,10);

ellipse(i+563,360,10,10);
}
strokeWeight(1);
stroke(random(255));
fill(random(100,150),random(100,240),random(10,80), 200);
rect(100,250,100,40,10);

PImage egi;
egi= loadImage("egipto.jpg");
image(egi,100,256);

noFill();
strokeWeight(6);
rect(99,256,101,25,12); 
stroke(random(255),random(255),random(255));
rect(98,298,100,45);


y = y - 1; 
  if (y < 350) { 
    y = 500;
  } 
  fill(random(#FFF158,#FFFFFF));
  point(680, y);
  point(690,y);
  point(535,y);
  point(525,y);


strokeWeight(2);

fill(random(255),random(100,200),random(0,100));  
rect(530,265,170,40,20);
  
fill(random(255));
text("L'Égypte",584,384);
text(" γνῶθι σεαυτόν",112,384);
fill(255);
textSize(15);
text("Tempora mutantur,",555,280);
text("nos et mutamur in illis",540,300);

  
}




