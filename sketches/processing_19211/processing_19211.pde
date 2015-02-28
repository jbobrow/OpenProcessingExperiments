
//static background setup
size(250, 250);
background(22, 14, 65);

//font variables
PFont font1;
font1= loadFont("AmericanTypewriter-CondensedBold-250.vlw");
PFont font2;
font2= loadFont("FrutigerCE-UltraBlack-250.vlw");
textFont(font1, 20);
smooth();
noStroke();

//background grid of characters
for( int f=-20; f<=height; f+=20)
{
  fill(62, 50, 155, 100);
  text("L", f, 25);
  text("5", f+10, 45);
  text("B", f, 65);
  text("3", f+10, 85);
  text("J", f, 105);
  text("4", f+10, 125);
  text("L", f, 145);
  text("5", f+10, 165);
  text("B", f, 185);
  text("3", f+10, 205);
  text("J", f, 225);
  text("4", f+10, 245);
  //front
  fill(175, 5, 79, 150);
  text("L", f, 20);
  fill(230, 109, 123, 100);
  text("5", f+10, 40);
  fill(175, 5, 79, 150);
  text("B", f, 60);
  fill(230, 109, 123, 100);
  text("3", f+10, 80);
  fill(175, 5, 79, 150);
  text("J", f, 100);
  fill(230, 109, 123, 100);
  text("4", f+10, 120);
  fill(175, 5, 79, 150);
  text("L", f, 140);
  fill(230, 109, 123, 100);
  text("5", f+10, 160);
  fill(175, 5, 79, 150);
  text("B", f, 180);
  fill(230, 109, 123, 100);
  text("3", f+10, 200);
  fill(175, 5, 79, 150);
  text("J", f, 220);
  fill(230, 109, 123, 100);
  text("4", f+10, 240);
}

//floating large transparent characters
textFont(font2, 200);
fill(255, 153, 96, 60);
text("L", random(250), random(250));
text("5", random(250), random(250));
text("B", random(250), random(250));
text("3", random(250), random(250));


