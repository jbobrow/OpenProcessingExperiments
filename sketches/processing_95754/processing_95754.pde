
color[]engineer ={#BAC45E, #ADA344, #734A22, #4C2D22, #261B1D};
color[] palette=engineer ;

int s=80;
int d=20;

size (600, 200);
smooth();
noStroke();
background (palette[0]);

fill(palette[1]);
rect(0,0,s,s);
fill(palette[4]);
ellipse(0,0,d,d);

//translate
translate(40, 90);
fill(palette[2]);
rect(0,0,s,s);
fill(palette[4]);
ellipse(0,0,d,d);

//scale
translate(140, -70);
scale(2);
fill(palette[3]);
rect(0,0,s,s);
scale(.5);
fill(palette[4]);
ellipse(0,0,d,d);

//rotate
translate(280, 10);
scale(1.33);
rotate(PI*.25);
fill(palette[1]);
rect(0,0,s,s);
fill(palette[4]);
ellipse(0,0,d,d);
