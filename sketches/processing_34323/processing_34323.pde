
void setup() {
size(600, 400);
frameRate(60);
 }

float x=random (10);
 float s=1;
  float xw=600;
float wx=0;


void efekt_a() {
if (x>0){
stroke (random(255), random(255), random(255));
line(random(600),random(600),100,300);
line(random(600),random(600),100,300);
line(random(600),random(600),100,300);
line(random(600),random(400),100,300);
line(random(600),random(600),100,300);
line(random(600),random(600),100,300);
line(random(600),random(600),100,300);
line(random(600),random(400),300,150);
line(random(600),random(400),300,150);
line(random(600),random(400),300,150);
line(random(600),random(400),300,150);
line(random(600),random(400),300,150);
}
}

void efekt_b() {if (x>0)
{ float df=random (300,400);
  strokeWeight(random(3, 10));
  stroke(random(255), random(255), random(255));
  fill (random(255), random(255), random(255),55);
  ellipse(300, 500,df,df);
  fill (random(255), random(255), random(255),55);
  ellipse(300, 0, df,df);
  fill (random(255), random(255), random(255),55);
  ellipse(0, 200, df,df);
   fill (random(255), random(255), random(255),55);
  ellipse(600, 200, df,df);
}
}
void efekt_c() { 
  stroke(random(255), random(255), random(255));
  fill (random(255), random(255), random(255),55);
  ellipse(xw-s, 150,200,200);
  fill (random(255), random(255), random(255),55);
  ellipse(wx+s, 150, 200,200);
  s=s+10;
}







void draw() {
  PImage df;
df = loadImage("c111.jpg");
background(df);

  fill (233,237,45);
  stroke(10);
  smooth();
  for (int i = 100; i < 600; i += 100) {
  ellipse(i, 300, 40, 40);
 }
  if (s>600){
    s=0;
  xw=-xw;
  wx=-wx;
}
  
  
  if (mouseButton == LEFT && mousePressed == true &&
  mouseX>90 &&  mouseX<110 &&
  mouseY>280 &&  mouseY<320) {
PImage img; 
img = loadImage("a1.jpg");
image(img, 200, 50,200,200);
efekt_a();
}

 if (mouseButton == LEFT && mousePressed == true && mouseX>180 &&  mouseX<220 &&
  mouseY>280 &&  mouseY<320) {
PImage g; 
g = loadImage("a3.jpg");
tint(random(255), random(255), random (255));
image(g, 200, 50,200,200);}

 if (mouseButton == LEFT && mousePressed == true && mouseX>280 &&  mouseX<320 &&
  mouseY>280 &&  mouseY<320) {
PImage g1; 
g1 = loadImage("a5.jpg");
image(g1, 200, 50,200,200);
efekt_b();
}


if (mouseButton == LEFT && mousePressed == true && mouseX>380 &&  mouseX<420 &&
  mouseY>280 &&  mouseY<320) {
PImage g2; 
g2 = loadImage("a9.jpg");
image(g2, 200, 50,200,200);}

if (mouseButton == LEFT && mousePressed == true && mouseX>480 &&  mouseX<520 &&
  mouseY>280 &&  mouseY<320) {
PImage g6; 
g6 = loadImage("a10.jpg");
image(g6, 200, 50,200,200);
efekt_c();
}
}



