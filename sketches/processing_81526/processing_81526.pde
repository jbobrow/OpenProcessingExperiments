
size (500,500);
background(255);

//deux lignes fines qui forment un +
line(50,100,50,150);
line(25,125,75,125);

//je modifie l'épaisseur de deux autres lignes formant un +
strokeWeight(15);
line(130,100,130,150);
line(105,125,155,125);

//je modifie l'épaisseur de deux autres lignes formant un + (50 pixels)
strokeWeight(50);
line(250,100,250,150);
line(220,125,280,125);

//je modifie l'épaisseur de deux autres lignes formant un + (100 pixels)
strokeWeight(100);
line(400,100,400,150);
line(375,125,425,125);


strokeCap(SQUARE); // extrémité carré
strokeWeight(20);
line(130,250,130,310);
line(100,280,160,280);

strokeCap(SQUARE); // extrémité carré
strokeWeight(40);
line(250,250,250,310);
line(220,280,280,280);


strokeCap(SQUARE);
strokeWeight(40);
stroke(#B96F9F,150);
line(400,250,400,310);
stroke(#6FB9B3,150);
line(365,280,435,280);


