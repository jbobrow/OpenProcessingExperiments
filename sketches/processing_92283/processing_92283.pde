
float x;

size(391, 500);
background(#0F00F5);
smooth();
strokeWeight(2);
stroke(#F57F00);

String[] nba = loadStrings("nba.txt");

for (int i = 0; i < nba.length; i++){
  x = i*((width/391));
  line(x, float(height), x, 1000-float(nba[i])*10);
}

fill(#FFFFFF);
textAlign(CENTER);
text("SHAQ", 15, 100);
line(15, 104, 15, 200);

text("KARL MALONE", 101, 140);
line(101, 144, 101, 200);

text("MICHAEL JORDAN", 226, 170);
line(226, 174, 226, 250);

text("STEVE NASH", 318, 200);
line(318, 204, 318, 250);


strokeWeight(3);
stroke(#502A02);
line(0, 1000-690, width, 1000-690);
fill(#502A02);
text("Average American", width/2, 1000-670);

textSize(9);
text("Source: http://www.allstarnba.es/players/players-by-height.htm", width/2, 490);

