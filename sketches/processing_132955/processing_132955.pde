


size( 800, 400 );
background(#FA00BC);
float headX = 400;
float headY = 200;

fill(#FAE1E1);// rgb colours *will define all colours unless redfine
noStroke();
ellipse(headX, headY, 200, 250); //! x ,y, width, height

stroke(0,0,0);
noFill();
arc(headX-30,headY-15,50,30,radians(200), radians(300));

stroke(0,0,0);
noFill();
arc(headX+30,headY-15,50,30,radians(225), radians(330));

ellipseMode(CENTER);// hair
fill(#E5D51C);
ellipse(headX,headY-150,80,80);// arguments: x,y,width,height

fill(0,0,0);//EYE
noStroke();
ellipse(headX-30,headY,25,20);

fill(0,0,0); //EYE
noStroke();
ellipse(headX+30,headY,25,20);

fill(255,255,255);//PUPIL
noStroke();
ellipse(headX-35,headY,5,5);

fill(255,255,255); //PUPIL
noStroke();
ellipse(headX+25,headY,5,5);

stroke(255,0,0);
noFill();
arc(headX,headY+60,50,30,radians(30), radians(150));


