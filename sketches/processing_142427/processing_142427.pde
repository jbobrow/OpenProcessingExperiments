
size(650,650);
background(255);


stroke(41,124,123);
fill(41,124,123);
ellipse(110,250,50,120); //orelles1


stroke(41,124,123);
fill(41,124,123);
ellipse(542,250,50,120); //orella 2

ellipse(325,200,420,400);  //original
ellipse(325,250,420,480); //cap darrera
stroke(0);
strokeWeight(2);
fill(189,42,219);

ellipse(110,300,30,30);
ellipse(540,300,30,30);

//cara
stroke(125,171,229);
fill(125,171,229);
ellipse(280,350,320,400);
ellipse(370,350,320,400);
stroke(125,171,229);
fill(125,171,229);
rect(150,150,40,200);
rect(460,150,40,200);



ellipse(250,150,200,200);//ullprimer
stroke(0);
fill(255);

fill(245,215,151);
ellipse(250,150,100,100);//ullprimer gran
fill(42,247,170);
ellipse(250,150,60,60); //cercle prim ull

fill(0);
ellipse(250,150,50,50);//ullprimerinterior
fill(255);
ellipse(260,140,15,15); //pupilabrillo

stroke(125,171,229);
fill(125,171,229);
ellipse(401,150,200,200);//ullprimer
stroke(0);
fill(255);

fill(245,215,151);
ellipse(400,150,100,100);//ullsegon gran
fill(42,247,170);
ellipse(400,150,60,60); //cercle prim voltant ull
fill(0);
ellipse(400,150,50,50); //ullsegoninterior
fill(255);
ellipse(410,140,15,15); //pupilabrillo

stroke(129,72,20);
fill(129,72,20);
triangle(290,220,360,220,325,260); //nas
ellipse(325,219,70,25);

fill(255);

//barbeta
stroke(125,171,229);
fill(125,171,229);
ellipse(330,520,120,120);
//boca
stroke(180,18,18);
strokeWeight(7);
fill(0);
ellipse(330,415,180,180);


//interior orelles
stroke(0);
fill(0);
ellipse(110,250,15,60);
ellipse(542,250,15,60);

//celles
stroke(0);
noFill();

curve(290, 123, 280, 70, 200, 80, 280, 123); 
curve(460, 170, 450, 80, 370,70, 450, 140); 



