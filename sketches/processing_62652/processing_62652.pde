
size(600, 600);



strokeWeight(1);
noFill();
//nose
arc(300, 350, 60, 60, 0, PI);
arc(355, 350, 50, 30, PI, TWO_PI);
arc(360, 350, 40, 30, 0, PI);
arc(245, 350, 50, 30, PI, TWO_PI);
arc(240, 350, 40, 30, 0, PI);
line(260, 350, 260, 170);
line(340, 350, 340, 170);

stroke(1);
strokeWeight(1.1);
//eye brows
pushMatrix();
line(340, 170, 340, 190);
translate(2, -2);
line(340, 170, 340, 190);
translate(2, -2);
line(340, 170, 340, 190);
translate(2, -1);
line(340, 170, 340, 190);
translate(2, -1);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 0);
line(340, 170, 340, 190);
translate(2, 1);
line(340, 170, 340, 190);
translate(2, 1);
line(340, 170, 340, 190);
translate(2, 2);
line(340, 170, 340, 190);

popMatrix();

pushMatrix();
line(260, 170, 260, 190);
translate(-2, -2);
line(260, 170, 260, 190);
translate(-2, -2);
line(260, 170, 260, 190);
translate(-2, -1);
line(260, 170, 260, 190);
translate(-2, -1);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 0);
line(260, 170, 260, 190);
translate(-2, 1);
line(260, 170, 260, 190);
translate(-2, 1);
line(260, 170, 260, 190);
translate(-2, 2);
line(260, 170, 260, 190);
translate(-2, 2);
line(260, 170, 260, 190);
popMatrix();

//eyes

//left
strokeWeight(1);

line(230, 220, 230, 240);
line(370, 220, 370, 240);

//glasses
rectMode(CORNER);
rect(200, 260, 65, 15);
//line(260,280, 200,280);
rectMode(CORNER);
rect(335, 260, 65, 15);

strokeWeight(2);
strokeCap(BEVEL);
arc(300,270, 70,15, PI,TWO_PI);

//mustache
line(300,400, 340,400);
arc(340,385,30,30, 0,HALF_PI);
arc(345,385, 20,20,PI+HALF_PI,TWO_PI);
arc(345,380, 7,13, 0,PI+HALF_PI);
line(300,400, 260,400);
arc(260,385,30,30,HALF_PI,PI);
arc(255,385,20,20,PI,PI+HALF_PI);
arc(255,380,7,13, PI+HALF_PI,TWO_PI+PI);

strokeWeight(1);
line(280,410, 320,410);



