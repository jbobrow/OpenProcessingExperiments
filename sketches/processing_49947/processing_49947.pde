
//Modnrian Recreation, Assignment 1, January 24, 2012
//by Mariana Moreno- Gonzalez

//Image Source: http://apointindesign.files.wordpress.com/2010/06/10058750.jpg
//Code Source: Processing.org

size (600,800);
background (255,255,247);

//colored squares
noStroke ();
fill (255,221,46);
rect (0,0,250,200);
fill (108,49,22);
rect (0,705,160,705);

//grid
stroke (0);
strokeWeight (13);
//outer horizontal lines
line (160,0,160,800);
line (440,0,440,800);
//inner horizontal lines
line (250,0,250,800);
line (275,0,275,800);
strokeWeight (17);
//4 vertical lines (in order)
line (0,110,600,110);
line (0,200,600,200);
line (0,290,600,290);
line (0,705,248,705);



