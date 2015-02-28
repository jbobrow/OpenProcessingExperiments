
size(500,500);
background(255);
smooth();

PFont font;
font=loadFont("HelveticaNeue-Bold-18.vlw");
textFont(font,18);
fill (0);
text("TALK TOO MUCH IS BAD FOR HEALTH",100,60);

float s = random(150,150);
stroke(s);
float change= s-34.0;
float r = random(20);
strokeWeight(r);
float offset= r*3.0;
noFill();
ellipse(100, random(500), 100, random(500));
rect(100, random(500), 100, random(500));
line(random(500), random(500), random(500) , random(500));
//random pattern 01


float g = random(58,83);
stroke(g);
float dontknow= g+2.0;
float h = random(15);
strokeWeight(h);
float showoff= h*3.0;
ellipse(180, random(350), 160, random(500));
rect(256, random(500),256 , random(350));
line(random(225), random(500), random(380) , random(500));
//random pattern 02

float i = random(99,34);
stroke(i);
float dontknowwhat= i+4.0;
float j = random(23);
strokeWeight(j);
float showoffwhat= j*3.5;
ellipse(99, random(222), 60, random(333));
rect(350, random(500),350 , random(350));
line(random(444), random(333), random(380) , random(500));
//random pattern 03







