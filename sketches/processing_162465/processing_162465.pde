
/* @pjs font="ACaslonPro-SemiboldItalic-48.vlw, AppleSDGothicNeo-UltraLight-48.vlw"; */

size(500, 500); 

background(110, 90, 100);

PFont font;
font = loadFont("ACaslonPro-SemiboldItalic-48.vlw");
textFont(font); 
fill(200, 19, 50);
String q1 = "Are you am animal?";
text(q1, 10, 10, 500, 500);
String q2 ="How so?";
text(q2, 10, 150, 500, 500); 
String q3 = "Are you an animal right now?";
text(q3, 10, 300, 500, 500); 


PFont font2;
font2 = loadFont("AppleSDGothicNeo-UltraLight-48.vlw");
textFont(font2); 
fill(10, 19, 200);
String a1 = "Depends on what you mean. ";
text(a1, 20, 60, 500, 500);
String a2 = "I guess depends on the time of day.";
text(a2, 20, 200, 500, 500);
String a3 = "Yes I think so. Maybe a penguin.";
text(a3, 20, 400, 500, 500); 





