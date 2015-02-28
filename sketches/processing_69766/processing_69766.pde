
//Eugene Liang, Penguin, CP1 mods 16-17
//http://opagungnamstyle.webs.com/Computer Programing/PotatoHead.html

size(500,500);
background(255,255,255);

//yellow head
strokeWeight(6);
fill(255,234,72);
ellipse(250,250,210,170);

//eyes
strokeWeight(1);
fill(0,0,0);
ellipse(185,230,27,27);
ellipse(315,230,27,27);

//eye balls
fill(255,255,255);
ellipse(187,226,16,16);
ellipse(312,226,16,16);

//cheeks
strokeWeight(3);
fill(255,183,240);
ellipse(165,270,35,35);
ellipse(335,270,35,35);

//nose
fill(0,0,0);
ellipse(250,240,4,2);

//mouth
strokeWeight(4);
line(214,251,286,251);
strokeWeight(3);
fill(149,60,42);
bezier(215,253,238,340,267,340,285,253);
fill(188,78,78);
curve(200,400,223,277,278,277,300,400);
strokeWeight(0);
triangle(278,277,275,290,253,275);
triangle(253,275,223,277,227,287);
fill(250,136,116);
curve(200,400,227,287,275,290,300,400);
bezier(227,287,245,325,260,325,274,288);
