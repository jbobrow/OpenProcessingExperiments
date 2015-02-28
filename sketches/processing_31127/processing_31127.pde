
size (500,500);
background (255);

//make the blue sky
stroke (215,244,245);
fill (215,244,245);
rect (0,0,500,300);

//make the green field on the bottom
stroke (158,211,115);
fill (158,211,115);
rect (0,300,500,500);


//create the body
stroke (255);
fill (255);
ellipse (250,250,200,260);

//making the black eyes
stroke (0);
fill (0);
ellipse (210,200,40,40);
ellipse (300,200,40,40);

//making the white inside the eyes
fill (255);
ellipse (211,195,15,15);
ellipse (295,190,15,15);

// create two legs
stroke (247,229,87);
fill (247,229,87);
bezier (190,352,140,360,220,410,230,375);
bezier (290,372,280,370,350,400,330,329);

// the nose
triangle (230,230,270,230,250,260);

// two wings
bezier (170,170,90,280,120,320,170,260);
bezier (330,170,420,280,380,320,350,260);

//the curve in the middle of the body
stroke (255,0,0);
fill (255);
curve (170,170,170,260,350,260,350,170);

//create ribbon 
fill (255,0,0);
triangle (250,270,240,320,260,320);
triangle (250,270,220,290,220,270);
triangle (250,270,280,290,280,270);

//create a sun
stroke (255,0,0);
ellipse (400,60,80,80);
line (300,30,340,40);
line (310,100,340,70);
line (350,140,370,100);
line (420,110,450,150);
line (450,70,490,90);
line (450,30,480,0);
line (380,0,390,10);

// making a crown
stroke (255);
fill (247,247,0);
beginShape ();
vertex (220,125);
vertex (200,85);
vertex (230,105);
vertex (250,65);
vertex (270,105);
vertex (290,85);
vertex (280,125);
endShape ();
fill (255,0,0);
ellipse (200,85,10,10);
ellipse (290,85,10,10);
ellipse (250,65,10,10);
stroke (0);
fill (85,211,158);
ellipse (250,100,10,20);

//ballon
fill (25,125,252);
ellipse (60,90,60,100);
triangle (50,160,60,140,70,160);
line (60,160,60,260);













