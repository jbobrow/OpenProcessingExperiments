
size(400, 400);

background(172, 108, 13, 255);

//meget pænt hår

fill(172, 108, 13, 255);
//ellipse(180,190,400,200);

//kroppen
strokeWeight(3); 
stroke(75, 149, 21, 255);
fill(90, 179, 26, 255);
ellipse(200, 380, 150, 300);
strokeWeight(3);
stroke(75, 149, 21, 255);
arc(170, 320, 20, 20, radians(30), radians(190-40));
arc(230, 320, 20, 20, radians(30), radians(190-40));

//ansigtet 
stroke(252,187,143,255);
fill(252, 219, 197, 255);
ellipse(100,220,20,20);
ellipse(300,220,20,20);
//strokeWeight(1);
//stroke(0);
fill(252, 219, 197, 255);
ellipse(200, 200, 200, 200);
noStroke();
fill(239, 50, 83, 120);
ellipse(140, 220, 50, 50);
ellipse(260, 220, 50, 50);
  //hallå det her er næsen! 
  fill(252, 187, 143, 255);
triangle(200, 200, 200+10, 200+10, 200-10, 200+10);




//mund
strokeWeight(4);
stroke(0);
noFill();
//arc(150, 150, 80, 80, 0, PI+QUARTER_PI, OPEN);
arc(200, 200, 80, 80, radians(30), radians(180-30));

strokeWeight(3);
arc(170, 190, 20, 20, radians(30), radians(190-40));
arc(230, 190, 20, 20, radians(30), radians(190-40));

noStroke();
fill(172, 108, 13, 255);
ellipse(200, 130, 200, 70);



