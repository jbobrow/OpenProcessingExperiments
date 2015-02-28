
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Olympic Rings
//URL -> http://padova.webs.com/OlympicRingsSite.html

size(395,210);
background(255,255,255);
smooth();
noFill();

//The rings are split into pieces in order to make them appear linked. There are white
//edges to imitate those on the insignia as well. I denote them in parentheses; each
//corresponds to the intersection with the first on top and the second below.

//Blue Ring Part 1
strokeWeight(10);
stroke(0,110,255);
arc(80,80,100,100,PI/4,7*PI/4);

//White Edge (YBlu)
strokeWeight(18);
stroke(255);
arc(138,130,100,100,7*PI/8,9*PI/8);

//Yellow Ring Part 1
strokeWeight(10);
stroke(255,200,0);
arc(138,130,100,100,-PI/4,3*PI/2);

//White Edge (BlaY)
strokeWeight(18);
stroke(255);
arc(196,80,100,100,PI/2,5*PI/8);

//Black Ring Part 1
strokeWeight(10);
stroke(0);
arc(196,80,100,100,PI/4,7*PI/4);

//White Edge (GBla)
strokeWeight(18);
stroke(250);
arc(254,130,100,100,7*PI/8,9*PI/8);

//Green Ring Part 1
strokeWeight(10);
stroke(0,180,80);
arc(254,130,100,100,-PI/4,3*PI/2);

//White Edge (RG)
strokeWeight(18);
stroke(255);
arc(312,80,100,100,PI/2,5*PI/8);

//Red Ring
strokeWeight(10);
stroke(255,0,0);
ellipse(312,80,100,100);

//White Edge (GR)
strokeWeight(18);
stroke(255);
arc(254,130,100,100,-PI/2+.05,-3*PI/8);

//Green Ring Part 2
strokeWeight(10);
stroke(0,180,80);
arc(254,130,100,100,-PI/2+.05,-PI/4);

//White Edge (BlaG)
strokeWeight(18);
stroke(255);
arc(196,80,100,100,-PI/8,PI/8);

//White Edge (YBla)
stroke(255);
strokeWeight(18);
arc(138,130,100,100,-PI/2,-PI/2+PI/8);

//Yellow Ring Part 2
strokeWeight(10);
stroke(255,200,0);
arc(138,130,100,100,-PI/2+.05,-PI/4);

//White Edge (BluY)
strokeWeight(18);
stroke(255);
arc(80,80,100,100,-PI/8,PI/8);

//Blue Ring Part 2
strokeWeight(10);
stroke(0,110,255);
arc(80,80,100,100,7*PI/4,9*PI/4);

//Black Ring Part 2
strokeWeight(10);
stroke(0);
arc(196,80,100,100,-PI/4,PI/4);
