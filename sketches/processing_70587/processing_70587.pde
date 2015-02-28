

size(800,800, P3D);

color skin = color(255,215,159);
color skinL = color(255,225,169);
color skinLL = color(255,230,175);
color skinShadowed = color(235,191,135);
color skinShadowedL = color(245,201,145);
color skinShadowedLL = color(250,206,150);
color skinShadowedD = color(225,181,125);
color skinShadowedDD = color(200,156,100);

color hairMedium = color(222,184,135);
color hairDark = color(192,154,105);

color greyShirt = color(100,100,100);
color greyShirtShadow = color(80,80,80);
color blackShirt = color(40,40,40);

color white = color(255,255,255);
color eyes = color(71,148,173);
color black = color(0,0,0);

color Grass = color(0,230,0);
color skyblue = color(130,200,255);
color cRed = color(200,0,0);
color yellow = color(255,255,60);
color yellowB = color(255,255,120);
color yellowBB = color(255,255,170);
color roof = color(92,64,51);
color bush = color(0,190,0);
color bushDark = color(0,150,0);
color wood = color(139,69,25);

color cCloud = color(220,220,220);

color teethBright = color(245,245,245);
color teethNorm = color(230,230,230);
color teethDark = color(200,200,200);

background(skyblue);

fill(Grass);
noStroke();
rect(0,600,800,200);

fill(cRed);
rect(680,480,120,140);
fill(roof);
triangle(660,480,770,450,880,480);
fill(bush);
ellipse(700,700,60,60);
ellipse(680,680,30,50);
ellipse(720,720,60,20);
ellipse(730,710,35,35);
fill(bushDark);
ellipse(710,700,30,20);
ellipse(685,690,20,20);
fill(wood);
quad(80,650,110,620,160,620,190,650);
rect(110,520,50,100);
fill(bush);
ellipse(135,500,140,140);
ellipse(145,480,140,120);
fill(bushDark);
ellipse(140,510,40,30);
ellipse(155,460,30,30);
ellipse(95,460,40,50);
fill(cCloud);
ellipse(620,80,200,90);
fill(yellow);
ellipse(15,15,120,120);
fill(yellowBB);
ellipse(60,10,10,10);
strokeWeight(2);
stroke(yellowB);
rotate(.05);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(.15);
line(100,0,150,0);
rotate(-1.55);

// body

fill(skin);
noStroke();
rect(300,500,200,200);

fill(skinShadowedL);
rect(420,540,80,200);

fill(skinShadowed);
ellipse(400,540,200,120);

fill(greyShirt);
rect(250,630,300,200);
ellipse(250,830,350,400);
ellipse(550,830,350,400);
fill(greyShirtShadow);
triangle(205,800,210,760,213,800);
triangle(595,800,590,760,587,800);

fill(blackShirt);
quad(210,640,248,631,552,631,590,640);
quad(210,640,400,730,590,640,400,640);

fill(skin);
triangle(220,640,400,600,580,640);
triangle(220,640,400,720,580,640);

fill(skinShadowedL);
noStroke();
triangle(420,604,580,641,420,710);

//randomhair
fill(hairMedium);
noStroke();
ellipse(237,290,65,110);
ellipse(563,290,65,110);


fill(skinShadowedD);
quad(480,400,500,400,500,565,480,577);
fill(skinShadowed);
quad(480,577,500,565,500,620,475,630);

// /body

fill(skin);
ellipse(400,350,360,470);

noFill();
stroke(skinShadowedLL);
strokeWeight(16);
arc(400, 350, 344, 454, -HALF_PI, HALF_PI-.7);
stroke(skinL);
arc(400, 350, 344, 454, HALF_PI+.7, HALF_PI+PI);

fill(skinShadowed);
noStroke();
ellipse(340,310,70,38);
ellipse(460,310,70,38);
fill(white);
ellipse(340,310,70,36);
ellipse(460,310,70,36);

// eyes
fill(eyes);
ellipse(340,310,30,30);
strokeWeight(15);
stroke(hairDark);
noFill();
arc(340,300,85,48,PI+.5,PI+HALF_PI+1.1);
arc(460,290,85,48,PI+.5,PI+HALF_PI+1.1);
noStroke();

fill(black);
ellipse(340,310,10,10);

fill(eyes);
ellipse(460,310,30,30);

fill(black);
ellipse(460,310,10,10);

// /pupils

// mouth

fill(black);
arc(400, 470, 180, 90, 0, PI);

fill(teethBright);
rect(377,471,22,22);
rect(401,471,22,22);
fill(teethNorm);
rect(356,471,19,19);
rect(425,471,19,19);
fill(teethDark);
rect(339,471,15,15);
rect(446,471,15,15);

// ears

fill(skinL);
stroke(skinShadowed);
strokeWeight(2);
arc(230,300,40,100, HALF_PI-.3, PI+HALF_PI);
fill(skin);
stroke(skinShadowedD);
arc(570,300,40,100, -HALF_PI, HALF_PI+.3);

translate(225,328);
rotate(6);
fill(skin);
noStroke();
ellipse(0,0,10,30);
rotate(-6);
translate(-225,-328);

translate(575,328);
rotate(-6);
fill(skinShadowed);
noStroke();
ellipse(0,0,10,30);
rotate(6);
translate(-575,-328);

// /ears
//  nose

fill(skinShadowedDD);
ellipse(390,440,14,7);

fill(skinShadowedDD);
ellipse(410,440,14,7);


stroke(skinShadowed);
strokeWeight(3);
noFill();
arc(425,335,40,140,HALF_PI,PI);
fill(skin);
arc(420,422,25,35,-HALF_PI+.1,HALF_PI+.7);
arc(380,422,25,35,.7,PI-.1);
arc(400,422,45,35,HALF_PI-.7,HALF_PI+.7);
stroke(skinLL);
noFill();
arc(380,423,25,35,PI-.3,PI+HALF_PI-.1);
arc(396,422,25,35,HALF_PI+.7,PI+.3);

// /nose

fill(hairMedium);
noStroke();
ellipse(400,160,300,120);

quad(243,150,205,260,250,360,293,120);

quad(557,150,595,260,550,360,507,120);

ellipse(280,200,90,50);

ellipse(520,200,90,50);

noFill();
stroke(hairMedium);
strokeWeight(15);
arc(400,210,50,90,-HALF_PI,HALF_PI);
arc(455,210,50,90,-HALF_PI,HALF_PI);
strokeWeight(10);
arc(420,210,50,90,-HALF_PI,HALF_PI-.6);
arc(330,210,50,90,-HALF_PI,HALF_PI);
strokeWeight(12);
arc(355,210,50,90,-HALF_PI,HALF_PI-.3);
arc(375,210,50,90,-HALF_PI,HALF_PI);
strokeWeight(6);
arc(430,210,50,90,-HALF_PI,HALF_PI);
arc(480,210,50,90,-HALF_PI,HALF_PI);


