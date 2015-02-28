
//Imperial Probe Droid, Bill. From the movie, "The Empire Strikes Back". ENJOY!

size(480, 720);
smooth();
background(0);





//top to bottom

//cap

fill(102,88,119,170);
ellipse(250,90,77,11);

//antennae starboard
rect(197,39,6,28);
rect(198,65,3,25);
rect(198,78,6,4);
rect(195,84,13,8);

//antennae starboard
rect(185,49,6,28);
rect(185,65,3,25);
rect(188,78,6,4);
rect(185,84,13,8);

//crown
fill(108,88,119,170);
quad(327,105,305,90,170,90,150,105);

//head
fill(102,88,119,170);
ellipse(240,155,320,120);

//neck
fill(102,88,119,170);
rect(170,210,135,20);

//upper torso
fill(102,88,119,170);
quad(155,226,53,262,428,262,320,226);
//ellipse(240,246,380,40);

//mostleft gun
rect(85,130,10,50);
arc(87,155,42,42,1.61,4.7);

//torso connector
fill(102,88,119,170);
rect(64,260,348,15);

//lower torso
fill(108,88,119,170);
quad(52,275,82,340,395,340,427,275);

//gun
rect(395,234,9,20);
rect(393,224,44,8);
rect(383,225,29,17);
ellipse(397,229,6,6);

//top butt
fill(102,88,119,170);
rect(161,340,200,15);

//bottom butt
fill(108,88,119,170);
rect(175,352,180,30);

//flank
fill(102,88,119,170);
quad(196,380, 213,404, 282,404, 296,380);

//middle arm crap, damn bill i am tired it's after midnight!
fill(108,88,119,170);

quad(315,669,306,650,374,661,374,667);
quad(315,669,306,650,374,661,374,667);
quad(309,684,307,694,373,685,373,675);

//center leg mid

quad(194,644,190,653,318,676,321,665);
quad(231,399,260,398,300,518,285,528);
quad(221,399,250,398,288,518,277,528);

//center lower middle arm

quad(287,515,294,521,198,649,189,645);
ellipse(198,648,40,40);
ellipse(198,648,20,20);

//middle leg ellipse

fill(102,88,119,170);
ellipse(290,522,40,40);
ellipse(290,522,20,20);

//middle leg big center circles

ellipse(240,400,60,60);
ellipse(240,400,40,40);
ellipse(240,400,20,20);

//center lower arm and circle below
ellipse(322,672,30,30);
ellipse(322,672,20,20);
ellipse(322,672,10,10);

//upper starboard arm
quad(359,400,430,433,426,438,347,403);

//lower starboard arm
quad(422,436,431,438,414,527,410,526);

//starboard claw
quad(410,523,413,533,312,543,363,533);

//lower starboard arm ellipse
ellipse(413,529,18,18);
ellipse(413,529,9,9);

//middle starboard arm ellipse
ellipse(425,438,25,25);
ellipse(425,438,12,12);

//starboard leg box and ellipse
fill(108,88,119,170);
rect(311,360,50,35);
ellipse(352,394,30,30);
ellipse(352,394,15,15);

//port leg a upper joint
fill(102,88,119,170);

//upper arm for port b here
quad(139,414,119,406,139,339,157,347);

quad(88,452,130,348,152,339,94,458);
ellipse(120,380,30,30);
ellipse(120,380,15,15);

//port leg a
fill(108,88,119,170);
ellipse(140,340,40,40);
ellipse(140,340,20,20);

//port leg a middle joint
fill(102,88,119,170);
ellipse(82,462,30,30);
ellipse(82,462,15,15);

//port leg a bottom joint
fill(102,88,119,170);
ellipse(82,462,30,30);
ellipse(82,462,15,15);

//port leg b upper joint
// port a small claw
//rect(155,540,20,30);

quad(155,553,166,559,112,584,112,582);
//quad(160,540,199,546,200,558,160,558);
//quad(160,570,199,580,200,588,160,588);
//triangle(190,590, 200,570, 210,590);

//lower arm
fill(102,88,119,170);
quad(95,464,115,489,107,508,80,480);
quad(83,478,91,474,162,554,155,564);
quad(91,460,93,450,168,557,168,563);

//ellipse
fill(108,88,119,170);
ellipse(162,559,30,30);
ellipse(162,559,15,15);

//port b  upper ellipse
fill(102,88,119,170);

//middle arm
quad(207,446,211,441,234,570,230,576);
//lower arm
quad(134,399,131,403,211,449,221,444);

ellipse(134,400,30,30);
ellipse(134,400,15,15);

//port b claw

quad(221,563, 229,571, 244,545,240,540);
quad(244,545,240,540,   277,535,242,548);

quad(207,441, 212,441, 225,570, 220,570);
ellipse(210,444,30,30);
ellipse(210,444,15,15);

//port b  lower ellipse 
fill(108,88,119,170);
ellipse(222,570,30,30);
ellipse(222,570,15,15);


//drawing details here

//head ellipse port b
noFill();
strokeWeight(1);
stroke(121);
ellipse(160,181,52,42);
ellipse(160,181,42,32);

//head ellipse starboard b
//noStroke();
fill(108,88,119,170);
//ellipse(160,181,12,2);
ellipse(160,181,32,22);
//ellipse(160,181,37,27);
noFill();
ellipse(321,166,43,45);
//noFill();
fill(102,88,119,170);
ellipse(321,166,23,25);

//small ellipse starboard a
noStroke();
smooth();
ellipse(374,146,13,26);
noFill();
stroke(121);
ellipse(374,146,20,33);

//small port top ellipse
stroke(121);
fill(108,88,119,170);
ellipse(117,156,14,16);
noFill();
ellipse(117,156,19,21);

//small port bottom ellipse
stroke(121);
fill(102,88,119,170);
ellipse(112,183,10,10);

//various ellipses on head

ellipse(220,201,15,10);
ellipse(247,201,15,10);
ellipse(176,109,15,10);
ellipse(212,97,2,2);
ellipse(209,102,2,2);
ellipse(245,97,2,2);
ellipse(247,102,2,2);
ellipse(239,151,2,2);
ellipse(239,162,2,2);
//head rectangles
noFill();
rect(232,145,21,11);
rect(118,121,245,2);
rect(66,272,345,3);
line(194,187,299,187);
line(240,235,240,256);

//lower torso stuff

rect(208,288,55,40);
rect(225,288,30,40);
rect(241,296,22,8);
rect(241,308,22,8);
rect(200,360,11,15);
rect(179,360,15,6);
rect(179,370,15,6);
rect(287,370,15,6);
rect(99,251,289,2);
rect(342,364,9,7);

line(70,280,100,340);
line(400,280,372,340);


ellipse(235,310,3,3);
ellipse(235,300,3,3);

ellipse(92,267,3,3);
ellipse(139,267,3,3);
ellipse(152,267,3,3);
ellipse(215,267,3,3);
ellipse(263,267,3,3);
ellipse(301,267,3,3);
ellipse(342,267,3,3);
ellipse(376,267,3,3);
ellipse(400,267,3,3);
ellipse(333,369,9,9);


















