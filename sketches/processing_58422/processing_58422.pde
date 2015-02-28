
size(400, 470);
background(255);
smooth();

strokeWeight(2);
stroke(0);
fill(#CCCCCC);
ellipse(200, 100, 170, 180);

fill(255);
rect(115, 100, 170, 250);//big middle rectangle
fill(255);
triangle(60, 420, 125, 420, 93, 325);//bottom triangle left
triangle(275, 420, 340, 420, 308, 325);//bottom triangle right
triangle(168, 450, 233, 450, 200, 360);//bottom triangle center
rect(70, 100, 45, 120);//top left right
rect(285, 100, 45, 120);//top right white
rect(90, 220, 25, 110); //bottom left white
rect(285, 220, 25, 110); //bottom right white

fill(#00009C);
rect(190, 350, 20, 20);//blue center connector

fill(255);
rect(70, 330, 45, 50);//bottom square left
rect(285, 330, 45, 50);//bottom square right
rect(178, 360, 45, 50);//bottom square center
fill(#00009C);
rect(80, 220, 10, 110);//bottom left blue
rect(310, 220, 10, 110);//bottom right blue

//rect(115, 100, 170, 250);//big middle rectangle

strokeWeight(20);
stroke(0);
line(140, 120, 140, 290);
line(170, 200, 170, 290);
strokeWeight(17);
stroke(255);
line(140, 120, 140, 290);
line(170, 200, 170, 290);//left white

strokeWeight(20);
stroke(0);
line(260, 120, 260, 290);
line(230, 200, 230, 290);
strokeWeight(17);
stroke(255);
line(260, 120, 260, 290);
line(230, 200, 230, 290);//right white

strokeWeight(30);
stroke(0);
line(200, 205, 200, 285);
strokeWeight(25);
stroke(#00009C);
line(200, 205, 200, 285);//middle blue

strokeWeight(10);
stroke(0);
line(160, 125, 240, 125);
line(160, 145, 240, 145);
line(160, 165, 240, 165);
strokeWeight(7);
stroke(#00009C);
line(160, 125, 240, 125);
line(160, 145, 240, 145);
line(160, 165, 240, 165);//horiz lines

strokeWeight(20);
stroke(0);
point(200, 220);
point(200, 270);
strokeWeight(15);
stroke(255);
point(200, 220);
point(200, 270);//middle buttons

strokeWeight(2);
stroke(0);
fill(#00009C);
ellipse(200, 325, 30, 40);//middle bottom blue
ellipse(140, 325, 30, 40);//left bottom blue
ellipse(260, 325, 30, 40);//right bottom blue

strokeWeight(2);
stroke(0);
fill(#00009C);
rect(177, 20, 45, 45);
rect(125, 65, 20, 25);
rect(150, 65, 20, 25);
rect(177, 70, 17, 20);
rect(200, 70, 22, 20);
rect(255, 65, 20, 25);//top blue

strokeWeight(2);
stroke(0);
fill(80);
ellipse(200, 40, 30, 30);
ellipse(185, 60, 5, 5);
ellipse(215, 60, 5, 5);
ellipse(239, 77, 20, 20);
fill(25);
ellipse(239, 77, 14, 14);
fill(#EE0000);
ellipse(211, 80, 14, 14);

