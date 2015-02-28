
size(500,550);
background(217,246,250);
strokeWeight(2);

//brazos
fill(254,255,44);
rect(0,287.5,200,15);
rect(400,287.5,150,15);
fill(255,255,255);
rect(100,275,25,40);
rect(375,275,25,40);

//cabeza
fill(254,255,44);
quad(100,50,400,50,375,300,125,300);
strokeWeight(0);
fill(213,216,20);
ellipse(150,80,20,40);
ellipse(130,110,15,30);
ellipse(360,90,20,30);
ellipse(150,260,20,40);
ellipse(170,280,10,20);
ellipse(350,250,15,30);
ellipse(320,270,20,30);

//ojos
strokeWeight(2);
fill(255,255,255);
ellipse(200,150,100,100);
ellipse(300,150,100,100);
fill(65,178,237);
strokeWeight(3);
ellipse(220,150,35,35);
ellipse(280,150,35,35);
fill(0,0,0);
strokeWeight(2);
ellipse(220,150,12.5,12.5);
ellipse(280,150,12.5,12.5);

//boca y dientes
strokeWeight(3);
noFill();
arc(250,200,200,75,0,PI);
strokeWeight(2);
fill(255,255,255);
quad(220,235.5,242.5,237,242.5,259.5,219,258);
quad(260,237,282.5,235.5,282.5,258,260,259.5);

//nariz
fill(254,255,44);
strokeWeight(2);
arc(250,175,25,30,PI-QUARTER_PI,TWO_PI+QUARTER_PI);

//cuerpo
strokeWeight(2);
stroke(0,0,0);
fill(255,255,255);
rect(125,300,250,75);
fill(191,132,13);
rect(125,335,250,40);
rect(175,375,50,20);
rect(275,375,50,20);
fill(0,0,0);
rect(140,345,35,7.5);
rect(190,345,35,7.5);
rect(275,345,35,7.5);
rect(325,345,35,7.5);
fill(255,255,255);
triangle(242.5,300,225,315,195,300);
triangle(262.5,300,280,315,310,300);

//corbata
fill(255,0,0);
beginShape();
vertex(237.5,300);
vertex(262.5,300);
vertex(257.5,310);
vertex(242.5,310);
endShape();
beginShape();
vertex(242.5,310);
vertex(257.5,310);
vertex(265,345);
vertex(250,360);
vertex(235,345);
endShape();

//piernas
fill(254,255,44);
rect(192.5,395,15,30);
rect(292.5,395,15,30);
//calcetines
fill(0,0,0);
rect(192.5,425,15,5);
rect(292.5,425,15,5);
fill(255,255,255);
rect(192.5,430,15,5);
rect(292.5,430,15,5);
fill(67,178,237);
rect(192.5,435,15,5);
rect(292.5,435,15,5);
fill(255,255,255);
rect(192.5,440,15,5);
rect(292.5,440,15,5);
fill(255,0,0);
rect(192.5,445,15,5);
rect(292.5,445,15,5);
fill(255,255,255);
rect(192.5,450,15,15);
rect(292.5,450,15,15);

//zapatos
noStroke();
fill(0,0,0);
rect(187.5,465,25,30);
rect(170,470,25,25);
arc(170,495,70,50,PI,TWO_PI);
rect(287.5,465,25,30);
rect(312.5,470,25,25);
arc(330.5,495,70,50,PI,TWO_PI);





