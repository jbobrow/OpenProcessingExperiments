
size(774,861,P3D);
PImage b;
b = loadImage("mal.jpg");
image(b,0,0);



smooth();
noStroke();
fill(50,50,120);
quad(320,766,323,768,620,273,617,271); //1. long blue line

fill(170,20,20);
quad(305,758,303,760,360,790,362,788);  //2.  o the top of long blue
noSmooth();
fill(25,36,120);
quad(275,777,274,810,294,814,302,780);  //  blue rect Down

fill(#313571,220);
quad(306,639,307,650,318,648,317,638);   //4. blue small rect

fill(255,150,30);
noStroke();
triangle(406,226,376,350,315,226); //orange triangle

noSmooth();
fill(0);
quad(375,334,368,308,453,277,463,303); //black rect small

smooth();
stroke(0);
strokeWeight(4);
line(350,336,612,380); //black long vertical

stroke(255,150,30);
strokeWeight(4);
line(460,420,640,344); //orange line

strokeWeight(4);
stroke(0);
line(444,190,453,380);  // Black vertical long stripe

strokeWeight(4);
stroke(180,68,0);
line(420,380,482,381);  //red small line horizontal


smooth();
strokeWeight(4); 
stroke(40);
line(83,195,83,264);  // 5.black cross vertical

strokeWeight(4);
stroke(40);
line(40,218,134,218);  // 6. black cross horizontal

strokeWeight(3);
stroke(180,68,0);
line(73,103,200,430);  //7. thin red stroke

strokeWeight(4);
stroke(215,58,0);
line(167,441,220,423);  //8. small thin red stroke, left

noSmooth();
noStroke();
fill(#B71C04);
quad(83,375,86,390,649,190,644,175); //red LONG rect
quad(420,164,419,226,164,227,163,186); 
fill(200,50,0);
quad(380,70,380,97,540,84,539,56); // red rect UP







fill(0);
rotateZ(radians(-5));
rect(310,50,90,90);
fill(10);

rect(205,130,290,70);



