
size(400,400);
smooth();
noStroke();
rectMode(CORNER);

background(255);

//ALL RED
//Big red Square
fill(240,20,20);
rect(44,47,200,200);
//small bottom right corner
rect(370,305,40,140);


//ALL BLUE GREY
//Top left light blue/grey
fill(209,230,230);
rect(0,0,95,43);
//long skinny light blue/grey on right
rect(370, 0, 30, 305);
//left side middle
rect(0,160,44,140);
//middle biggest one
rect(147,247,97,108);

//ALL BLACK
//Big black square
fill(0);
rect(44,247,103,108);
//skinny one
rect(147,346,97,34);

//ALL YELLOW
//Top right yellow rectangle
fill(238,221,130);
rect(244,0,134,154);
//lower left corner
rect(0,300,44,100);

//BRIGHT BLUE
fill(0,0,200);
rect(247,302,126,80);

//BLACK LINES
//BIGGER ONES
//Top horizontal black line
stroke(0);
strokeWeight(17);
strokeCap(SQUARE);
line(0,0,width,0);
//Right Vertical black line
line(width, 0, width, height);
//SMALLER ONES
strokeWeight(8);
//counting 1..2...3..horizontal from top
line(7,47, 378,47); //1
line(7,156,44,156); //2
line(244,156,378,156);//2.2
line(44,250,378,250); //3
line(7,304,width,304); //4
line(142, 380, 377, 380);
//counting 1...2....3...left to right vertical
line(40, 47, 40, 390); //1
line(99, 17, 99, 50); //2
line(143, 300, 143, 395); //3
line(247, 17, 247, 379); //4
line(310,156,310,250); //5
line(374,17,374,394); //6






