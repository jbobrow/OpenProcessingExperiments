
size(640,480);
background(229,225,214);
smooth();

//BG COLORS
 

 
  noStroke();
  
  
 
 fill(212,212,195);
triangle(0,480,0,0,480,0);

//large blue circle
fill(134,175,204,40);
ellipse(300,-42,400,400);

fill(134,175,204,150);
ellipse(300,-42,230,230);


//gride circle 1
fill(224,214,163);
ellipse(300,155,148,148);

strokeWeight(5);
stroke(224,206,204);
fill(240,236,235);
ellipse(300,155,130,130);

noStroke();
fill(176,193,209);
ellipse(295,155,70,70);

stroke(1);
strokeWeight(1);
fill(240,236,235);
ellipse(294,155,45,45);

//grid ellipse 2
noStroke();
fill(224,214,163);
ellipse(158,145,100,115);

fill(213,191,204);
ellipse(158,145,90,103);

fill(232,228,227);
ellipse(158,150,80,100);

fill(72,105,74);
ellipse(158,158,70,90);

stroke(1);
strokeWeight(2);
fill(232,228,227);
ellipse(158,160,53,70);

//
 noStroke();
fill(215,214,191);
quad(640,182,556,110,474,424,640,424);

fill(199,211,220);
quad(478,44,556,110,520,246,260,294);

fill(232,228,227);
quad(-83,425,42,74,262,283,60,536);

quad(162,188,222,92,334,206,262,283);

quad(294,164,418,36,452,72,334,206);
  fill(238,233,222);
triangle(428,0,642,184,642,0);
fill(232,228,227);
quad(460,24,480,0,512,0,478,40);





//colors!

  fill(93,105,59);
quad(0,298,0,226,100,282,59,343);
  fill(117,167,190);
quad(100,282,132,232,188,269,151,308);
  fill(81,105,78);
quad(188,269,218,242,242,264,220,288);
  fill(218,165,161);
quad(188,326,220,288,250,306,218,345);
  fill(182,116,58);
triangle(22,398,-2,378,-2,432);
  fill(182,116,58);
quad(284,214,313,185,335,208,309,239);
  fill(191,185,97);
triangle(45,482,75,448,106,482);
  fill(143,113,65);
triangle(640,192,600,220,640,222);
  fill(205,210,213);
quad(0,432,22,398,44,420,-2,465);
  fill(229,225,214);
quad(44,420,94,370,124,393,74,446);
  
  
  fill(246);

  stroke(139,143,170);
  strokeWeight(5);
  strokeCap(SQUARE);
arc(457,425,180,180,PI,TWO_PI);
  stroke(243,194,63);
arc(647,425,180,180,PI,TWO_PI);
  noFill();
  stroke(227,199,195);
arc(555,522,180,180,PI,TWO_PI);

//VERTICAL Grid Lines

strokeCap(ROUND);
stroke(0);
strokeWeight(5);

line(-2,184,42,76);
line(42,76,268,288);

line(-2,432,222,94);
line(222,94,335,207);

line(-2,464,420,36);
line(420,36,453,69);

line(46,480,482,-2);
line(104,480,514,-2);

//horizonal grid lines
  strokeWeight(4);
line(10,158,250,306);
line(0,226,218,345);
line(0,298,156,419);
line(0,378,106,478);
line(350,108,386,148);
line(200,132,309,239);

//outside lines
  fill(0);
triangle(609,-2,617,-2,508,142);

  noFill();
  strokeWeight(7);
ellipse(135,-50,157,157);

  stroke(227,220,142);
  strokeWeight(5);
ellipse(137,-55,157,157);

  stroke(0);
  strokeWeight(3);
line(0,36,124,-2);
line(428,0,642,184);

  strokeWeight(15);
  strokeCap(SQUARE);
line(684,238,116,340);
  strokeWeight(3);
//RED LINE
  fill(211,0,0);
quad(88,438,96,427,642,264,642,272);

  strokeWeight(5);

line(586,0,460,481);

  strokeWeight(4);
    
line(576,-2,552,11);  
stroke(225,97,84);
line(572,-2,550,8);  
stroke(0);

line(642,426,113,422);
//ARCS!

  noFill();
arc(457,425,186,186,PI,TWO_PI);
  strokeWeight(2);
arc(647,425,186,186,PI,TWO_PI);
arc(555,522,186,186,PI,TWO_PI);


//BLACK QUADS
noStroke();
fill(0);
quad(10,158,42,76,162,188,132,232);
quad(59,343,92,370,44,418,22,398);
quad(162,188,182,158,242,216,218,242);
quad(200,132,222,94,293,164,264,194);
quad(242,218,264,194,286,216,264,239);
quad(242,264,264,239,289,262,267,288);

quad(388,70,420,36,434,52,404,86);
quad(366,126,404,86,423,106,386,148);
quad(434,52,460,23,479,39,454,70);
triangle(494,0,514,0,506,10);





