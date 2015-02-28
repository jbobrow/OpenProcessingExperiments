
//My font example
//for copyright reasons we cannot use truetype or open type fonts, use the "create font" tool
PFont myFont;
size(400,400);
myFont = loadFont("AndaleMono-48.vlw");
fill(200,100,20);
textFont(myFont, 20);
text("Hello world", 10, 20);


