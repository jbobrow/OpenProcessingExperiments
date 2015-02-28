
//MEGAMAN by Joshua Hollenbeck 

PFont f;
float x = 640;

void setup()
{
frameRate(60);// sets framerate 
f = createFont("Impact",50,true);// creates font 
size(1300,600); // sets the canvas size
}


void draw()
{
//outline face Black
fill(0,0,0);
noStroke();
text("Press and hold Left or Right mouse click to fire!",700,100);// creates a String and displays it on the screen 
rect(317,22,64,24);//top of head 
rect(381,46,21,23);//right square bellow top of head 
rect(403,69,21,23);//right square bellow first right square 
rect(360,92,85,23);//long brick on bellow two small squares 
rect(339,69,21,23);//right square bellow first right square 
rect(275,46,64,23);//left brick from top of helmet 
rect(253,69,22,23);// left helmet square brick 
rect(231,92,23,47);// left longer square helmet brick 
rect(210,139,21,69);
rect(446,115,21,139);
rect(296,300,107,23);
rect(403,278,21,23);
rect(424,253,43,25);
rect(275,278,21,23);
rect(253,254,22,24);
rect(231,208,22,46);
rect(318,254,85,24);//mouth bar
rect(339,184,43,48);// left eye square
rect(402,184,22,48);// right eye rectangle 
rect(382,139,43,22);// eyebrow rectangle 
rect(360,115,22,25); // sqaure above eyebrow 

// Lemon Bolt
fill(255,255,0);
ellipse(x,278,70,50);
if (mousePressed)
{
  x = x + 10;
  
}

//Face details White
fill(255,255,255);
strokeWeight(0);
rect(317,162,64,22);
rect(317,231,65,23);
rect(402,232,22,21);
rect(424,162,22,70);
rect(296,184,43,47);

//skin detail peach
fill(255,231,165); 
rect(296,278,107,22);
rect(296,253,21,25);
rect(403,253,21,25);
rect(275,231,42,22);
rect(424,232,22,21);
rect(382,184,21,70);
rect(275,184,21,47);
rect(296,162,22,22);

//light blue helmet detail
fill(56,189,254);
rect(231,139,23,70);
rect(338,46,43,23);
rect(360,69,43,23);
rect(382,115,43,24);

//Blue helmet detail 
fill(1,113,238);
rect(253,92,22,162);
rect(275,253,22,25);
rect(275,69,22,115);
rect(296,69,23,94);
rect(319,69,20,94);
rect(339,91,21,72);
rect(360,140,22,22);
rect(360,140,21,23);
rect(425,115,21,47);
rect(360,161,65,23);

//Right arm outline 
fill(0,0,0);
rect(467,231,65,22);
rect(531,208,86,24);
rect(532,324,86,24);
rect(403,324,107,23);
rect(596,301,64,23);
rect(596,232,64,23);
rect(510,253,22,73);
rect(617,253,22,70);
rect(660,253,22,50);
rect(403,301,107,23);

// right arm light blue color 
fill(56,189,254);
rect(424,277,86,25);
rect(467,253,43,26);
rect(553,253,64,26);
rect(639,255,21,23);


                                             
// right arm Dark blue detail 
fill(1,113,238);
rect(532,277,85,25);
rect(532,300,64,24);
rect(532,230,64,24);
rect(532,253,21,24);
rect(639,277,21,24);

//left arm outline 
//fill(255,0,0);
fill(0,0,0);
rect(168,162,42,23);
rect(124,185,44,23);
rect(103,208,22,24);
rect(81,231,23,70);
rect(103,300,22,24);
rect(168,277,22,47);
rect(232,301,22,46);
rect(189,254,21,24);
rect(211,278,21,24);
rect(124,323,22,24);
rect(146,347,22,24);
rect(210,347,22,24);
rect(168,370,42,24);
rect(188,394,22,23);

// Left Hand Dark Blue Glove 

fill(1,113,238);
rect(104,231,22,69);
rect(125,254,22,69);
rect(146,254,22,93);
rect(168,324,22,46);
rect(190,278,22,92);
rect(212,302,22,46);

//left hand and body light blue color 
//fill(255,0,0);
fill(56,189,254);
rect(125,207,106,47);
rect(167,185,44,23);
rect(167,254,22,23);
rect(167,254,22,23);
rect(210,254,44,24);
rect(232,277,44,24);
rect(254,300,44,24);
rect(254,323,149,24);
rect(232,347,150,24);
rect(253,370,108,24);
rect(210,370,43,24);

//Dark Blue pants
//fill(255,255,0);
fill(1,113,238);
rect(210,394,151,24);
rect(210,418,129,22);
rect(231,440,88,23);

//Legs Outline 
fill(0,0,0);
rect(167,416,23,25);
rect(145,440,23,24);
rect(124,462,23,24);
rect(82,486,43,24);
rect(38,509,44,24);
rect(17,509,21,70);
rect(17,556,193,23);
rect(253,463,23,23);
rect(231,485,23,25);
rect(210,509,22,24);
rect(189,532,21,24);
rect(274,463,23,23);
rect(296,463,23,71);
rect(275,532,21,24);
rect(275,556,193,23);
rect(446,532,22,24);
rect(382,509,64,24);
rect(403,462,22,68);
rect(360,419,22,22);
rect(381,440,22,23);
rect(360,419,22,22);
rect(360,370,22,49);
rect(381,346,22,25);

//light blue pants
fill(56,189,254);
rect(189,416,21,94);
rect(167,440,22,46);
rect(210,440,22,70);
rect(232,463,22,22);
rect(319,440,20,46);
rect(339,418,21,68);
rect(360,440,22,23);

//Dark Blue Boots
fill(1,113,238);
rect(147,463,21,93);
rect(168,486,21,70);
rect(125,486,22,70);
rect(103,510,22,46);
rect(82,510,22,46);
rect(38,533,46,23);
rect(187,510,23,23);
rect(295,533,151,23);
rect(319,509,63,24);
rect(319,486,84,24);
rect(360,462,43,24);
}


