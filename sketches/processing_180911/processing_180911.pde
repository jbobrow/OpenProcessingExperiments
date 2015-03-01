
size(600,600);
background(164);
smooth();

strokeWeight(5);
fill(255);

ellipse(300,300,500,500);

arc(327,285,475,425,radians(30),radians(165));

line(95,340,110,305);
line(150,440,160,400);
line(260,490,255,460);
line(300,495,300,470);
line(300,495,310,515);
line(340,515,360,480);
line(385,505,400,470);
line(395,505,380,470);
line(430,480,420,460);
line(430,480,425,495);
line(455,480,445,445);

noStroke();
fill(0);
pushMatrix();
translate(300,300);
rotate(radians(30));
ellipse(0,0,130,170);
popMatrix();

pushMatrix();
translate(425,305);
rotate(radians(15));
bezier(0,0,-25,50,25,50,0,0);
rotate(radians(-45));
bezier(10,0,-15,50,35,50,10,0);
popMatrix();

/* Opción 1
Solo contorno (faltaba dar forma a las curvas)
No he sabido cómo decirle que la forma está cerrada para que la rellene

stroke(0);
strokeWeight(1);
noFill();

beginShape();
arc(470,190,60,60,PI,2*PI);
curve(500,190,500,190,530,260,530,260);
arc(490,260,80,50,0,PI);
curve(450,260,450,260,440,190,440,190);
endShape(); */

// Opción 2: la cutre

arc(470,190,65,65,PI,2*PI);
arc(490,263,85,50,0,radians(190));
rect(455,190,45,75);
rect(460,230,60,40);

stroke(0);
strokeWeight(25);
noFill();
curve(470,110,490,190,520,260,455,370);
curve(575,260,460,265,455,180,530,200);
