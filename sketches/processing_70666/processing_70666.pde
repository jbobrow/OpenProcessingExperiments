
size(371,374);
background(252,245,231);

// color rectangles
noStroke();
//red
fill(240,78,61);
rect(width*.226,0,width*(1-.226),height*.735);
//blue
fill(63,151,199);
rect(0,height*.735,width*.226,height*(1-.735));
//yellow
fill(248,216,0);
rect(width*.93,height*.885,width*(1-.93),height*(1-.885));

// vertical line
strokeWeight(9.5);
stroke(56,44,43);
strokeCap(SQUARE);
line(width*.226,0,width*.226,height);

// other lines
line(0,height*.735,width,height*.735);
line(width*.93,height*.735,width*.93,height);
strokeWeight(16);
line(0,height*.315,width*.226,height*.315);
strokeWeight(12);
line(width*.93,height*.885,width,height*.885);
