
size (640,480);
background (234,199,69);

noStroke();
fill(95,66,18);//marro

quad(445,445, 480,420, 550,410, 475,470);//sabata davant
quad (380,390, 435,350, 470,410, 425,445);//cama davant
arc (385,393, 130,130, PI+QUARTER_PI, TWO_PI, OPEN);//genoll davant1
rect (380,350, 40,40);//genoll davant2

quad (265,300, 400,330, 380,390, 250,360);//cama mig

arc (250,360, 130,130, 0,HALF_PI);//genoll darrere1
quad (180,350, 250,360, 250,425, 160,400);//cama darrere
quad (130,330, 170,345, 155,390, 95,425);//sabata darrere

quad (290,175, 400,220, 380,310, 245,280);//samarreta
quad (245,160, 290,175, 275,230, 230,215);//braç darrere
quad (400,220, 440,238, 430,285, 380,265);//braç davant

quad (325,80, 570,170, 540,255, 290,170);//ampolla cos
quad (225,60, 326,80, 291,170, 200,120);//ampolla coll
quad (200,48, 230,55, 200,127, 173,108);//ampolla final

quad (168,37, 180,40, 155,102, 141,94);//tap
ellipse (177,50,20,20);//detall tap1
ellipse (170,65,20,20);//detall tap2
ellipse (163,80,20,20);//detall tap3
ellipse (157,92,20,20);//detall tap4

fill(234,199,69);//groc
ellipse (395,160, 120,120); //cap


stroke (95,66,18);
noFill ();
strokeWeight (7);
curve(375,120, 385,195, 425,195, 415,120);//boca


curve(150,150, 430,280, 495,225, 400,100); //braç davant_ext
curve(300,200, 430,245, 465,220, 450,100); //braç davant_int

curve (450,275, 230,210, 180,235, 0,400); //braç darrere_int
curve (450,275, 240,170, 160,215, 150,400); //braç darrere_ext

ellipse (167,236, 40,40); //ma

fill(234,199,69);
noStroke ();
quad (165,212, 190,215, 182,245, 153,245);//truco_ma

fill (95,66,18);
ellipse (400,128, 95,50);//cabell_1
ellipse (355,158, 30,75);//cabell_2
ellipse (366,128, 30,30);//cabell_3
triangle (430,165, 425,135, 455,130);
triangle (400,130, 395,170, 455,130);
triangle (435,130, 440,98, 455,130); 
triangle (410,140, 420,85, 455,130);
triangle (365,140, 382,173, 350,160);
triangle (360,150, 376,182, 360,180);

ellipse (390,175, 15,15);//ull esquerra
ellipse (423,175, 15,15);//ull dreta

fill (234,199,69);
ellipse (358,185, 15,20); //orella






// (234,199,69) groc (95,66,18) marró
