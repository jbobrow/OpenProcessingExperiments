
//computer arts for processing 60-257
//hw #5 creating a function 
//copyright kyree 2012

float x, y, d;
float c;

void setup()
{
size(400,400);
smooth();

x = 200;
y = 200;
d = 280;
}
//declare and define variables
//float x, y, d;
//x = 200;
//y = 200;
//d = 380;

void draw()
{
  background(158, 209, 187);

  drawNerd(mouseX,mouseY, 200);
}

void drawNerd(float x, float y, float d)
{
//draw ellipse
noStroke(); 
ellipse(x, y, d, d);

//glasses
stroke(151, 60, 0);
strokeWeight(10);
beginShape();
  vertex(x-(d*.5), y);
  vertex(x-(d*.25), y+(d*.25));
  vertex(x, y);
  vertex(x+(d*.25), y+(d*.25));
  vertex(x+d*.5, y);
  vertex(x-(d*.5), y);
endShape();

//eyes
stroke(0);
point(x-(d/4), y*1.1);
point(x+(d*.25), y*1.1);

//teeth
strokeWeight(3);
rect(x-(d*.1), y+(d*.25),d/12,d/10);
rect(x+(d*.01), y+(d*.25),d/12,d/10);

}

void mouseDragged() 
{
  drawNerd (mouseX, mouseY, d);
}
 
