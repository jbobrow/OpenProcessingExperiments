
//Nigel Z, Functions and Animation, CP1, Mods 14-15
//url: http://ilikepie222.webs.com/dugtrioAnimation.html

int change = 5;
int height = 20;
int eyes = 20;
void setup ()
{
  size (600,600);
  frameRate (60);
}
void draw ()
{
//body
  background (29,237,225);
  fill (139,69,19);
  ellipse (300,600,160,height+125);
  ellipse (170,600,160,height);
  ellipse (420,600,160,height-50);
// eyes
  fill (0);
  ellipse (300-20,(1180-eyes)/2,10,25);
  ellipse (300+20,(1180-eyes)/2,10,25);
  ellipse (170-20,(1300-eyes)/2,10,25);
  ellipse (170+20,(1300-eyes)/2,10,25);
  ellipse (420-20,(1350-eyes)/2,10,25);
  ellipse (420+20,(1350-eyes)/2,10,25);
  fill(255);
  ellipse (300-20,(1163-eyes)/2,7,8);
  ellipse (300+20,(1163-eyes)/2,7,8);
  ellipse (170-20,(1283-eyes)/2,7,8);
  ellipse (170+20,(1283-eyes)/2,7,8);
  ellipse (420-20,(1333-eyes)/2,7,8);
  ellipse (420+20,(1333-eyes)/2,7,8);
//nose
  fill(211,113,113);
  ellipse (300,(1240-eyes)/2,40,20);
  ellipse (170,(1360-eyes)/2,40,20);
  ellipse (420,(1410-eyes)/2,40,20);
  height = height + change;
  eyes = eyes + change;
  if (height>350)
  {
    change = -5;
  }
  if (height<150)
  {
    change = 5;
  }
  if (eyes<150)
  {
    change = 5;
  }
}
