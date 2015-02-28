
background(#641143);
size(250, 250);

PFont fonta;
fonta = loadFont("Bauhaus93-150.vlw");

PFont fontb;
fontb = loadFont("Bauhaus93-220.vlw");

fill(#FFF598); //yellow, right text
textFont(fonta);
text("m", 160, 70);
text("2", 180, 166);
text("k", 180, 250);

translate(-190, 0); //yellow, left text
fill(#FFF598);
textFont(fonta);
text("m", 160, 70);
text("2", 180, 166);
text("k", 180, 250);


translate(270, 40); //orange, middle tex
textFont(fontb);
fill(#FFC874);
text("2", -20, 70);
text("v", -10, 149);
text("6", -8, 250);



