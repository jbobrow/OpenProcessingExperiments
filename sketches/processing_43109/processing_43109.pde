
size(600,450);
color tan = color(180,177,132);
color blue = color(17,41,198);
color red = color(80,23,9);

PImage img = loadImage("rUx5t.jpeg");
tint(255,51);
image(img,0,0);

PImage car =loadImage("8c5d4567cda98337ede376b4238e190a.png");
image(car,0,-50);
tint(tan,51);
image(car,0,-500);

PFont after = loadFont("AfterShok-12.vlw");
textFont(after);

 
String a ="cheep";
String b ="wshh";
String c ="HI";
String d ="...";
text (a, 100,200,200,400);
text (b, 300,400,600,200);
text (c, 450,200,400,300);
text (d, 100,100,700,100);

smooth();
noStroke();
fill(blue,100);
ellipse(500,50,50,55);

smooth();
noStroke();
fill(red,200);
ellipse(400,150,25,25);

smooth();
noStroke();
fill(blue,300);
ellipse(600,250,100,110);

smooth();
noStroke();
fill(red,600);
ellipse(200,50,225,225);

