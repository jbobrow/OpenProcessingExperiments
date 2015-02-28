

//***********************************
//Chalet et montagne
//Gaultier Robert
//***********************************






size(500,500);//taille de l'image 500 pixels/500 pixels
background(60,200,220);//couleur de l'arriere plan
line(0,250,150,20);//ligne 1
line(150,20,240,180);//ligne2
line(240,180,290,100);//ligne3
line(290,100,400,320);//ligne4
line(400,320,450,220);//ligne5
line(450,220,500,380);//ligne6
fill(160,120,25);//couleur chalet
rect(100,330,150,100);//base chalet
fill(255);//couleur fenetre+porte
rect(120,350,40,40);//fenetre chalet
rect(190,350,40,80);//porte chalet
line(120,360,160,360);//barre haute fenetre
line(120,380,160,380);//barre milieu fenetre
line(120,370,160,370);//barre bas fenetre
line(140,350,140,390);//barre horizontale fenetre
fill(90,70,15);//couleur toit
triangle(70,330,180,280,290,330);
fill(255);//couleur oeil de boeuf
ellipse(180,310,20,20);//oeil de boeuf
fill(240,250,23);//couleur soleil
ellipse(420,100,110,110);//soleil
fill(14,175,26);//couleur herbe
rect(0,420,500,80);//herbe
noFill();
ellipse(210,365,15,15);//tete
line(210,372,210,400);//corps
triangle(200,420,210,400,220,420);//jambes
line(200,380,220,390);




