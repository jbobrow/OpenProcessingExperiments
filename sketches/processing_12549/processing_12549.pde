
size(600,600);
background(255);


noStroke();
smooth();
noFill();

stroke(224);
strokeWeight(2);
ellipse(100,100,100,100);

stroke(222);
strokeWeight(4);
ellipse(100,100,200,200);

stroke(220);
strokeWeight(8);
ellipse(100,100,450,450);

stroke(218);
strokeWeight(15);
ellipse(100,100,900,900);

noStroke();
fill(216);
ellipse(100,100,40,40);



fill(64);
ellipse(440,440,60,60);
ellipse(500,500,20,20);


//first one
fill(124);
noStroke();
smooth();
quad(0,300,140,160,160,180,0,340);

//line 2
fill(202);
quad(400,180,580,0,620,0,420,200);
quad(420,200,600,380,600,420,400,220);

//little black one
fill(0);
quad(440,200,480,160,520,200,480,240);


//black middle one
fill(0);
quad(60,300,300,60,440,200,200,440);

//under middle,
fill(197);
quad(280,400,400,280,440,320,320,440);


//last two
fill(64);

quad(240,600,380,460,440,520,360,600);
quad(460,380,600,240,600,360,520,440);




