
/* @pjs font = "ArialNarrow-48.vlw"; */
/* @pjs font = "AvenirNextCondensed-DemiBold-48.vlw"; */


size (600, 400);
background (#18958E);
//PFont arialnarrow = loadFont ("ArialNarrow-48.vlw");
//PFont avenirnextcondensed = ("AvenirNextCondensed-DemiBold-48.vlw");
textFont (createFont ("ArialNarrow", 48));
fill (255, 160);
String s = "¿Dónde está la biblioteca?";
text (s, 50, 100);
textFont (createFont ("AvenirNextCondensed", 48));
fill (0, 160);
String n = "No lo se";
text (n, 50, 150);
textFont (createFont ("ArialNarrow", 48));
fill (255, 160);
String a = "¿Dónde están los gatos?";
text (a, 50, 200);
textFont (createFont ("AvenirNextCondensed", 48));
fill (0, 160);
String b = "En la biblioteca";
text (b, 50, 250);




