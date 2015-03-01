
//ex 13.1,2,3 explore typefaces draw favorite typefacs, words paragraph, dialogue.
/* @pjs font = "Lavanderia-Delicate-36.vlw; */
/* @pjs font = "Barkentina-48.vlw"; */

size (300,300);
background(142,237,255);

PFont font1, font2;
font1 = loadFont("Lavanderia-Delicate-36.vlw");
font2 = loadFont("Barkentina-48.vlw");

textFont(font1);
textSize(24);
fill(201,14,183);
textAlign (RIGHT);
textLeading(26);
String s="Do not try and bend the spoon. That's impossible.";
String s1="Instead... only try to realize the truth.";
String s2="There is no spoon.";
String s3="Then you'll see, that it is not the spoon that bends, it is only yourself.";
text(s,10,20,200,200);
text(s1,30,80,180,200);
text(s2,10,150,200,200);
text(s3,50,200,160,200);


fill(2,94,219);
textAlign(LEFT);
textFont(font2);
textSize(14);
String n="What truth?";
String n2="There is no spoon?";

text(n,170,150);
text(n2,170,190);




