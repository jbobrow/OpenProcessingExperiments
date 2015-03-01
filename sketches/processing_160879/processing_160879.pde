

size (600, 600); 


background (119, 183, 228);  


smooth(); 


  


//blauer Kreis 


fill (60, 125, 144); 


noStroke(); 


ellipse (445, 58, 45, 45); 


//schwarzer ring 


noFill(); 


stroke(0); 


strokeWeight(4.5); 


ellipse (545, 58, 60, 60); 


  


//gerade linien 


stroke(0); 


strokeWeight(2); 


line(180, 100, 435, 325); 


line(280, 288, 397, 66); 


//line(285, 288, 390, 242); 


line(380,227,405,550); 


  


//kleiner Zusatz an der Zickzacklinie 


beginShape(); 


vertex(260,302); 


vertex(262,304); 


vertex(279,297); 


endShape(); 


  


//kleines"Schlosszeichen" 


line(411,203,429,215); 


bezier(411,210,421,190,435,205,424,218); 


  


  


  


  


//zickzacklinie 


beginShape(); 


vertex(260,302); 


vertex(278,294); 


vertex(295,360); 


vertex(376,330); 


vertex(382,358); 


vertex(400,356); 


vertex(440,386); 


endShape(); 


  


stroke(0); 


strokeWeight(5); 


line(375, 68, 420, 25); 


  


//drei kleine Punkte 


fill(0); 


ellipse(320, 520,6, 6); 


ellipse(280, 550, 6, 6); 


ellipse(400, 530, 6, 6); 


  


//raute 


noStroke(); 


beginShape(); 


vertex(405,255);//links 


vertex(418,241);//oben 


vertex(434,257);//rechts 


vertex(420,270);//unten 


vertex(405,255);//links 


endShape(); 


  


//geschwungene linien 


noFill(); 


stroke(0); 


strokeWeight(2); 


bezier(160, 150, 240, 130, 330, 150, 385, 200); 


bezier(360, 245, 400, 245, 430, 300, 425, 340); 


  


bezier(40, 235, 225, 140, 310, 100, 427, 68); 


bezier(55, 270, 210, 155, 350, 100, 414, 75); 


  


//oberes dreieck 


beginShape(); 


vertex(415, 117);//unten 


vertex(430, 100);//oben rechts 


bezierVertex(420, 97, 330, 87, 300, 90);//oben links 


bezierVertex(320, 100, 350, 107, 415, 117);//unten 


//bezierVertex(259, 300); 


vertex(415, 117);//unten 


endShape(); 


  


//oberes dreieck-rotes feld 


fill(171, 53, 13); 


beginShape(); 


vertex(430, 100);//oben rechts 


vertex(415, 117);//unten rechts 


vertex(381, 111);//unten links 


vertex(395, 95);//oben links 


vertex(430, 100);//oben rechts 


endShape(); 


  


//wellenlinie 


noFill(); 


beginShape(); 


curveVertex(380, 185); 


curveVertex(380, 185); 


curveVertex(340, 138); 


curveVertex(330, 94); 


curveVertex(357, 70); 


curveVertex(358, 35); 


curveVertex(372, 20); 


curveVertex(372, 20); 


endShape(); 


  


  


//brauner kreis (weißes und rotes kreissegment weiter unten) 


noStroke(); 


fill(81, 44, 25); 


ellipse(175, 330, 180, 180); 


  


//weißes kreissegment (rotes kreissegment ist am ende) 


fill(229, 213, 188);  


noStroke(); 


beginShape(); 


vertex(190, 330); 


bezierVertex(170, 235, 215, 255, 262, 300); 


bezierVertex(230, 212, 142, 244, 150, 243); 


bezierVertex(140, 245, 143, 320, 152, 322); 


vertex(190, 330); 


endShape(); 


  


//schachbrett 


stroke(0); 


strokeWeight(2.5); 


rect(50, 300, 80, 60); 


//schwarze kästen 


noStroke(); 


fill(0); 


rect(50, 300, 20, 20); 


rect(90, 300, 20, 20); 


rect(70, 320, 20, 20); 


rect(110, 320, 20, 20); 


rect(50, 340, 20, 20); 


rect(90, 340, 20, 20); 


//weiße kästen 


fill(229, 213, 188);  


rect(70, 301, 20, 19); 


rect(110, 301, 20, 20); 


rect(51, 320, 19, 20); 


rect(90, 320, 20, 20); 


rect(70, 340, 20, 20); 


rect(110, 340, 20, 20); 


  


  


//leiter 


stroke(0); 


strokeWeight(1.5); 


line(350, 500, 488, 240); 


line(380, 500, 495, 240); 


line(366, 430, 420, 450); 


line(376, 405, 430, 425); 


line(390, 388, 435, 405); 


line(400, 368, 443, 385); 


line(415, 348, 458, 365); 


line(425, 328, 468, 345); 


line(435, 313, 470, 327); 


line(445, 299, 478, 312); 


line(455,284,484, 296); 


line(460, 268, 489, 280); 


  


//dreieckstrich mit weißem feld 


noStroke(); 


fill(0); 


triangle(35, 457, 43, 464, 415, 55); 


  


//weißes feld auf dreieckstrich 


fill(229, 213, 188); 


beginShape(); 


vertex(103, 385);//unten links 


vertex(109, 392);//unten rechts 


vertex(221.5, 268);//oben rechts 


vertex(215, 265);//oben links 


endShape(); 


  


//linien auf braunem kreis 


stroke(0); 


strokeWeight(2); 


line(459,323,485,294);//schwarz auf dreieckstrick links 


line(470,325,486,307);//schwarz auf dreieckstrick rechts 


  


stroke(229, 213, 188); 


line(520,325,560,303);//weiß oben 


line(560,414,561,309);//weiß mitte 


  


  


//rotes kreissegment 


fill(171, 53, 13); 


noStroke(); 


beginShape(); 


vertex(260, 300);//unten 


vertex(280, 288);//unten rechts 


bezierVertex(225, 185, 160, 230, 150, 243);//oben links 


bezierVertex(185, 238, 235, 235, 260, 300);//unten 


vertex(260, 300);//unten 


endShape(); 


  


//trapezform miet blau und rot 


noFill(); 


stroke(0); 


beginShape(); 


vertex(280, 288); 


vertex(430,500); 


vertex(420,507); 


vertex(260,303); 


endShape(); 


  


//blaue kästchen 


fill (60, 125, 144); 


beginShape(); 


vertex(341,406); 


vertex(355,395); 


vertex(368,413); 


vertex(355,423); 


endShape(); 


  


beginShape(); 


vertex(369,440); 


vertex(381,431); 


vertex(397,453); 


vertex(385,462); 


endShape(); 


  


//rotes Kästchen 


fill(171, 53, 13); 


beginShape(); 


vertex(411,473); 


vertex(430,500); 


vertex(420,507); 


vertex(400,481); 


vertex(411,473); 


endShape(); 


