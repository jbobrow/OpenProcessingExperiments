
PImage pic;
void setup()
{
 size (292,720);
 pic = loadImage("pic.jpg");
}

void draw()
{
  image(pic,0,0);
  pic.filter(GRAY);
  stroke(10,55,148);
  strokeWeight(4);
  line(176,344,176,450);
  line(176,344,160,440);
  line(176,344,192,440);
  line(176,344,208,430);
  line(176,344,144,430);
  line(176,344,128,400);
  line(176,344,225,400);
  stroke(255,255,0);
  strokeWeight(10);
  triangle(175,345.5,176,347,177,345.5);
  fill(0,0,0);
  noStroke();
  fill(255,255,255);
  rect(0,0,292,40);
  rect(0,720,292,-40);
  fill(0,0,0);
  rect(94,85,80,30);
  fill(255,0,0);
  rect(0,0,60,720);
  fill(0,255,0);
  rect(292,0,-60,720);

  
}


