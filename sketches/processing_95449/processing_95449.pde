
size(200,200);

PFont Heading;

 Heading = loadFont("Helvetica-Bold-32.vlw");
 textFont(Heading);
 textSize(20);
 fill(0);
 textAlign(LEFT);
 text("Heading", 12, 80, 100, 25);


PFont font;

 font = loadFont("HelveNueThin-32.vlw");

 textFont(font);

 textSize(12);

 fill(0);
 
 textAlign(LEFT);

 text("This is a paragraph of text that has been brought to the display window. You should carefully select the text and typographic composition.", 12, 105, 180, 150);
