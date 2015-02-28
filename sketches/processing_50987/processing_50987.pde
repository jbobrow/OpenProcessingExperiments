
size(400,400);
background(255,255,255);

smooth();

strokeWeight(3); 

//corps
fill(10,27,201);
beginShape();
curveVertex(235,75);
curveVertex(345,285);
curveVertex(200,360);
curveVertex(55,285);
curveVertex(165,75);
curveVertex(235,75);
curveVertex(345,285);
curveVertex(200,360);
endShape(CLOSE);

// médaille

strokeWeight(0); 
fill(237,183,2);
beginShape();
vertex(250,170);
vertex(280,182);
vertex(260,200);
vertex(240,200);
vertex(220,182);
endShape(CLOSE);

//ceinture
strokeWeight(10);
fill(0,0,0);
line(343,280, 57,280);
line(343,290, 57,290);

stroke(237,183,2);
line(190,285,210,285);

strokeWeight(3);
stroke(0,0,0);

//chemise
fill(44,136,232);
triangle(165,75,235,75,200,230);

//cravate
fill(0,0,0);
strokeWeight(0);
triangle(170,80,230,80,200,160);
triangle(190,190,210,190,200,150);
triangle(190,190,210,190,200,200);

//Bras droit
strokeWeight(3);
fill(10,27,201);
beginShape();
vertex(275,135);
vertex(300,130);
vertex(305,150);
vertex(285,155);
endShape(CLOSE);

//                                         main droite SPRAY
fill(231,98,232);
ellipse(324,135,50,50);
// main vide: line(305,127, 324,160);
// main vide: line(305,127, 324,120);

//push finguer
ellipse(324,105,20,30);
//ARME SPRAY
fill(98,98,98);
quad(310,115,340,115, 340,170, 310,170);

//                                         piton spray
strokeWeight(3);
fill(250,250,250);
quad(320,102,320,115,330,115, 330,102 );
strokeWeight(5);
stroke(256,0,0);
point(325,109);

//                                          pepper
strokeWeight(1);
stroke(131,11,0);
line(325,109,380,95);
line(325,109,390,100);
line(325,109,395,107);
line(325,109,390,114);
line(325,109,380,119);
strokeWeight(3);
stroke(0,0,0);

//                                          main par dessu arme spray
fill(231,98,232);
quad(305,127,350,120, 350,157, 324,160);


//Bras Gauche
fill(10,27,201);
beginShape();
vertex(125,135);
vertex(100,130);
vertex(95,150);
vertex(115,155);
endShape(CLOSE);


//main gauche
fill(231,98,232);
ellipse(76,135,50,50);
line(95,127, 76,160);
line(95,127, 76,120);

//face
strokeWeight(3);
stroke(0,0,0);
fill(231,98,232);
arc(200,70, 170,150, 0-1, PI+1);

//oreilles
line(155,6, 168,30);
line(245,6, 232,30);

//point rouceur
strokeWeight(10); 
stroke(100,15,113);
point(270,75);
point(130,75);

strokeWeight(6);
point(250,78);
point(150,78);

point(260,89);
point(140,89);

//yeux
stroke(0,0,0);
strokeWeight(3); 
fill(255,255,255);
arc(235,55, 50,30, 0, PI);
arc(165,55, 50,30, 0, PI);

fill(0,0,0);
arc(235,55, 20,15, 0, PI);
arc(165,55, 20,15, 0, PI);

//nez
fill(231,98,232);
ellipse(200, 100, 100, 70);

strokeWeight(0);  

fill(100,15,113);
ellipse(220,100, 30,50);
ellipse(180,100, 30,50);

fill(0,0,0);
ellipse(217,100, 27,40);
ellipse(183,100, 27,40);

strokeWeight(3); 

//Chapeau textile
fill(10,27,201);
beginShape();
vertex(200,20);
vertex(280,40);
vertex(270,50);
vertex(130,50);
vertex(120,40);
endShape(CLOSE);

//Chapeau calotte
fill(48,48,49);
beginShape();
vertex(280,50);
vertex(200,65);
vertex(120,50);
endShape(CLOSE);

//Chapeau médaille

strokeWeight(0); 
fill(237,183,2);
beginShape();
vertex(200,26);
vertex(230,32);
vertex(200,45);
vertex(170,32);

endShape(CLOSE);
strokeWeight(3); 


//Bottes Gauche
strokeWeight(10); 
fill(0,0,0);
arc(130,370, 80,90,PI,TWO_PI);
line(85,368,175,368);
point(105,370);
point(120,370);
point(135,370);
point(150,370);

//Bottes Droite
strokeWeight(10); 
arc(270,370, 80,90,PI,TWO_PI);
point(295,370);
point(280,370);
point(265,370);
point(250,370);
line(315,368,225,368);

//Matraque
fill(10,27,201,0);
line(75,325, 75, 220);
line(75,250,50,250);

//menottes
strokeWeight(6);
ellipse(300,300,40,40);
ellipse(310,300,40,40);





               
