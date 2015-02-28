
size(300,300);
background(255,248,230);

//LINES
//Bottom RT
line(270,300,300,280);
//top left
line(15,70,15,110);
//right middle
line(280,160,280,190);
//mid,center
line(180,130,180,160);
//bottom left short
line(0,290,20,250);

//stars
//top left
line(45,110,80,110);
line(60,95,60,130);
line(44,130,75,95);
line(44,95,80,128);
//mid right
line(230,140,255,140);
line(242,123,242,157);
line(230,123,255,157);
line(254,120,230,153);
//mid right lower
line(210,200,245,200);
line(228,183,228,220);
line(210,183,245,220);
line(245,183,210,220);
//furthest right
line(262,245,300,245);
line(281,230,281,260);
line(262,260,300,234);
line(262,234,300,257);
//BEZIER
//top left
fill(255,248,239);
bezier(75,57,3,73,40,17,47,0);
//top rt
bezier(301,136,293,185,249,6,301,9);
//bottom left
bezier(61,212,59,250,22,292,-2,268);


//CIRCLES
//Top Left
fill(0);
ellipse(15,70,18,18);
ellipse(15,110,19,17);
//mid, far right
ellipse(280,160,16,16);
ellipse(280,190,16,16);
//mid,center
ellipse(180,160,17,16);
ellipse(180,130,16,16);
//bottom left
ellipse(20,235,15,15);

