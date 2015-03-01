
// s : save png
PImage elka;
PImage snow;
PImage ow;
float x = random(10, 1000);
float y = random(10, 600);

void setup() {
size(1000, 600);
snow = loadImage("12.jpg");
elka = loadImage("blic.png");
ow = loadImage("owsa.png");
smooth();
noStroke();
strokeWeight(0);
}

void draw() {
smooth();
image(snow, 0, 0, 1000, 600);
image(elka, 0, 0, 1000, 600);
image(ow, 280+mouseX/30, 100+mouseY/30, 430+mouseX/30, 430+mouseY/30);
 fill(#ffffff);
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
ellipse(random(1000), random(600), 5, 5); 
}

void keyReleased(){
  if (key=='s' || key=='S') saveFrame("Pro.png");
}
