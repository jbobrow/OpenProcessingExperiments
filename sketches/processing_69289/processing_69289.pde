
int x=-150;
int y=-150;
void setup()
{
  size(500, 110);
  noFill();
  frameRate(40);
}
void draw()
{
  chicken();
  banner();
}
void chicken()
{
  background(255);
  //Tail
  strokeWeight(2.5);
  fill(242, 144, 144);
  beginShape();
  vertex(25+x, 64);
  vertex(21+x, 61);
  vertex(16+x, 63);
  vertex(12+x, 68);
  vertex(12+x, 72);
  vertex(21+x, 71);
  vertex(20+x, 73);
  vertex(21+x, 77);
  vertex(25+x, 77);
  vertex(25+x, 76);
  vertex(27+x, 78);
  vertex(27+x, 79);
  vertex(31+x, 78);
  endShape();
  //Head-thing
  beginShape();
  vertex(45+x, 20);
  vertex(46+x, 5);
  vertex(47+x, 2);
  vertex(48+x, 0);
  vertex(49+x, 2);
  vertex(50+x, 5);
  vertex(51+x, 10);
  vertex(52+x, 9);
  vertex(54+x, 10);
  vertex(56+x, 9);
  vertex(58+x, 12);
  endShape();
  //Shadow
  pushStyle();
  noStroke();
  strokeWeight(0);
  fill(224, 220, 215);
  beginShape();
  vertex(40+x, 25);
  vertex(25+x, 65);
  vertex(30+x, 77);
  vertex(40+x, 84);
  vertex(50+x, 88);
  vertex(70+x, 90);
  vertex(95+x, 85);
  vertex(107+x, 61);
  vertex(105+x, 55);
  vertex(95+x, 68);
  vertex(85+x, 78);
  vertex(75+x, 76.5);
  vertex(65+x, 75);
  vertex(50+x, 68);
  vertex(43+x, 50);
  vertex(40+x, 25);
  endShape();
  //Beak
  popStyle();
  strokeWeight(2);
  fill(240, 164, 51);
  beginShape();
  vertex(86+x, 15);
  vertex(87.5+x, 18.5);
  vertex(85+x, 22);
  vertex(86+x, 29);
  vertex(87+x, 29);
  vertex(97+x, 29);
  endShape();
  //Left foot
  beginShape();
  vertex(95+x, 85);
  vertex(100+x, 87);
  vertex(102+x, 83);
  vertex(108+x, 78);
  vertex(104+x, 76);
  endShape();
  //Right foot
  strokeWeight(2);
  beginShape();
  vertex(50+x, 70);
  vertex(48+x, 75);
  vertex(50+x, 85);
  vertex(57+x, 85);
  vertex(55+x, 83);
  vertex(57+x, 80);
  vertex(65+x, 77);
  vertex(60+x, 74);
  vertex(57+x, 76);
  vertex(60+x, 71);
  vertex(56+x, 71);
  vertex(54+x, 73);
  vertex(54+x, 68);
  vertex(52+x, 68);
  vertex(50+x, 70);
  endShape();
  //Beard-thing
  fill(242, 144, 144);
  beginShape();
  vertex(87+x, 29);
  vertex(88+x, 32);
  vertex(84+x, 34);
  vertex(87+x, 55);
  vertex(85.5+x, 76);
  vertex(89+x, 70);
  vertex(93+x, 57);
  vertex(96+x, 38);
  vertex(90+x, 29);
  endShape();
  //Eye
  strokeWeight(3);
  point(73+x, 20);
  //Body
  noFill();
  bezier(25+x, 65, 30+x, 95, 90+x, 105, 105+x, 70);
  bezier(25+x, 65, 35+x, 10, 65+x, 10, 70+x, 10);
  bezier(70+x, 10, 100+x, 10, 110+x, 60, 105+x, 70);
  x=x+5;
  if (x>width+90)
  {
    x=0;
  }
}
void banner()
{
  fill(0);
  textSize(30);
  text("LOL!",-70+y,55);
  y=y+5;
  if (y>width+90)
  {
    y=0;
  }
}
