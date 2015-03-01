
//Layout de 600x400 amb fons blanc
size(600,400);
background(255);

//Dibuix sense vores
noStroke();

//El·lipses en negre i groc que envolten el logo central
fill(0);
ellipse(300,200,550,300);

fill(252,252,13);
ellipse(300,200,520,280);

// Cos i orelles en negre
fill(0);
rect(263,100,74,225);
triangle(263,100,263,80,283,100);
triangle(317,100,337,80,337,100);

//Arcs de les ales grans
arc(300,200,490,260,HALF_PI+QUARTER_PI,PI+QUARTER_PI+QUARTER_PI/2.1);
arc(300,200,490,260,-QUARTER_PI-QUARTER_PI/2.1,QUARTER_PI);

//Quadrat negre per omplir els forats del logo de negre
rect(150,115,300,165);

//Color groc fons per a les el·lipses que foraden
fill(252,252,13);

//El·lipses dalt
bezier(205,74,130,200,270,230,263,110);
bezier(395,74,470,200,330,230,337,110);

//El·lipses esquerra baix
bezier(127,292,100,230,160,210,215,282);
bezier(200,325,220,175,300,280,300,330);

//El·lipses dreta baix
bezier(473,292,500,230,440,210,385,282);
bezier(400,325,380,175,300,280,300,330);

