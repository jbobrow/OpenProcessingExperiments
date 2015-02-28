
//void setup()
size(800, 800);
smooth();
background(#FBAE17);

//bg
noStroke();
fill(#F7931E);
ellipse(680, 145, 676,627);
fill(#FCEE21);
ellipse(700, 145, 676,627);

//hair
fill(0);
ellipse(473, 442, 469, 610);
fill(0);
ellipse(408, 443, 469, 610);
fill(#FBAE17);
rect(5,500,934,551);

//face
fill(255);
ellipse(414, 395, 227,312);
ellipse(413, 372, 369,296);
ellipse(439, 344, 258,252);
ellipse(562, 290, 71,69);

//Eyebrow  left
fill(#42210B);
ellipse(320, 323, 89,72);
fill(255);
ellipse(325, 331, 89,72);

//Eyebrow  right
fill(#42210B);
ellipse(459, 308, 96,63);
fill(255);
ellipse(459, 317, 89,72);

//left eye
fill(#A67C52);
ellipse(322, 347, 49,46);
fill(#754C24);
ellipse(322, 341, 51,48);
fill(255);
ellipse(322, 344, 49,43);
fill(#42210B);
ellipse(327, 342, 28,28);
fill(255);
ellipse(319, 335, 3,3);
fill(255);
ellipse(317, 339, 2,2);
fill(0);
ellipse(328, 342,10,10);
fill(#666666);
ellipse(331, 341,3,3);

//right eye
float X = 140;
float Y = 20;
fill(#A67C52);
ellipse(322+X, 347-Y, 49,46);
fill(#754C24);
ellipse(322+X, 341-Y, 51,48);
fill(255);
ellipse(322+X, 344-Y, 49,43);
fill(#42210B);
ellipse(327+X, 342-Y, 28,28);
fill(255);
ellipse(319+X, 335-Y, 3,3);
fill(255);
ellipse(317+X, 339-Y, 2,2);
fill(0);
ellipse(328+X, 342-Y,10,10);
fill(#666666);
ellipse(331+X, 341-Y,3,3);

//mouth
fill(#C1272D);
arc(405, 395, 254, 200, PI/2, PI);
fill(#C1272D);
arc(405, 395, 254, 200, 0, PI/2);
fill(#750C10);
arc(408, 405, 247, 200, PI/2, PI);
arc(408, 405, 247, 200, 0, PI/2);
fill(255);
arc(406, 400, 247, 180, PI/2, PI);
arc(406, 400, 247, 180, 0, PI/2);



