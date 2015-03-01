

// the basic version
//size(600, 200);
//background(0);
//String wordText = "Hello, world!";
//text(wordText, width/2, height/2);

// other version
size(600, 200);
background(#302F2F);

// preparing font
PFont testFont;
testFont = loadFont("Beamie-20.vlw");
textFont(testFont);
textAlign(CENTER, CENTER);
textLeading(160);
fill (#FFE224);

// content for text and text call
String wordText = "Hello, world!";
text(wordText, width/2, height/2);


