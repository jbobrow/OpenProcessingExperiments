
background(224, 210, 187);
size(640, 480);
stroke(20);
smooth();
//////////////////////////////////////////////////////////

//glow
strokeWeight(5);
stroke(221,206,148);
line(10,365, 639,35); 

//pink squre
noStroke();
fill(192,130,150);
rect(0,345, 91,100);

//Floating square
strokeWeight(6.5);
strokeJoin(ROUND);
noStroke();
fill(225,208,162);
rect(237,78, 65,60);//yellow glow
fill(228,230, 227);
rect(244,84, 50,46);//white aura
stroke(20);
fill(219,198,150);
rect(255,93, 30,28);//actual floating square

//White Fills
noStroke();
fill(233);
quad(175,292, 200,320, 639,90, 639,45);
quad(30,412, 48,442, 639,131, 639,90);
quad(50,443, 65,473, 370,311, 355,270);
quad(95,460, 355,325, 368,355, 117,485);
triangle(135,479, 171,460, 180,479);
quad(207,479, 357,377, 355,420, 260,479);

//Black Quads
fill(20);
strokeWeight(3);
strokeJoin(ROUND);
quad(454,226.5, 492.5,210, 510,244.5, 473.5,263); //top
quad(355,323, 400,298, 418,328, 370,355); //Left
quad(455,320, 482.5,305, 498,334, 472,348); 
quad(473.5,364, 506,347, 524,380, 492,399);
quad(540,465, 528,450, 488,480, 519,480); //bottom right
quad(64,475, 93,460, 108,480, 66,480); //under pink square
quad(78,430, 112,412, 128,439, 95,460); //used int a3, b3
fill(39,33,38);
strokeWeight(2);
quad(352,499, 320,445, 370,412, 403,465); //bottom with textury





//Circles
//////////////
//Left circle
stroke(20);
strokeWeight(5);
fill(220,162,64);
ellipse(121,331, 150,150); //Lyellow circ
strokeWeight(1);
stroke(35);
fill(194,105,64);
ellipse(151,331, 133,133); //Rorange circ
fill(168,182,165);
arc(151,331, 133,133, radians(90),radians(270)); // Lgreen in the middle
strokeWeight(5);
arc(121,331, 150, 150, radians(295),radians(65+360)); //Rgreen
//////////////
//blue circle
stroke(30);
strokeWeight(3);
fill(209,183,95);
arc(397,278, 105,105, radians(15),radians(340));
noStroke();
ellipse(397,278, 105,105); //yellow circ 
stroke(30);
strokeWeight(.7);
fill(67,131,190);
ellipse(397,278, 85,85); //blue circ
//////////////
//purple circle
fill(211,41,61);
stroke(20);
strokeWeight(.9);
ellipse(404,414.5, 103,103); //Red circ
fill(151,138,156);
stroke(30);
strokeWeight(.5);
ellipse(402,412, 95,95); //purple circ
//////////////
//white Circle
stroke(20);
strokeWeight(4.7);
fill(233);
ellipse(561,323, 82,82);







//colored shapes
stroke(20);
strokeWeight(3);
fill(96,94,107);
quad(497,121, 540,97, 560,130, 515,155); //75% grey
noStroke();
fill(189,116,69);
quad(172,458, 520,277, 203,481, 183,483); //fake-triangle
stroke(30);
strokeWeight(2);
fill(129,69,51);
arc(397,278, 105,105, radians(67),radians(132)); //on bluellow circle, yellow border color var
fill(80,81,118);
arc(397,278, 85,85, radians(70),radians(125));
// on the purplered
fill(211,41,61);
stroke(20);
strokeWeight(.9);
//ellipse(404,414.5, 103,103); //Red circ color var
fill(125,90,92);
noStroke();
arc(402,412, 95,95, radians(91),radians(166)); //purple circ color var
triangle(371,415, 354,422, 381,430);
fill(151,138,156);
triangle(370,415, 420,390, 400,460);


//crazy area on the left
int a,b, a2,b2, a3,b3, c,d, c2,d2, e,f, e2,f2, e3,f3;
a = 41; //ab
b = 366;
a2 = 58;
b2 = 398;
a3 = 79;
b3 = 429;
c = 52;  //cd
d = 361;
c2 = 92;
d2 = 380;
e = 118; //ef
f = 367;
e2 = 157;
f2 = 346;
e3 = 137;
f3 = 315;
fill(206,47,52);
quad(12,382, a,b, a2,b2, 26,413);
fill(203,76,98);
triangle(47,446, a3,b3, 85,446);
fill(162,99,67);
quad(c,d, 72,389, a2,b2, a,b);
fill(212,72,103);
quad(a2,b2, a3,b3, 91,422, c2,d2);
fill(203,44,58);
quad(a3,b3, 91,422, 91,445, 84,445); 
fill(204,88,114);
triangle(48,345, 78,345, c,d);
fill(42,35,38);
quad(c,d, 74,349, c2,d2, 74,389);
fill(188,67,53);
triangle(75,390, c2,d2, 91,401);
fill(192,54,62);
triangle(75,390, 91,401, c2,d2); //Pink Square's upper corner
fill(197,51,65);
triangle(75,345, 91,345, c2,d2);
fill(170,168,122);
quad(102,334, e3,f3, e2,f2, e,f);
fill(141,140,92);
quad(e,f, e2,f2, 178,376, 137,397);
fill(68,85,85);
quad(e3,f3, 175,295, 198,322, e2,f2);

//textures
////////////////////////////////////////////////////////////////////////////////////////////textury1
stroke(20);
fill(139,126,119);
strokeWeight(4);
quad(353,198, 374.5,229, 329,253, 309,221); 
stroke(90);
strokeWeight(2.5);
line(321,213, 334,218);
line(340,223, 346,224);
line(333,228, 338,234);
line(320,219, 322,221);
line(323,225, 322,224);
line(348,218, 350,214);
quad(337,211, 344,207, 346,210, 343,214);
line(351,236, 352,234);
line(356,232, 357,229);
line(352,229, 351,228);
stroke(60);
strokeWeight (3);
int c1a = 5;
line(321 + c1a, 213 + c1a, 334,218);
line(340,223, 346,224);
line(333 + c1a,228, 338,234);
line(320,219, 322,221);
line(323,225, 322 + c1a,224);
line(348,218, 350,214);
quad(337,211 + c1a, 344,207, 346,210, 343,214);
line(351,236, 352,234 + c1a);
line(356,232 + c1a, 357,229);
line(352,229 + c1a, 351,228);
////////////////////////////////////////////////////////////////////////////////////////////textury2
stroke(20);
noFill();
strokeWeight(2.5);
int tex2A = 190;
int tex2B = 374;
int change2A = 8;
int change2B = 3;
arc(tex2A,tex2B, 3,3, radians(200), radians(300));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(320));
tex2A = tex2A + 8;
tex2B = tex2B - 4;
arc(tex2A,tex2B, 3,3, radians(200), radians(300));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(340));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(300));
tex2A = tex2A + 8;
tex2B = tex2B - 4;
arc(tex2A,tex2B, 3,3, radians(200), radians(300));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(300));
tex2A = tex2A + 8;
tex2B = tex2B - 4;
arc(tex2A,tex2B, 3,3, radians(200), radians(300));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(360));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(300));
tex2A = tex2A + 8;
tex2B = tex2B - 4;
arc(tex2A,tex2B, 3,3, radians(280), radians(310));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
tex2A = tex2A + 8;
tex2B = tex2B - 4;
arc(tex2A,tex2B, 3,3, radians(200), radians(270));
tex2A = 182;
tex2B = 378;
arc(tex2A,tex2B, 3,3, radians(300), radians(330));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300)); //on the left
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(360));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(180), radians(300));
tex2A = 182;
tex2B = 378;
arc(tex2A,tex2B, 3,3, radians(270), radians(300));
arc(tex2A + change2A, tex2B + change2B, 3,3, radians(270), radians(300));
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(300));
tex2A = tex2A - 8;
tex2B = tex2B + 4;
arc(tex2A + 2*change2A, tex2B + 2*change2B, 3,3, radians(270), radians(300));
arc(tex2A + 3*change2A, tex2B + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2A + 4*change2A, tex2B + 4*change2B, 3,3, radians(200), radians(250));
stroke(100);
fill(200);
strokeWeight(2.5);
///////////////////////////////////////////////////////////////////////////////////////////////
int tex2C = 188;
int tex2D = 370;
arc(tex2C,tex2D, 3,3, radians(200), radians(300));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(320));
tex2C = tex2C + 8;
tex2D = tex2D - 4;
arc(tex2C,tex2B, 3,3, radians(200), radians(300));
arc(tex2C + change2A, tex2B + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(340));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(300));
tex2C = tex2C + 8;
tex2D = tex2D - 4;
arc(tex2C,tex2D, 3,3, radians(200), radians(300));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(300));
tex2C = tex2C + 8;
tex2D = tex2D - 4;
arc(tex2C,tex2B, 3,3, radians(200), radians(300));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(360));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(300));
tex2C = tex2C + 8;
tex2D = tex2D - 4;
arc(tex2C,tex2D, 3,3, radians(280), radians(310));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
tex2C = tex2C + 8;
tex2D = tex2D - 4;
arc(tex2C,tex2D, 3,3, radians(200), radians(270));
tex2C = 182;
tex2D = 378;
arc(tex2C,tex2B, 3,3, radians(300), radians(330));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(200), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300)); //on the left
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(360));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(180), radians(300));
tex2C = 182;
tex2D = 378;
arc(tex2C,tex2B, 3,3, radians(270), radians(300));
arc(tex2C + change2A, tex2D + change2B, 3,3, radians(270), radians(300));
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(300));
tex2C = tex2C - 8;
tex2D = tex2D + 4;
arc(tex2C + 2*change2A, tex2D + 2*change2B, 3,3, radians(270), radians(300));
arc(tex2C + 3*change2A, tex2D + 3*change2B, 3,3, radians(200), radians(300));
arc(tex2C + 4*change2A, tex2D + 4*change2B, 3,3, radians(200), radians(250));
///////////////////////////////////////////////////////////////////////////////////////////////
stroke(30);
noFill();
strokeWeight(2);
int tex2E = 190;
int tex2F = 374;
int change2E = 10;
int change2F = 5;
arc(tex2E,tex2F, 3,2, radians(280), radians(300));
arc(tex2E + change2E, tex2F + change2F, 1,3, radians(280), radians(300));
///////////////////////////////////////////////////////////////////////////////////////////textury3
stroke(30);
noFill();
strokeWeight(2);
line(10+24,10+402, 12+24,15+402); //the H
line(14+24,7+402, 16+24,12+402);
line(11+24,13+402, 13+24,10+402);
int H2 = 33;
int h2 = 400;
line(10+H2,10+h2, 12+H2,15+h2); //the H
line(14+H2,7+h2, 16+H2,12+h2);
line(11+H2,13+h2, 13+H2,10+h2);
int R1 = 30;
int r1 = 409;
line(8+R1,10+r1, 14+R1,20+r1);//the R
arc(13+R1,12+r1, 6,6, radians(220), radians(360+100));
line(15+R1,14+r1, 22+R1,20+r1);
int R2 = 42;
int r2 = 409;
line(8+R2,10+r2, 14+R2,20+r2);//the R
arc(13+R2,12+r2, 6,6, radians(220), radians(360+100));
line(15+R2,14+r2, 22+R2,20+r2);
int R3 = 41;
int r3 = 394;
line(8+R3,10+r3, 14+R3,20+r3);//the R
arc(13+R3,12+r3, 6,6, radians(220), radians(360+100));
line(15+R3,14+r3, 22+R3,20+r3);
int R4 = 52 ;
int r4 = 407;
line(8+R4,10+r4, 14+R4,20+r4);//the R
arc(13+R4,12+r4, 6,6, radians(220), radians(360+100));
line(15+R4,14+r4, 22+R4,20+r4);
int H3 = 38;
int h3 = 424;
line(10+H3,10+h3, 12+H3,15+h3); //the H
line(14+H3,7+h3, 16+H3,12+h3);
line(11+H3,13+h3, 13+H3,10+h3);
int H4 = 46;
int h4 = 422;
line(10+H4,10+h4, 12+H4,15+h4); //the H
line(14+H4,7+h4, 16+H4,12+h4);
line(11+H4,13+h4, 13+H4,10+h4);
///////////////////////////////////////////////////////////////////////////////////////////textury 4
stroke(200);
line(380,470, 380.2,474);
line(340,450, 340.2,460);
line(348,450, 345.2,457);
line(334,445, 334.2,445);
line(346,463, 347.2,463);
line(360,470, 361.2,472);
line(366,468, 360.2,460);
///////////////////////////////////////////////////////////////////////////////////////////dark green strips
noFill();
stroke(31,41,41);
strokeWeight(3);
line(172,292, 171,315);
line(178,301, 176,315);
line(182,305, 181,321);
line(187,307, 186,323);





//Lines-out
smooth();
stroke(20);
//////////////
//horizontal"
strokeWeight(5);
line(10,380, 639,45); 
line(29,411, 639,90);
line(50,442, 639,130);
strokeWeight(3.5);
line(66,472, 400,298);
line(132,480, 570,248);
strokeWeight(4);
line(204,480, 570,248);
line(264,480, 370,412);
//////////////
//verticals"
strokeWeight(5);
line(10,380, 66.5,480); //1
line(39,365, 106,479); //2
strokeWeight(4);
line(73,347, 152,479); //3
strokeWeight(3);
line(101,333, 181,479); //4
strokeWeight(4.3);
line(135,314, 198,402); //5
line(172,294, 255,373); //6
line(400,298, 419,327); //7



//special outlines
noFill();
stroke(20);
strokeWeight(5);
ellipse(121,331, 150,150); //L circle cover up
strokeWeight(1);
stroke(35);
ellipse(151,331, 133,133); //Rorange circ
strokeWeight(2);
quad(352,499, 320,445, 370,412, 403,465); 
fill(67,131,185);
noStroke();
quad(373,310, 402,296,402,267, 367,307);
quad(402,296, 390,287, 415,276, 415,315);
noFill();


