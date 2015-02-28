
// Lucky Wen, Lucky's Doraemon, CP1 mods 16-17
// URL: http://luckycharms112.site40.net/index.html

size(500,750);
smooth();
strokeWeight(5);

// head 
fill(24,128,216);
arc(250,250,300+35,325,180,270);

// inner head
fill(255);
ellipse(250,250+10,300,245);

// EYE left
ellipse(220,135,60,75);

//  inner eyes left
fill(0);
ellipse(235,135,15,20);

// Eye right
fill(255);
ellipse(280,135,60,75);

// inner eyes right
fill(0);
ellipse(270,135,15,20);

// nose
fill(214,22,22);
ellipse(253,180,35,35);

// smile
noFill();
bezier(145,205+50,195,295+50,300,295+50,350,210+50);

// nose line
line(255,198,255,320);

// whisker 1
line(220,195+30,140,150+25);

// whisker 2
line(215,250,115,220);

// whisker 3
line(220,270,112,275);

// right whisker 1
line(280,225,365,180);

// right whisker 2
line(290,250,387,220);

// right whisker 3
line(280,250+20,387,250+20);

// body left

bezier(145-20,430+20,145,460,145,520,145-20,575+20);

//body right
bezier(360,415,360,450,360,520,323,595);

// background body
noStroke();
fill(24,128,216);
quad(150,400,363,400,320,600,140,600);

//background right abs
ellipse(326,509,20,140);
bezier(350,430,360,450,360,520,320,595);
ellipse(346,442,27,60);

// background left abs
bezier(145-2,430+20,180,480,180,540,145-5,575+20);
quad(125+45,400,140,585,140,590,128,595);
triangle(150,400,140,455,155,450);

// right hand color
quad(350,385,400,367,425,388,362,430);

//collar
stroke(5);
fill(193,14,14);
ellipse(253,395,210,32);

// stomach
fill(255);
ellipse(253,475,180,135);

// inner pocket
line(180,470,330,470);
noFill();
bezier(180,470,210,550,300,550,330,470);

//bell
fill(222,202,18);
ellipse(260,410,50,50);

//his LEFT ARM
fill(24,128,216);
bezier(150,400,100,460,100,490,140,510);

// awkward line on left side
line(140,510,138,460);

//tail
fill(193,14,14);
line(135,530,120,535);
ellipse(110,535,30,30);

// Right foot
fill(255);
ellipse(290-10,600,130,50);

// left foot
fill(255);
ellipse(170,600,130,50);

//left arm
line(350,385,400,367);
line(362,420+10,425,388);
ellipse(430,370,55,55);
