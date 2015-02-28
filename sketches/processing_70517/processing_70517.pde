
void setup(){
size(350,390);
background(255);
}

void draw(){
background(255);

ellipseMode(CORNERS);
rectMode(CORNERS);
smooth();
noStroke();

// FixLegs
fill(255);
triangle(120,280,170,240,220,280);

// Ears
fill(247,120,0);
triangle(160,20,140,80,160,80);
triangle(180,20,180,80,200,80);

// Body
fill(86);
ellipse (140,120,200,180);
ellipse (140,180,200,240);
fill(111);
ellipse (150,150,190,210);

// Upper Arms
fill(228,110,37);
rect(60,110,140,130);
rect(200,110,280,130);

// Shoulders
fill(61);
ellipse(120,100,160,140);
ellipse(180,100,220,140);

// Head
fill(247,148,30);
ellipse(139,59,201,121);
triangle(140,100,200,100,170,135);

// Eyes
stroke(255,0,0);
strokeWeight(3.5);
line(143,90,160,100);
line(180,100,197,90);
noStroke();

// Lower Arms
fill(247,148,30);
ellipse(20,100,80,220);
ellipse(260,100,320,220);

// Claws
stroke(61);
strokeCap(SQUARE);
strokeWeight(4.0);
// Outer
line(40,210,43,235);
line(298,210,295,235);
// Middle
line(50,210,53,235);
line(288,210,285,235);
// Inner
line(60,210,63,235);
line(278,210,275,235);
noStroke();

// Mid Legs
fill(228,110,37);
rect(100,260,120,300);
rect(240,260,220,300);

// Feet
fill(247,148,30);
triangle(120,280,140,280,100,360);
triangle(200,280,220,280,240,360);

// Upper Legs
fill(61);
ellipse(90,200,150,280);
ellipse(190,200,250,280);
}
