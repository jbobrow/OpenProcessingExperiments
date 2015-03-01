

//Mides de llenç
size(1200,600);
background(255,255,255);

//TÍTOL
/*PFont mono;
mono = loadFont("AmaticSC-Regular-125.vlw");
stroke(0);
fill(0);
textFont(mono);*/
fill(0);
textSize(75);
text("MINIONS", 800, 450);

//COS PRIMER MINION
noStroke();
fill(229,218,95);
rect(300,300,250,600,150);

//COS SEGON MINION
noStroke();
fill(229,218,95);
rect(500,-200,250,400,150);


//ULL PRIMER MINION
noStroke();
fill(255,255,255);
ellipse(425,400,150,100);
//stroke(0,0,0);
fill(121,80,15);
ellipse(425,400,50,50); //iris
fill(0,0,0);
ellipse(425,400,25,25); //pupil·la
fill(255);
ellipse(415,385,7,7);//brillo

//ULL ESQUERRA SEGON MINION
noStroke();
fill(255,255,255);
ellipse(575,100,100,67);
//stroke(0,0,0);
fill(121,80,15);
ellipse(588,88,30,30); //iris
fill(0);
ellipse(588,88,15,15); //pupil·la
fill(255);
ellipse(594,93,5,5); //brillo

//ULL DRET SEGON MINION
noStroke();
fill(255,255,255);
ellipse(675,100,100,67);
//stroke(0,0,0);
fill(121,80,15);
ellipse(663,88,30,30); //iris
fill(0);
ellipse(663,88,15,15);//pupil·la
fill(255);
ellipse(670,93,5,5); //brillo


//MONOCLE
strokeWeight(15);
stroke(125);
noFill();
ellipse(425,405,140,140);
strokeWeight(1);
fill(100);
triangle(425,318,415,328,435,328);
triangle(415,481,435,481,425,491);

//cintesMONOCLE
fill(0);
rect(347,390,5,15,5);
rect(347,405,5,15,5);
rect(499,390,5,15,5);
rect(499,405,5,15,5);
quad(347,390,347,405,301,405,302,395);
quad(347,405,347,420,300,415,301,405);
quad(504,390,504,405,550,405,549,395);
quad(504,405,504,420,550,415,550,405);


//BINOCLE
strokeWeight(15);
stroke(125);
noFill();
ellipse(576,100,100,100); //ullera esquerra
ellipse(675,100,100,100); //ullera dreta
strokeWeight(1);

//cintesBINOCLE
fill(0);
rect(517,85,5,15,5);
rect(517,100,5,15,5);
rect(730,85,5,15,5);
rect(730,100,5,15,5);
quad(517,85,517,100,500,100,500,90);
quad(517,100,517,115,500,110,500,100);
quad(735,85,750,90,750,100,735,100);
quad(735,100,750,100,750,110,735,115);



//SOMRIURE MINION
noFill();
stroke(0);
strokeWeight(3);
//arc(425, 550, 75, 30, PI,TWO_PI);
bezier(390,550,415,540,435,540,460,550);


//CABELLS MINION1
noFill();
strokeWeight(1);
stroke(0);
bezier(425, 300,  425, 290,  425, 250,  400, 220);
bezier(425, 300,  425, 290,  425, 250,  415, 230);
bezier(425, 300,  425, 290,  425, 270,  405, 250);
bezier(425, 300,  425, 290,  425, 270,  430, 250);
bezier(425, 300,  425, 290,  425, 270,  445, 230);
bezier(425, 300,  428, 290,  432, 270,  465, 250);
bezier(425, 300,  428, 290,  429, 270,  445, 260);
bezier(425, 300,  423, 290,  421, 270,  400, 260);

//CABELLS MINION2
noFill();
strokeWeight(1);
stroke(0);
bezier(535,172,525,174,515,173,510,172);
bezier(545,174,540,178,535,185,520,195);
bezier(555,175,545,200,530,205,525,215);
bezier(575,191,573,207,571,215,545,250);
bezier(600,195,597,200,594,205,580,240);
bezier(625,199,624,207,623,215,605,230);
bezier(635,195,636,201,637,212,655,235);
bezier(645,194,646,195,647,203,667,218);
bezier(667,192,668,195,669,198,677,213);
bezier(680,190,683,201,686,204,692,215);
bezier(700,182,703,195,706,198,720,225);



