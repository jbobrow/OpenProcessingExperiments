
//homework #5: target drawing - 48257 S'12
//melissa (macy) goh copyright 2012

float x, y, wd, ht;
float r, g, b;
float s;

void setup()
{
 size(400, 400);
 background(240, 223, 218);
 smooth();
 frameRate(100);
 x = 150;
 y = 150;
 wd = 100;
 ht = 100;
 s = 2;
 drawInitials(x, y, wd, ht);
 
 r = 190;
 g = 200;
 b = 211;
}

void mousePressed()
{
   noStroke();
   fill(240, 223, 218, 30);
   rect(0, 0, width, height);
   x = mouseX - wd/2;
   y = mouseY - ht/2;
}

void keyPressed()
{
 if (keyCode == UP)
 {
   wd = wd*2;
   ht = ht*2;
   x = x - wd/4;
   y = y - ht/4;
   s = s * 1.25;
 }

 if (keyCode == DOWN)
 {
   wd = wd/2;
   ht = ht/2;
   x = x + wd/2;
   y = y + ht/2;
   s = s * 0.75;
 }
 
 if (keyCode == ' ')
 {
   r = random(255);
   g = random(255);
   b = random(255);
 }
}
 
void draw()
{
 noStroke();
 fill(240, 223, 218, 30);
 rect(0, 0, width, height);
 drawInitials(x, y, wd, ht);
}

void drawInitials(float x, float y, float wd, float ht)
{
 stroke(240, 99, 60);
 strokeWeight(s);
 fill(250, 244, 242);
 ellipse(x + wd*.5, y + ht*.5, wd, ht);

 noStroke();
 fill(r, g, b);
 ellipse(x + wd*.5, y + ht*.25, wd*.66, ht*.33);
 ellipse(x + wd*.5, y + ht*.75, wd*.66, ht*.33);

 fill(250, 244, 242);
 ellipse(x + wd*.5, y + ht*.30, wd*.33, ht*.33);
 ellipse(x + wd*.5, y + ht*.70, wd*.33, ht*.33);

 fill(r, g, b);
 quad(x + wd*.5, y + ht*.49, x + wd*.5, y + ht*.51, x + wd*.20, y +
ht*.32, x + wd*.32, y + ht*.35);
 quad(x + wd*.5, y + ht*.51, x + wd*.5, y + ht*.49, x + wd*.80, y +
ht*.68, x + wd*.68, y + ht*.65);

 stroke(220, 231, 245);
 strokeWeight(s);
 beginShape();
   vertex(x + wd*.15, y + ht*.30);
   vertex(x + wd*.15, y + ht*.75);
 endShape();

 beginShape();
   vertex(x + wd*.30, y + ht*.30);
   vertex(x + wd*.30, y + ht*.75);
 endShape();

 beginShape();
   vertex(x + wd*.45, y + ht*.30);
   vertex(x + wd*.45, y + ht*.75);
 endShape();

 noFill();
 beginShape();
   curveVertex(x + wd*.15, y + ht*.50);
   curveVertex(x + wd*.15, y + ht*.30);
   curveVertex(x + wd*.22, y + ht*.25);
   curveVertex(x + wd*.30, y + ht*.30);
   curveVertex(x + wd*.30, y + ht*.50);
 endShape();

 beginShape();
   curveVertex(x + wd*.30, y + ht*.50);
   curveVertex(x + wd*.30, y + ht*.30);
   curveVertex(x + wd*.37, y + ht*.25);
   curveVertex(x + wd*.45, y + ht*.30);
   curveVertex(x + wd*.45, y + ht*.50);
 endShape();

 stroke(57, 76, 98);
 beginShape();
   vertex(x + wd*.55, y + ht*.35);
   vertex(x + wd*.55, y + ht*.65);
 endShape();

 beginShape();
   vertex(x + wd*.85, y + ht*.55);
   vertex(x + wd*.85, y + ht*.65);
 endShape();

 beginShape();
   curveVertex(x + wd*.55, y + ht*.75);
   curveVertex(x + wd*.55, y + ht*.35);
   curveVertex(x + wd*.70, y + ht*.25);
   curveVertex(x + wd*.85, y + ht*.35);
   curveVertex(x + wd*.85, y + ht*.75);
 endShape();

 beginShape();
   curveVertex(x + wd*.55, y + ht*.25);
   curveVertex(x + wd*.55, y + ht*.65);
   curveVertex(x + wd*.70, y + ht*.75);
   curveVertex(x + wd*.85, y + ht*.65);
   curveVertex(x + wd*.85, y + ht*.25);
 endShape();

 beginShape();
   vertex(x + wd*.75, y + ht*.55);
   vertex(x + wd*.85, y + ht*.55);
 endShape();
}

