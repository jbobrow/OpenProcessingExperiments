
PFont font;

size(250,250);
background(#AD3D73);

font = loadFont("Braggadocio-110.vlw");
textFont(font);

//top line
fill(#EAEAEA);
text("M1X", -10,110);

//shadow
fill(#EAEAEA,20);
text("M1X", 0,100);

//bottom line (1z7)
fill(#EAEAEA);
text("1Z7", -10,230);

//shadow 2
fill(#EAEAEA,20);
text("1Z7", 0,220);

//middle line of text
font = loadFont("Braggadocio-7.vlw");
  textFont(font);

  fill(#EAEAEA,200);
  text("M1X1Z7 M1X1Z7 M1X1Z7 M1X1Z7 M1X1Z7 M1X1Z7 M1X1Z7 M1X1Z7 ", -10,127);

