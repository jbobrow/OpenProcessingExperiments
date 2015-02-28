
size (1000, 1000);
int y = height/5;
int d = 150;
PFont myFont; //load my font
myFont = loadFont("BookAntiqua-48.vlw");
String[] dates = {"August 8th, 1220", "August 29th, 1220", "September 26th, 1220", "October 24th, 1220", "December 5th, 1220", "December 24th, 1220"};
float[] masonPennies = {3, 162.5, 264, 261, 661.5, 24.5};
float[] totalPennies = {485, 1078.5, 3802, 1164, 2934, 465};
int[] masons = {1, 5, 8, 5, 11, 1};
int[] totalWorkers = {18, 45, 60, 29, 48, 19};

smooth ();
background(#dbc1a1);


//pies within circles
noStroke();
fill (#8a8866);
arc(200, y, d, d, PI*-0.5, PI*1.4);
arc(400, y, d, d, PI*-0.5, PI*1.1);
arc(600, y, d, d, PI*-0.5, PI*1.1);
arc(800, y, d, d, PI*-0.5, PI*0.3);

//pie headings
textFont(myFont, 20);
textAlign(CENTER);
text("August 8, 1220", 200, d+200);
text("August 29, 1220", 400, d+200);
text("September 26, 1220", 600, d+200);
text("October 24, 1220", 800, d+200);

//thin circles
stroke(#8c3225);
strokeWeight(3);
noFill();
ellipse (200, y, d, d);
ellipse (400, y, d, d);
ellipse (600, y, d, d);
ellipse (800, y, d, d);

// thick arc on perimeter
stroke (#3b3b39);
strokeWeight(12);
strokeCap(SQUARE);
arc(200, y, d, d, PI*-0.5, PI*1.3);
arc(400, y, d, d, PI*-0.5, PI*-0.3);
arc(600, y, d, d, PI*-0.5, PI*0.8);
arc(800, y, d, d, PI*-0.5, PI*0.4);

//tutorial from Lynda.com http://www.lynda.com/Processing-tutorials/Projects-Interactive-Data-Visualization-Processing/116952-2.html?srchtrk=index:0
linktypeid:2
q:processing
page:1
s:relevance
sa:true
producttypeid:2

