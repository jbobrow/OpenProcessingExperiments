
PFont font;

size(250,250);
background(#68676C);

font = loadFont("Helvetica-Bold-100.vlw");
textFont(font);

fill(#EAEAEA);
text("M1X1Z7", 100,100);

//second line of text
font = loadFont("Helvetica-Bold-70.vlw");
textFont(font);
fill(#EAEAEA,155);
text("M1X1Z7", 70,155);

//third line of text
font = loadFont("Helvetica-Bold-40.vlw");
textFont(font);
fill(#EAEAEA,100);
text("M1X1Z7M1X", 50,190);

//fourth line of text
font = loadFont("Helvetica-Bold-20.vlw");
textFont(font);
fill(#EAEAEA,50);
text("M1X1Z7M1X1Z7M1X1Z7", 25,210);

//last line of text
font = loadFont("Helvetica-Bold-8.vlw");
textFont(font);
fill(#EAEAEA,30);
text("M1X1Z7M1X1Z7M1X1Z7M1X1Z7M1X1Z7M1X1Z7M1X1Z7M1X1Z7M1X1Z7", 10,220);



