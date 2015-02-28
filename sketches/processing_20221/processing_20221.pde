
void setup() {
size(250, 250);
rectMode(CENTER);
ellipseMode(CENTER);
frameRate(10);
smooth();
}
 
void draw() {
background(50,50,50);

// background grid 
for (int c=0; c<250; c+=10)
{
stroke(255,182,193,15);
line(c,0,c,250);
line(0,c,250,c);
}

// multicoloured stroke hollow circles
for (int a=0; a<250; a+=5)
{
noFill();
 stroke(color(random(255),random(255),random(255),90));
  float b = random(5);
  strokeWeight(b);
ellipse(a,125,mouseX,mouseY);
} 

// beziers moved with mouse
noFill();
strokeWeight(3);
stroke(255);
line (0,125,250,125);
bezier (0, 100, width-mouseX, height-mouseY, width-mouseX, height-mouseY, 250, 100);
bezier (0, 150, mouseX, mouseY, mouseX, mouseY, 250, 150);

// shapes opposite mouse 
noStroke();
fill(255,200);
rect(width-mouseX, height-mouseY, 25, 25);
ellipse(width-mouseX+25, height-mouseY+25, 25, 25);
ellipse(width-mouseX-25, height-mouseY-25, 25, 25);

// shapes following mouse 
rect(mouseX, mouseY, 25, 25);
ellipse(25+mouseX, 25+mouseY, 25, 25);
ellipse(mouseX-25, mouseY-25, 25, 25);
}

