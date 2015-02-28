
size(800,600);
background(255,255,204);
fill(210,142,155);
quad(300,450,800,450,800,80,300,80);

//Box lines//
line(520,300,-130,800);
strokeWeight(2);
line(420,300,-220,800);

//intersecting lines//
strokeWeight(1);
line(110,290,-190,0);
strokeWeight(2);
line(110,290,-210,150);


//orange line, black line//
strokeWeight(2);
line(100,400,-100,490);
strokeWeight(5);
stroke(210,146,81,220);
line(110,393,-103,487);

//box with lines//
stroke(0);
strokeWeight(2);
fill(255,0,0);
quad(580,320,720,255,650,120,510,180);
fill(200);
quad(720,255,840,200,770,70,650,120);
fill(0,0);
quad(840,200,960,70,890,20,770,70);
fill(200);
quad(650,460,790,395,720,255,580,320);
fill(0,0);
quad(790,395,1000,300,840,200,720,255);
fill(255);
quad(725,600,860,540,790,395,650,460);

//circle//
fill(210,146,81,150);
strokeWeight(3);
ellipse(840,120,300,300);

//smaller circle//
fill(174,203,157,150);
strokeWeight(3);
ellipse(860,120,250,250);





