
size(300,300, P2D);
translate(150,150);
noStroke();
fill(255,243,0);
rect(-100,-150,200,300,10);

//spots
fill(116,193,100);
ellipse(-50,-130,15,15);
ellipse(70,-139,30,30);
ellipse(70,10,10,10);
ellipse(70,50,40,40);
ellipse(-70,0,40,40);
ellipse(-80,30,10,10);

//white eyes
pushMatrix();
translate(-45.5,-75);
fill(255,255,255);
ellipse(0,0,80,80);
fill(0,0,0);
rect(0,-60,5,20);
rotate(PI/4);
rect(0,-60,5,20);
rotate(PI*1.5);
rect(0,-60,5,20);
popMatrix();

pushMatrix();
translate(45.5,-75);
fill(255,255,255);
ellipse(0,0,80,80);
fill(0,0,0);
rect(0,-60,5,20);
rotate(PI/4);
rect(0,-60,5,20);
rotate(PI*1.5);
rect(0,-60,5,20);
popMatrix();



//blue eyes
fill(23,58,227);
ellipse(-37.5,-75,35,35);
ellipse(37.5,-75,35,35);

//black eyes
fill(0,0,0);
ellipse(-37.5,-75,20,20);
ellipse(37.5,-75,20,20);


//pants brown
fill(185,127,0);
rect(-100,65,200,200);
fill(0,0,0);
rect(-44,-135,5,20);
rect(44,-135,5,20);

//pants white
fill(255,255,255);
rect(-100,65,200,25);

//pants black
fill(0,0,0);
rect(-100,95,25,15);
rect(-60,95,25,15);
rect(-20,95,25,15);
rect(20,95,25,15);
rect(60,95,25,15);
















