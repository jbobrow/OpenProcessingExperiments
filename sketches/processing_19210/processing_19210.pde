
//static background setup
size(250, 250);
background(73, 45, 73);

//font variables
PFont font1;
font1= loadFont("Lot-100.vlw");
PFont font2;
font2= loadFont("ZagRegular-200.vlw");
textFont(font1, 10);
smooth();

//background font plaid pattern
for(int l=0; l<=height; l+=20)
{
  fill(81, 68, 95);
  text("L", 40, l);
  text("5", 50, l);
  text("B", 80, l);
  text("3", 90, l);
  text("J", 140, l);
  text("4", 200, l);
  fill(90, 92, 117);
  text("L", l, 40);
  text("5", l, 50);
  text("B", l, 80);
  text("3", l, 90);
  text("J", l, 140);
  text("4", l, 200);
}

//transparent characters in corner
textFont(font2, 200);
fill(209, 182, 141, 100);
text("L", 70, 225);
text("5", 90, 225);
text("B", 110, 225);
text("3", 130, 225);
text("J", 150, 225);
text("4", 170, 225);


