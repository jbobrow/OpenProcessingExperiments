
/* @pjs font = "ArialNarrow-48.vlw"; */
/* @pjs font = "AvenirNextCondensed-DemiBold-48.vlw"; */


size (600, 400);
background (#18958E);
PFont font;
PFont font1;
font = loadFont ("ArialNarrow-48.vlw");
font1 = loadFont ("AvenirNextCondensed-DemiBold-48.vlw");
textFont (font);
fill (255, 160);
String s = "¿Dónde está la biblioteca?";
text (s, 50, 100);
textFont (font1);
fill (0, 160);
String n = "No lo se";
text (n, 50, 150);
textFont (font);
fill (255, 160);
String a = "¿Dónde están los gatos?";
text (a, 50, 200);
textFont (font1);
fill (0, 160);
String b = "En la biblioteca";
text (b, 50, 250);




