
size(600, 600);
background(224,225,150);//grass green


//for backgroung.
smooth();
noFill();
stroke(255);
strokeWeight(1);
//up left
ellipse(0, 0, 600, 600);
ellipse(0, 0, 580 , 580);
ellipse(0, 0 , 560 , 560);
ellipse(0, 0 , 540 , 540);
ellipse(0, 0 , 520 , 520);
ellipse(0, 0 , 500 , 500);
ellipse(0, 0 , 480 , 480);
ellipse(0, 0 , 460 , 460);
ellipse(0, 0 , 440 , 440);
ellipse(0, 0 , 420 , 420);
ellipse(0, 0 , 400 , 400);

ellipse(0, 0 , 300 , 300);
ellipse(0, 0 , 280 , 280);
ellipse(0, 0 , 260 , 260);
ellipse(0, 0 , 240 , 240);
ellipse(0, 0 , 220 , 220);
ellipse(0, 0 , 200 , 200);

ellipse(0, 0, 30, 30);
ellipse(0, 0, 20, 20);
ellipse(0, 0, 10, 10);

//up right
ellipse(600, 0 , 610 , 610);
ellipse(600, 0 , 590 , 590);
ellipse(600, 0, 570 , 570);
ellipse(600, 0, 550 , 550);
ellipse(600, 0, 530 , 530);
ellipse(600, 0, 510 , 510);
ellipse(600, 0, 490 , 490);
ellipse(600, 0, 470 , 470);
ellipse(600, 0, 450 , 450);
ellipse(600, 0, 430 , 430);
ellipse(600, 0, 410 , 410);

ellipse(600, 0, 310 , 310);
ellipse(600, 0, 290 , 290);
ellipse(600, 0, 270 , 270);
ellipse(600, 0, 250 , 250);
ellipse(600, 0, 230 , 230);
ellipse(600, 0, 210 , 210);

ellipse(600, 0, 30, 30);
ellipse(600, 0, 20, 20);
ellipse(600, 0, 10, 10);

//down left
ellipse(0, 600, 600, 600);
ellipse(0, 600, 580 , 580);
ellipse(0, 600 , 560 , 560);
ellipse(0, 600 , 540 , 540);
ellipse(0, 600 , 520 , 520);
ellipse(0, 600 , 500 , 500);
ellipse(0, 600 , 480 , 480);
ellipse(0, 600 , 460 , 460);
ellipse(0, 600 , 440 , 440);
ellipse(0, 600 , 420 , 420);
ellipse(0, 600 , 400 , 400);

ellipse(0, 600 , 300 , 300);
ellipse(0, 600 , 280 , 280);
ellipse(0, 600 , 260 , 260);
ellipse(0, 600 , 240 , 240);
ellipse(0, 600 , 220 , 220);
ellipse(0, 600 , 200 , 200);

//down right
ellipse(600, 600 , 610 , 610);
ellipse(600, 600 , 590 , 590);
ellipse(600, 600, 570 , 570);
ellipse(600, 600, 550 , 550);
ellipse(600, 600, 530 , 530);
ellipse(600, 600, 510 , 510);
ellipse(600, 600, 490 , 490);
ellipse(600, 600, 470 , 470);
ellipse(600, 600, 450 , 450);
ellipse(600, 600, 430 , 430);
ellipse(600, 600, 410 , 410);

ellipse(600, 600, 310 , 310);
ellipse(600, 600, 290 , 290);
ellipse(600, 600, 270 , 270);
ellipse(600, 600, 250 , 250);
ellipse(600, 600, 230 , 230);
ellipse(600, 600, 210 , 210);

//middle
ellipse(300, 300, 500 , 500);
ellipse(300, 300, 480 , 480);
ellipse(300, 300, 460 , 460);
ellipse(300, 300, 440 , 440);
ellipse(300, 300, 420 , 420);
ellipse(300, 300, 400 , 400);

//second box
noStroke();
fill(228,228,227);//front
rect(275,225,200,200);
fill(240,240,240);//top
quad(275,225,450,140,615,140,475,225);
fill(180,180,181);//side
quad(475,225,615,140,615,330,475,425);
//ear
fill(228,228,227);
rect(275,150,30,75);
rect(445,150,30,75);
fill(239,83,83);
rect(285,160,10,60);
rect(455,160,10,60);
fill(250,250,250);
quad(275,150,300,140,300,140,305,150);
quad(445,150,470,140,470,140,475,150);

//face
fill(0);
ellipse(445,325,50,35);

//side cloud
fill(117,208,246);
ellipse(520,260,50,50);
ellipse(560,240,50,50);
ellipse(540,235,50,50);
ellipse(540,270,40,40);
ellipse(570,260,30,30);

//legs
fill(228,228,227);//front
rect(435,425,40,40);
fill(180,180,181);
quad(475,425,495,405,495,445,475,465);

//first box
noStroke();
fill(184,31,31);//dark red
ellipse(385,470,30,50);//back right
ellipse(300,530,30,50);//front right


fill(255,46,46); //red
ellipse(400,470,30,50);//back right
ellipse(315,530,30,50);//front right
ellipse(115,530,30,50);//front left


fill(255);//white
ellipse(400,470,15,30);//back right
ellipse(315,530,15,30);//front right



fill(255,200,20);//face
rect(100,350,200,200);
fill(255,227,20); //top
quad(100,350,250,250,420,250,300,350);
fill(255,170,20);//side
quad(300,350,420,250,420,450,300,550);
fill(255,200,20);
rect(175,275,50,20);
rect(275,275,50,20);
ellipse(300,295,50,20);
ellipse(200,295,50,20);
fill(255,235,220);//light
ellipse(200,275,50,20);//small ellipse on top
ellipse(300,275,50,20);

fill(117,76,36);//brown
ellipse(130,420,50,35);
ellipse(270,420,50,35);
fill(236,28,36);
ellipse(200,450,50,35);
fill(255,235,220);
ellipse(190,445,15,10);
noFill();//smile
strokeWeight(2);
stroke(117,76,36);
//line(170,480,150,525);
//line(230,480,250,525);
bezier(170,480,150,525,250,525,230,480);
stroke(255,145,20);//side squa
strokeWeight(3);
stroke(117,76,36);//blue
fill(45,121,240);
quad(300,375,420,275,420,300,300,405);
fill(255,69,69);//red
quad(300,425,420,325,420,350,300,455);
fill(48,167,106);//green
quad(300,475,420,375,420,400,300,500);


                
