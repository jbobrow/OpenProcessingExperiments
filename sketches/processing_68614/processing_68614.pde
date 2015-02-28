
size (500,500);
background (#938D8D);

smooth();
strokeWeight (5);
fill(#FFE6DB);
ellipse(255, 255, 200, 200);
strokeWeight(3);
fill(#FFD0B4);
ellipse(310, 255, 80, 135);

line(270, 243, 350, 260);
noFill();
arc(218, 250, 123, 45, PI, TWO_PI-PI/9);
arc(250, 335, 157, 40, PI, TWO_PI-PI/11); 

//horizontal lines down the face
strokeWeight(4);
line(153, 250, 180, 400);//this could be switched to an arc
strokeWeight(2);
line(190, 270, 200, 400);

arc(320, 380, 200, 250, 0, TWO_PI-PI/2);


//jaw
strokeWeight(4);
arc(180, 390, 120, 20, 0, PI/2);
line(237, 392, 310, 360);
line(320, 330, 310, 365);

//neck
line(200, 400, 230, 410);
line(330, 325, 345, 450);
