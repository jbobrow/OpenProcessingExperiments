

size(600,450);

background(255);//COLOR DEL FONS BLANC

//BENDER, FUTURAMA

strokeWeight(2.5);//GROSOR DE LINIA 


fill(150);//COLOR GRIS
ellipse(300,500,400,400);
line(300,500,452.5,370);//linia braç dret 1
line(300,500,475,405);//linia braç dret 2
line(300,500,125,405);//linia braç esquerra 1
line(300,500,147.5,370);//linia braç esquerra 2

fill(255);//COLOR BLANC
ellipse(300,500,325,325);//ellipse per borrar
fill(150);
ellipse(380,355,80,100);//hombro dret
ellipse(220,355,80,100);//hombro esquerra
triangle(402.5,307.5,197.5,307.5,300,2000);//triangle cos exterior
triangle(220,360,380,360,300,2000);//triangle interior cos
ellipse(300,0,650,650);//ellipse coll inferior
ellipse(300,30,502.5,502.5);//ellipse coll superior

noStroke();//SENSE CONTORN
fill(255);//COLOR BLANC
rect(0,0,245,275);//rectangle per esborrar 
rect(355,0,245,275);//rectangle per esborrar
rect(0,0,400,250);//rectangle per esborrar
triangle(245,275,0,275,180,320);//triangle per esborrar
triangle(355,275,500,275,420,320);//triangle per esborrar


fill(150);//COLOR GRIS
stroke(1);//AMB CONTORN
line(245,275,197.5,307.5);//linia lateral esquerra coll
line(355,275,402.5,307.5);//linia lateral dreta coll
triangle(295,95,305,95,300,30);//triangule de l´antena
ellipse(300,130,100,100);//elipse del cap


noStroke();//SENSE CONTORN
rect(250,130,100,120);//rectangle del cap
rect(245,205,110,70);//rectangle inferior cara

stroke(1);//AMB CONTORN
line(250,130,250,175);//linia costat cap dret
line(350,130,350,175);//linia costat cap esquerra
ellipse(300,80,20,10);//elipse inferior antena
ellipse(300,35,10,10);//cercle de l'antena
ellipse(245,175,60,60);//cercle exterior ull esquerra
ellipse(355,175,60,60);//cercle exterior ull dret

noStroke();//SENSE CONTORN
rect(240,145,120,60);//rectangle exterior dels ulls

stroke(1);//AMB CONTORN
line(240,145,360,145);//linia rectangle ulls superior
line(240,205,360,205);//linia rectangle ulls inferior

fill(0);//COLOR NEGRE
ellipse(355,175,50,50);//cercle intermig ull dret
ellipse(245,175,50,50);//cercle intermig ull esquerra 
rect(245,150,115,50);//rectangle interior ulls

fill(150);//color gris
line(245,205,245,275);//linia esquerra, rectangle inferior cara
line(355,275,355,205);//linia dreta, rectangle inferior cara

fill(255);//COLOR BLANC
ellipse(272.5,240,50,50);//cercle esquerra boca
ellipse(327.5,240,50,50);//cercle dret boca
rect(272.5,215,50,50);//rectangle del mitg de la boca
line(297.5,215,297.5,265);//linia vertical boca 1
line(347.5,225,347.5,255);//linia vertical boca 2
line(252.5,225,252.5,255);
line(250,231.666,350,231.66666);//linia horitzontal boca 2
line(250,248.333,350,248.333);//linia horitzontal boca 2
ellipse(332.5,175,60,60);//cercle contorn, ull dret
ellipse(267.5,175,60,60);//cercle exterior, ull esquerra

fill(0);//COLOR NEGRE
rect(330,172.5,10,10);//pupila dreta
rect(260,172.5,10,10);//pupila esquerra
triangle(277.5,150,300,170,322.5,150);//Triangle negre, ulls

fill(150);//COLOR GRIS
noStroke();//SENSE CONTORN
rect(250,145,100,5);//rectangle griss, visera superior
rect(250,200,100,5);//rectangle gris, visera inferior

stroke(1);//AMB CONTORN
line(240,145,360,145);//linia superior, visera superior
line(240,205,360,205);//linia inferior, visera inferior
line(240,150,360,150);//linia inferior, visera superior
line(240,200,360,200);//linia superior, visera inferior
ellipse(360,450,10,10);//boleta del cos


noStroke();
fill(55,52,152);//COLOR BLAU CORTINES
ellipse(650,0,500,900);//cortina dreta
ellipse(0,0,400,900);//cortina esquerra

//PAC-MAN
fill(255,243,0);//COLOR GROC

rect(70,70,50,10);
rect(60,80,70,10);
rect(50,90,90,10);
rect(70,100,80,10);
rect(90,110,60,10);
rect(110,120,40,10);
rect(90,130,60,10);
rect(70,140,80,10);
rect(50,150,90,10);
rect(60,160,70,10);
rect(70,170,50,10);




//VIRUS PAC-MAN
fill(255,38,0);//COlOR VERMELL
rect(480,50,40,10);
rect(460,60,80,10);
rect(450,70,100,10);
rect(440,80,120,10);//
rect(440,90,120,10);
rect(440,100,120,10);
rect(440,110,120,10);
rect(430,120,140,10);
rect(430,130,140,10);
rect(430,140,140,10);
rect(430,150,140,10);
rect(430,160,140,10);
rect(430,170,40,10);
rect(480,170,40,10);
rect(530,170,40,10);
rect(440,180,20,10);
rect(490,180,20,10);
rect(540,180,20,10);

fill(255);//COLOR BLANC ULLS
rect(450,80,20,10);
rect(510,80,20,10);
rect(440,90,40,10);
rect(500,90,40,10);
rect(440,100,40,10);//
rect(500,100,40,10);
rect(440,110,40,10);
rect(500,110,40,10);
rect(450,120,20,10);
rect(510,120,20,10);

fill(30,68,247);//COLOR BLAU ULLS
rect(440,100,20,20);
rect(500,100,20,20);



















