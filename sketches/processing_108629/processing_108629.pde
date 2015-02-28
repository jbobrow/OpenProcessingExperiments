
//THEUNIVERSE
size(600, 600);
background ( 55, 59, 86);
//moon
stroke(224, 183, 24);
ellipse( 100, 700, 1000, 700);
//saturn
fill(242, 170, 0);
ellipse( 520, 50, 150, 150);

noFill();
stroke(240, 55, 48);
strokeWeight(6);
ellipse (520, 50, 220, 30);

strokeWeight(1);

//stars
stroke(255, 253, 12);
strokeWeight(10);
line(300, 50, 300, 50);
strokeWeight(5);
line(550, 350, 550, 350);
strokeWeight(6);
line(20, 40, 20, 40);
strokeWeight(3);
line(75, 320, 75, 320);
strokeWeight(9);
line(520, 270, 520, 270);
strokeWeight(5);
line(200, 120, 200, 120);
strokeWeight(9);
line(575, 490, 575, 490);
strokeWeight(5);
line(400, 20, 400, 20);
strokeWeight(6);
line(530, 450, 530, 450);
strokeWeight(9);
line(590, 430, 590, 430);
strokeWeight(10);
line(190, 75, 190, 75);
strokeWeight(5);
line(130, 40, 130, 40);
strokeWeight(4);
line(560, 210, 560, 210);
strokeWeight(10);
line(25, 270, 25, 270);

strokeWeight(7);
line(60, 200, 60, 200);

strokeWeight(1);


//FACE
stroke( 77, 74, 74);
fill( 222, 219, 226);
quad( 100, 100, 500, 100, 500, 500, 100, 500);
quad( 170, 500, 430, 500, 430, 600, 170, 600);

//GRILLZ
stroke(255, 253, 12);
strokeWeight(4);
fill(242, 170, 0);
quad( 200, 300, 400, 300, 400, 400, 200, 400);
line(200, 350, 400, 350);
line (230, 300, 230, 400);
line(260, 300, 260, 400);
line(290, 300, 290, 400);
line(320, 300, 320, 400);
line(350, 300, 350, 400);
line(380, 300, 380, 400);

//EYES
//form: arc lid-- arc(x, y, width, height, start, stop);
stroke( 252, 116, 130);
strokeWeight(3);
fill( 255, 255, 255);
arc( 200, 190, 100, 100, 0, PI);
arc( 400, 190, 100, 100, 0, PI);
//eyeballs
noStroke();
fill( 27, 18, 45);
ellipse(200, 200, 50, 50);
ellipse(400, 200, 50, 50);

fill(254, 116, 130);
//lids
arc( 200, 200, 120, 110, PI, 2*PI);
arc( 400, 200, 120, 110, PI, 2*PI);

//nose
noStroke();
fill( 146, 141, 152);
triangle( 280, 270, 295, 230, 310, 270);
