
void setup(){
  size(800,800);
background(255);
}

void draw(){
//SEA
noStroke();
fill(232,244,252);
rect(0,0,800,50);
fill(201,234,255);
rect(0,50,800,50);
fill(150,212,252);
rect(0,100,800,50);
fill(100,194,255);
rect(0,150,800,50);
fill(83,180,242);
rect(0,200,800,50);
fill(39,170,255);
rect(0,250,800,50);
fill(7,145,234);
rect(0,300,800,50);
fill(28,117,255);
rect(0,350,800,50);
fill(0,95,245);
rect(0,400,800,50);
fill(0,75,193);
rect(0,450,800,50);
fill(0,66,170);
rect(0,500,800,50);
fill(0,69,142);
rect(0,550,800,50);
fill(0,58,118);
rect(0,600,800,50);
fill(0,40,118);
rect(0,650,800,50);
fill(0,28,82);
rect(0,700,800,50);
fill(0,14,82);
rect(0,750,800,50);

//RED FISH
noStroke();
fill(255);
ellipse(map(mouseY,0,800,370,-50), 470, 7,7);
fill(251,255, map(mouseY,0,800,1,137));
ellipse(map(mouseY,0,800,375,-80), 475, 70,40);
stroke(0);
//line(710, 475, 730, 475);
//line(710, 475, 729, 474);
//line(710, 475, 728, 473);
//line(710, 475, 727, 472);
//line(710, 475, 726, 471);
//line(710, 475, 725, 470);
//line(710, 475, 724, 469);
//line(710, 475, 723, 468);
//line(710, 475, 722, 467);
//line(710, 475, 721, 466);
//line(710, 475, 720, 465);
//line(710, 475, 730, 476);
//line(710, 475, 729, 477);
//line(710, 475, 728, 478);
//line(710, 475, 727, 479);
//line(710, 475, 726, 480);
//line(710, 475, 725, 481);
//line(710, 475, 724, 482);
//line(710, 475, 723, 483);
//line(710, 475, 722, 484);
//line(710, 475, 721, 485);
noStroke();
fill(0);
ellipse(map(mouseY,0,800,355,-100), 470, 7,7);
fill(251,255, map(mouseY,0,800,1,137));
ellipse(map(mouseY,0,800,410,-45),475,5,40);


//HEAD
fill(255,214,188);
smooth();
strokeWeight(2);
ellipse(400,300,410,450);



//ARMs
stroke(255,214,188);
noFill();
strokeWeight(55);       //HORIZONTAL//VETRICAL
curve(400,400, 50, 50,  330,        600,     1000,550);
curve(300,300, 750, 50,  460,       600,    100,100);

//HAIR

stroke(44,28,18);
fill(44,28,18);
strokeWeight(15);
curve(450, 950, 450, 80, 170, 200, 700, 250);
curve(300, 300, 450, 80, 170, 200, 170, 355);
curve(0, 670, 450, 80, 650, 260, 600, 300); 

//BUBBLES
strokeWeight(0);
fill(160,240,255);
ellipse(180,map(mouseY,0,800,150,50),map(mouseY,0,800, 70,100), map(mouseY,0,800,70,100));
ellipse(map(mouseY,0,800,170,180),map(mouseY,0,800,230,150),map(mouseY,0,800,50,70), map(mouseY,0,800,50,70));
ellipse(180,map(mouseY,0,800, 310, 230),map(mouseY,0,800,40,60), map(mouseY,0,800,40,60));
ellipse(map(mouseY,0,800,210,180),map(mouseY,0,800,370,310), map(mouseY,0,800,30,50), map(mouseY,0,800, 30,50));
ellipse(map(mouseY,0,800,260,210),map(mouseY,0,800,420,370), map(mouseY,0,800,20,40), map(mouseY,0,800,20,40));
ellipse(map(mouseY,0,800,300,260), map(mouseY,0,800,420,420), map(mouseY,0,800,10,30),map(mouseY,0,800,10,30));
//310
//370
//420

//MOUTH  
mouseDragged();
strokeWeight(1);
stroke(247,195,195);
fill(255);
strokeWeight(4);
ellipse(400,430, 150,map(mouseY,0,800,0,60));



//EYES
smooth();
stroke(0);
strokeWeight(3);
ellipse(330,250,90,60);
ellipse(470,250,90,60);
strokeWeight(5);
noFill();
rectMode(CENTER);
rect(322,253,110,65);
rect(479,253,110,65);
line(422,250,380,250);
noStroke();
fill(88,58,40);
ellipse(340,250,30,30);
ellipse(460,250,30,30);

fill(0);
ellipse(341,250,13,13);
ellipse(460,250,13,13);
fill(255);
ellipse(343,245,7,7);
ellipse(463,245,7,7);

//EYEBROWS
noStroke();
stroke(0);
noFill();
bezier(420, 150, 440, 145, 490, 105, 520, 180);
bezier(280, 180, 300, 140, 350, 100, 390, 150);

//NOSE
fill(255,214,188);
bezier(410, 280, 500, 450, 380, 430, 380,350);

//NECK
noStroke();
rect(390,540,70,160);

//BODY
ellipseMode(CENTER);
ellipse(390,750,200,400);

//NIPPLES
strokeWeight(13);
stroke(198,60,60);
line(430, 650, 430, 650);
line(350, 650,350, 650);

//ARMPIT HAIR
strokeWeight(2);
stroke(0);
line(310, 625, 280, 630);
line(310, 625, 285, 640);
line(310, 625, 290, 650);
line(310, 625, 285, 620);

line(500, 625, 470, 630);
line(500, 635, 470, 630);
line(500, 645, 470, 630);
line(500, 655, 470, 630);

//YELLOW FISH
stroke(map(mouseY,0,800,100,150),map(mouseY,0,800,1,147), map(mouseY,0,800,1,220));
fill(map(mouseY,0,800,100,150),map(mouseY,0,800,1, 147),map(mouseY,0,800,1,220));
ellipse(map(mouseY,0,800,120, 485), 600, 70, 20);
stroke(211,147,6);
//line(85, 575, 70, 565);
//line(85, 575, 65, 573);
//line(85, 575, 60, 575);
//line(85, 575, 65, 583);
//line(85, 575, 70, 591);
noStroke();
fill(255);
ellipse(map(mouseY,0,800,140,502), 597, 5,5);
fill(map(mouseY,0,800,100,150),map(mouseY,0,800,1, 147), map(mouseY,0,800,1,180));
ellipse(map(mouseY,0,800,70,435), 600,40,5);
ellipse(map(mouseY,0,800,120,490),589,6,13);

}

