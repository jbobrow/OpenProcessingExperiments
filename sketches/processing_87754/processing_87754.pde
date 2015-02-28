
float x;
float y;
int b =0;

void setup() {
        size(400,400); 
        frameRate(30); 
        smooth(); 

x=width/2;
y=height/2;

}



void draw() {
 


        noStroke();


translate(x,y);


translate(-200,-200);



fill(70,70,0);
beginShape(); // patte droite 4
curveVertex(198.0, 298.0);
curveVertex(194.0, 170.0);
curveVertex(220.0, 21.0);
curveVertex(232.0, 123.0);
curveVertex(221.0, 298.0);
curveVertex(260.0, 315.0);
curveVertex(208.0, 309.0);
curveVertex(218.0, 223.0);
curveVertex(219.0, 51.0);
curveVertex(209.0, 170.0);
curveVertex(210.1311, -22.459656);
endShape();

fill(70,70,0);
beginShape(); // patte gauche 4
curveVertex(207.0, 303.0);
curveVertex(203.0, 175.0);
curveVertex(183.0, 26.0);
curveVertex(164.0, 136.0);
curveVertex(138.0, 281.0);
curveVertex(106.0, 279.0);
curveVertex(116.0, 289.0);
curveVertex(149.0, 293.0);
curveVertex(182.0, 57.0);
curveVertex(195.0, 171.0);
curveVertex(219.1311, -17.459656);
endShape();

fill(90,90,0);
beginShape(); //patte gauche 3
curveVertex(250.0, 305.0);
curveVertex(167.0, 181.0);
curveVertex(150.0, 107.0);
curveVertex(160.0, 27.0);
curveVertex(116.0, 112.0);
curveVertex(59.0, 282.0);
curveVertex(40.0, 300.0);
curveVertex(2, 250.0);
curveVertex(53.0, 268.0);
curveVertex(112.0, 82.0);
curveVertex(181.0, 2);
curveVertex(180.0, 175.0);
curveVertex(357.0, 367.0);
endShape();

fill(90,90,0);
beginShape(); // patte droite 3
curveVertex(127.0, 354.0);
curveVertex(200.0, 151.0);
curveVertex(287.0, 34.0);
curveVertex(302.0, 71.0);
curveVertex(290.0, 323.0);
curveVertex(340.0, 348.0);
curveVertex(276.0, 346.0);
curveVertex(283.0, 299.0);
curveVertex(283.0, 68.0);
curveVertex(204.0, 155.0);
curveVertex(264.1311, 4.540344);
endShape();







pushMatrix();
translate(445,415);
rotate(3);
fill(255);
ellipse(160,250,30,60); // oeil droit oreille
fill(255,10,10);
ellipse(148,255-mouseY/36,5,20);
fill(157,3,3);
ellipse(148,255-mouseY/36,3,10);
popMatrix();

pushMatrix();
translate(515,230);
rotate(15);
fill(255);
ellipse(160,250,30,40); // oeil droit coin supérieur

popMatrix();

pushMatrix();
translate(110,-110);
rotate(13);
ellipse(160,250,30,60); //oeil gauche oreille
fill(255,10,10);
ellipse(149,244+mouseY/29,7,20);
fill(157,3,3);
ellipse(148,244+mouseY/29,4,10);

popMatrix();

pushMatrix();
translate(290,-120);
rotate(1);
fill(255);
ellipse(160,250,30,40); //oeil gauche coin supérieur
popMatrix();


fill(175,175,0);
beginShape(); //tête
curveVertex(214.0, 90.0);
curveVertex(154.0, 146.0);
curveVertex(136.0, 258.0);
curveVertex(199.0, 290.0);
curveVertex(262.0, 261.0);
curveVertex(248.0, 160.0);
curveVertex(206.0, 127.0);
curveVertex(154.0, 146.0);
curveVertex(121.0, 195.0);
endShape();



for (int i = width/3; i >0 ; i=i -5){
noStroke();
fill(35,45,0,20);
ellipse (width/2, 225  ,i,i+10);


fill(255);
ellipse(175, 210,50,50); //oeil gauche
fill(255,10,10);
ellipse(163+mouseX/17, 202+mouseY/25,25,25);
fill(157,3,3);
ellipse(163+mouseX/17,202+mouseY/25,15,15);
fill(255);
ellipse(185,205,10,10);


fill(255);
ellipse(230,210,45,45); //oeil droit
fill(255,10,10);
ellipse(218+mouseX/17,202+mouseY/25,20,20);
fill(157,3,3);
ellipse(218+mouseX/17,202+mouseY/25,14,14);
fill(255);
ellipse(242,206,10,10);


fill(255);
ellipse(200,172,32,28);  //oeil front
fill(255,10,10);
ellipse(193+mouseX/24,165+mouseY/30,12,10);
fill(157,3,3);
ellipse(193+mouseX/24,165+mouseY/30,6,5);
fill(255);
ellipse(203,169,7,7);



fill(255);
ellipse(205,245,32,32);  //oeil nez
fill(255,10,10);
ellipse(197+mouseX/24,238+mouseY/28,12,12);
fill(157,3,3);
ellipse(197+mouseX/24,238+mouseY/28,6,6);
fill(255);
ellipse(211,239,8,8);


fill(255);
ellipse(200,140,55,30);  //oeil dessus tête
fill(255,10,10);
ellipse(195+mouseX/24,130,20,10);
fill(157,3,3);
ellipse(195+mouseX/24,128,10,5);
fill(255);
ellipse(207,135,9,9);

fill(255);
ellipse(200,282,55,30); //oeil menton
fill(255,10,10);
ellipse(192+mouseX/20,291,20,10);
fill(157,3,3);
ellipse(192+mouseX/20,294,10,5);

pushMatrix();
translate(400,415);
rotate(9);
fill(255);
ellipse(160,250,30,60); // oeil joue gauche
fill(255,10,10);
ellipse(170,255-mouseY/25,10,20);
fill(157,3,3);
ellipse(173,255-mouseY/25,5,10);
popMatrix();

pushMatrix();
translate(225,595);
rotate(10);
fill(255);
ellipse(163,295,30,60);  // oeil joue droit
fill(255,10,10);
ellipse(155,305-mouseY/20,10,20);
fill(157,3,3);
ellipse(153,305-mouseY/20,5,10);
fill(255);
ellipse(157,300,8,8);
popMatrix();


fill(110,110,0);
beginShape(); // patte droite 2
curveVertex(266.0, 308.0);
curveVertex(228.0, 155.0);
curveVertex(261.0, 14.0);
curveVertex(327.0, 255.0);
curveVertex(399.0, 266.0);
curveVertex(320.0, 284.0);
curveVertex(303.0, 226.0);
curveVertex(259.0, 34.0);
curveVertex(233.0, 149.0);
curveVertex(221.75995, 8.5354);
endShape();


fill(110,110,0);
beginShape(); //patte gauche 2
curveVertex(180.0, 323.0);
curveVertex(157.0, 170.0);
curveVertex(89.0, 101.0);
curveVertex(58.0, 67.0);
curveVertex(101.0, 170.0);
curveVertex(169.0, 322.0);
curveVertex(153.0, 344.0);
curveVertex(88.0, 337.0);
curveVertex(147.0, 315.0);
curveVertex(53.0, 105.0);
curveVertex(65.0, 47.0);
curveVertex(170.0, 150.0);
curveVertex(287.0, 385.0);
endShape();



fill(145,145,0);
beginShape(); // patte gauche 1
curveVertex(193.0, 98.0);
curveVertex(145.0, 357.0);
curveVertex(108.0, 77.0);
curveVertex(136.0, 133.0);
curveVertex(157.0, 185.0);
curveVertex(157.0, 140.0);
curveVertex(89.0, 37.0);
curveVertex(99.0, 225.0);
curveVertex(123.0, 351.0);
curveVertex(58.0, 378.0);
curveVertex(147.0, 363.0);
curveVertex(172.0, 213.0);
endShape();

fill(65,65,0);
beginShape(); //poil patte gauche
curveVertex(179.0, 258.0);
curveVertex(165.0, 210.0);
curveVertex(165.0, 187.0);
curveVertex(178.0, 205.0);
curveVertex(169.0, 180.0);
curveVertex(179.0, 188.0);
curveVertex(163.0, 154.0);
curveVertex(163.0, 169.0);
curveVertex(157.0, 180.0);
curveVertex(158.0, 180.0);
curveVertex(152.0, 177.0);
curveVertex(147.0, 172.0);
curveVertex(132.0, 209.0);
curveVertex(147.0, 190.0);
curveVertex(149.0, 213.0);
curveVertex(154.0, 194.0);
curveVertex(167.0, 212.0);
curveVertex(252.0, 285.0);
endShape();

fill(65,65,0);
beginShape(); // poil patte droite
curveVertex(240.0, 225.0);
curveVertex(242.0, 199.0);
curveVertex(243.0, 180.0);
curveVertex(256.0, 204.0);
curveVertex(251.0, 177.0);
curveVertex(265.0, 184.0);
curveVertex(246.0, 166.0);
curveVertex(245.0, 169.0);
curveVertex(238.0, 175.0);
curveVertex(236.0, 175.0);
curveVertex(232.0, 165.0);
curveVertex(234.0, 148.0);
curveVertex(210.0, 177.0);
curveVertex(225.0, 172.0);
curveVertex(223.0, 205.0);
curveVertex(231.0, 183.0);
curveVertex(244.0, 200.0);
curveVertex(334.0, 282.0);
endShape();

fill(145,145,0);
beginShape(); //patte droite
curveVertex(425.0, 384.0);
curveVertex(332.0, 390.0);
curveVertex(227.0, 393.0);
curveVertex(243.0, 337.0);
curveVertex(298.0, 71.0);
curveVertex(253.0, 142.0);
curveVertex(243.0, 174.0);
curveVertex(231.0, 169.0);
curveVertex(241.0, 133.0);
curveVertex(330.0, 20.0);
curveVertex(256.0, 344.0);
curveVertex(328.0, 390.0);
curveVertex(400.0, 390.0);
endShape();
fill(0);

 while ( b < width ){ 

fill(75,75,0);
beginShape();
beginShape();
curveVertex(b, 16.0);
curveVertex(b, 153.0);
curveVertex(165.0, 259.0);
curveVertex(200.0, 259.0);
curveVertex(b, 159.0);
curveVertex(283.0, 67.0);
endShape();


        b = b + 40; 
        
        
}

}
}



