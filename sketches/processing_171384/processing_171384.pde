
 //安定//
int eSize=300;

size(600,300);
colorMode(RGB);
background(0);
smooth();

rect(300, 0, 600, 300);
fill(255);                            //背景色　

stroke(190, 190, 190); 
fill(190, 190, 190);                     //円、線=灰色

ellipse(150, 150, 15, 15);

ellipse(150, 25, 12, 12);
ellipse(150, eSize-25, 12, 12);
ellipse(25, 150, 12, 12);
ellipse(eSize-25, 150, 12, 12);

ellipse(90, 50, 7, 7);
ellipse(50, 90, 7, 7);
ellipse(eSize-90, eSize-50, 7, 7);
ellipse(eSize-50, eSize-90, 7, 7);

ellipse(90, 250, 7, 7);
ellipse(50, 210, 7, 7);
ellipse(eSize-90, eSize-250, 7, 7);
ellipse(eSize-50, eSize-210, 7, 7);         //円

strokeWeight(7);
line(150, 65, 150, 150);
strokeWeight(3);
line(55, 180, 150, 150);                      //線

textSize(45);
textAlign(CENTER);
fill(190, 190, 190);
text("Clock", 150, 220);                    //文字「Clock

 //変動//
stroke(190, 190, 190); 
fill(190, 190, 190);                        

ellipse(430, 130, 15, 15);

ellipse(380, 25, 12, 12);
ellipse(485, eSize-45, 12, 12);
ellipse(345, 165, 12, 12);
ellipse(545, 95, 12, 12);

ellipse(365, 65, 7, 7);
ellipse(350, 120, 7, 7);
ellipse(535, eSize-90, 7, 7);
ellipse(545, eSize-150, 7, 7);

ellipse(430, 250, 7, 7);
ellipse(375, 210, 7, 7);
ellipse(455, eSize-270, 7, 7);
ellipse(505, eSize-235, 7, 7);

strokeWeight(1);
stroke(190, 190, 190); 
line(300, 0, 300, 300);

strokeWeight(7);
line(430, 130, 410, 110);
line(410, 110, 425, 80);
line(425, 80, 385, 65);
line(385, 65, 395, 45);
strokeWeight(3);
line(430, 130, 440, 160);
line(440, 160, 455, 155);
line(455, 155, 425, 190);
line(425, 190, 450, 230);

textSize(85);
fill(190, 190, 190);
text("C", 325, 270);

textSize(30);
text("l", 390, 185);

textSize(75);
text("o", 435, 105);

textSize(55);

text("c", 380, 85);

textSize(90);
text("k", 475, 220);


