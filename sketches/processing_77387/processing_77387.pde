
//----Robotor--

size(500,500); // taille de la fenêtre
background(207); // fond de couleur

quad(310,220,330,220,365,300,355,300); //bras droit
rect(355,300,10,50); //avant-bras droit
ellipse(360,300,10,10); //coude droit
rect(335,345,50,10);//main
ellipse(360,350,10,10); //poignet droit
rect(335,355,2,10);//pouce droit
rect(346,355,2,20);//index droit
rect(359,355,2,25);//majeur droit
rect(372,355,2,20);//annulaire droit
rect(383,355,2,10);//auriculaire droit




ellipse(320,230,40,40); //epaule droite
quad(192,400,220,400,200,450,220,450); //cuisse gauche
quad(268,400,298,400,278,450,298,450); //cuisse droite
ellipse(208,430,10,10); //rotule gauche
ellipse(286,430,10,10); //rotule droite
quad(160,220,180,220,140,300,130,300); //bras gauche
rect(130,300,10,50); //avant-bras gauche
ellipse(135,300,10,10); //coude gauche
rect(110,345,50,10);
ellipse(135,350,10,10); //poignet gauche
rect(110,355,2,10);//pouce gauche
rect(121,355,2,20);//index gauche
rect(134,355,2,25);//majeur gauche
rect(145,355,2,20);//annulaire gauche
rect(158,355,2,10);//auriculaire gauche


ellipse(245,385,130,50); //bassin
rect(170,230,150,160); //buste
ellipse(245,120,40,40); //chapeau
rect(205,120,80,80); //tête
triangle(205,170,205,190,195,180); //oreille gauche
triangle(285,170,285,190,295,180); //oreille droite
rect(218,175,3,15); //dent1
rect(228,175,3,15); //dent2
rect(238,175,3,15); //dent3
rect(248,175,3,15); //dent4
rect(258,175,3,15); //dent5
rect(268,175,3,15); //dent1

ellipse(205,150,30,30); //oeil gauche
ellipse(285,150,30,30); //oeil droit
fill(#A3FA58);
ellipse(207,150,10,10); //pupille gauche
ellipse(283,152,10,10); //pupille droite


fill(255);

arc(170, 230, 40, 40, HALF_PI, PI); //epaule gauche  
arc(170, 230, 40, 40, PI, PI+QUARTER_PI);//epaule gauche 
arc(170, 230, 40, 40, PI+QUARTER_PI, TWO_PI);//epaule gauche 

quad(225,200,265,200,270,230,220,230); //cou

ellipse(208,465,40,40); //pied gauche
ellipse(292,465,40,40); //pied droit`


fill(#4A474B);
text("ROBOTOR", 215, 300);




fill(#CFCFCF);

rect(-1,465,501,35); //rectangle de camouflage









