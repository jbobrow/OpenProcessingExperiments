
/*
 Konkuk University
 SOS iDesign

Name: MoonYeLin
 ID: egiyoon

*/

PImage img;

void setup(){
size (600, 600);
background(245,222,161);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420077 MoonYeLin.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);



fill(600);
rect(417,139,80,80);
fill(521,130,22);
quad(499,141,498,220,575,222,578,141);
fill(mouseY,572,483,420);
quad(415,220,412,307,494,307,496,222);
fill(600);
quad(496,222,495,310,577,310,575,224);





fill(580,256,78);
quad(-1,53,284,603,-1,115,-1,53);
quad(-1,264,201,603,-1,323,-1,264);
quad(-1,362,133,603,-1,412,-1,362);
line(-1,521,57,603);

strokeWeight(15);
line(-1,440,495,598);
line(366,1,-1,267);

fill(0);
quad(218,0,248,57,329,3,218,0);

noStroke();
fill(mouseX,29,112,420);
bezier(-1,132,90,188,90,294,0,346);

noStroke();
noFill();
ellipse(304,402,55,55);

stroke(0);
strokeWeight(4);
point(419,22);
line(419,22,409,443);
line(504,23,494,448);
line(578,19,574,445);
line(278,135,600,139);
line(273,217,600,222);
line(271,304,600,310);




}

