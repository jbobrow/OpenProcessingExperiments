

size(1000,500);
background(215, 205, 180);
smooth();

//large shadow at right
noStroke();
fill(0, 0, 0, 150);
ellipse(640, 340, 700, 240);

//blue rect under blue ellipse
int rectblueX = 340;
int rectblueY = 215;
int rectblueW = 120;
int rectblueH = 182;

stroke(255);
fill(30, 35, 50);
rect(rectblueX, rectblueY, rectblueW, rectblueH);

//blue ellipse
int ellblueX = 400;
int ellblueY = 215;
int ellblueW = 120;
int ellblueH = 50;

noStroke();
fill(65, 75, 100);
ellipse(ellblueX, ellblueY, ellblueW, ellblueH);

//quad shadow
fill(75, 70, 70);
quad(375, 390, 410, 390, 410, 440, 375, 465);

//Big white rectangle
stroke(64, 25, 45);
fill(255);
rect(200, 240, 175, 225);

//little brown rectangle
noStroke();
fill(90, 60, 0);
rect(200, 320, 175, 75);

//little greyish rect on top of white
fill(85, 75, 50);
rect(200, 210, 175, 30);

//large black rect
stroke(0);
fill(0);
rect(465, 205, 170, 260);

//bottom ellipse for large container in back right
noStroke();
fill(150, 140, 125);
ellipse(550, 205, 170, 70);

//vertical rect for back right container
fill(215);
rect(530, 100, 40, 110);

//ellipse on bottom of above rect
ellipse(550, 200, 110, 50);

//ellipse of top of back right container
stroke(160, 145, 120);
ellipse(550, 90, 80, 40);

//darker ellipse above previous ellipse
fill(150, 140, 125);
ellipse(550, 85, 65, 30);

//large yellow rect in the middle
stroke(0);
fill(250, 230, 120);
rect(410, 255, 110, 210);

//small throwup color box on top of yellow
stroke(0);
fill(200, 180, 75);
rect(410, 220, 110, 35);

//far right brown box - under
stroke(220);
fill(90, 60, 0);
rect(530, 260, 115, 205);

//far right light brown box - above
noStroke();
fill(175, 150, 100);
rect(540, 270, 95, 185);

//top quad of far right box
stroke(0);
fill(210, 190, 150);
quad(525, 230, 640, 230, 645, 260, 530, 260);


