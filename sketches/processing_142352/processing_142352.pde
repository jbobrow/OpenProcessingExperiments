
size(500,500);

fill(0); //PELO
ellipse(250,220,450,300);


fill(240,196,160); //CARA
stroke(240,196,160);
ellipse(250,270,270,170);

fill(240,196,160); //CARA
stroke(240,196,160);
quad(150,115,350,115,320,250,180,250);

fill(0); //FLEQUILLO
stroke(0);
arc(250, 111, 220, 90, 0, PI+QUARTER_PI, OPEN);

fill(0); //OJO IZQ
stroke(0);
ellipse(230,200,10,27);

fill(0); //OJO DERECHO
stroke(0);
ellipse(270,200,10,27);

fill(0); //BOCA
ellipse(250,280,150,60);

fill(240,196,160); //BOCA
stroke(240,196,160);
rect(150,245,200,35);

fill(245,171,114); //NARIZ
stroke(0);
strokeWeight(2);
ellipse(250,240,40,40);

noFill();
stroke(255, 102, 0);
//line(170,267,175,320);
//line(331,267,325,320);
stroke(0, 0, 0);

bezier(170,267,175,320,325,320,331,270);

fill(255,0,0);   //MOFLETE IZQ
stroke(255,0,0);
ellipse(170,255,20,10);

fill(255,0,0); //MOFLETE DERECHO
stroke(255,0,0);
ellipse(332,255,20,10);

fill(255,0,0);   //LAZO IZQ
stroke(0,0,0);
quad(150,40,250,70,250,70,150,110);

fill(255,0,0);   //LAZO DERECHO
stroke(0,0,0);
quad(350,40,250,70,250,70,350,110);

stroke(0);   //LINEA LAZO
line(180,70,325,70);

fill(255,0,0);   //ELIPSE LAZO
stroke(0);
ellipse(250,70,70,40);




