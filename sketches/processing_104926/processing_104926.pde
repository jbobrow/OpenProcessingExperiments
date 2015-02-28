
size(500,500);
background(255,255,255);

int a = 135;
int circle = 67;
int half = int(circle/2);

color black = color(0,0,0);
color red = color(255,13,13);
color white = color(255,255,255);

//3 black rects
noStroke();
fill(black);
rect(0,0,width,a/2);
rect(0,a/2+10,width,a);
rect(0,height-a/2,width,a/2);


//eyes
fill(white);
ellipse(width/4,a+10,circle,circle);
ellipse(3*width/4,a+10,circle,circle);

fill(black);
ellipse(width/4,a+10,circle/2,circle/2);
ellipse(3*width/4,a+10,circle/2,circle/2);

// red flower
fill(red,95);
ellipse(94,a/4,circle,circle);
ellipse(94-half,a/4+half,circle,circle);
ellipse(94+half,a/4+half,circle,circle);
ellipse(94,a/4+circle,circle,circle);
//small
ellipse(94,a/4+half/2,half,half);
ellipse(94-half/2,a/4+half,half,half);
ellipse(94+circle/4,a/4+half,half,half);
ellipse(94,a/4+3*half/2,half,half);

//mouth

noFill();
stroke(black);
strokeWeight(5);
rect(width/4,2*a,width/2,a/3);

//teeth
line(width/4+40,2*a,width/4+40,2*a+a/3);
line(width/4+40*2,2*a,width/4+40*2,2*a+a/3);
line(width/4+40*3,2*a,width/4+40*3,2*a+a/3);
line(width/4+40*4,2*a,width/4+40*4,2*a+a/3);
line(width/4+40*5,2*a,width/4+40*5,2*a+a/3);

println("I have flower!");
//End
