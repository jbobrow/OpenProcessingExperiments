
size(400, 400);
noStroke();
//aconseguim fer un fons multicolor (tutorial, editat)
//colorMode(HSB, 400);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 500);
    point(i, j);
  }
}

//muntanyes de fons
noStroke();
fill(56, 172, 69);
ellipse(100,300,320,380);
ellipse(300,300,350,450);


//orelles
stroke(0); 
fill(255, 207, 46);
ellipse(50,280,60,180);
ellipse(350,280,60,180);

//espatlla
stroke(1);
fill(255, 207, 46);
ellipse(380, 360, 50, 50);

ellipse(10, 360, 50, 50);

//cos
fill(255, 207, 46);
stroke(0); 
bezier(0,400, 10, 50, 400, 50, 400, 400);

//ulls
stroke(1);
fill(1);
ellipse(120, 230, 100, 100);

noStroke();
fill(255);
ellipse(120, 230, 80, 80);

stroke(1);
fill(1);
ellipse(280, 230, 100, 100);

noStroke();
fill(255);
ellipse(280, 230, 80, 80);

//bigoti

stroke(0); 
fill(255, 207, 46);
ellipse(200,250,100,50);

//cover
stroke(255, 207, 46); 
fill(255, 207, 46);
rect(150,250,80,50);

stroke(0); 
fill(255, 207, 46);
bezier(150,250, 150, 380, 190, 380, 180, 250);

bezier(220,250, 220, 380, 260, 380, 250, 250);



//fem la boca.
stroke(1);
fill(84, 50, 0);
ellipse(200, 320, 30, 110);

//nas
stroke(1);
fill(1);
ellipse(200, 250, 50, 20);

//rectangle
rect(25,10,350,50);

//text
textSize(35);
fill(255, 255, 255);
text("Hora d'aventures!", 50, 50); 


//braços
stroke(1);
fill(255, 207, 46);
ellipse(380, 380, 300, 50);

stroke(1);
fill(255, 207, 46);
ellipse(20, 370, 300, 50);



