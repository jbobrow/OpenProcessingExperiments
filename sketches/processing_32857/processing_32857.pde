
background(217,240,246);
size(645, 710);
fill(39,34,2);
ellipse(0,550,100,400);

noFill();
strokeWeight(5); 
curve(350, 45, 400, 40, 400, -40, 390, -45); 

noFill();
strokeWeight(5); 
curve(290, 145, 350, 80, 340, -40, 250, -400); 

noFill();
strokeWeight(5); 
curve(350, 140, 270, 90, 280, -80, 390, -50);

noFill();
strokeWeight(5); 
curve(300, 100, 240, 30, 240, -30, 200, -100);


strokeWeight(5);
fill(220,75,12);
ellipse(645,200,128,200);//upper right


fill(217,240,246);
strokeWeight(5);
ellipseMode(CORNER);
ellipse(-50, -20, 200, 250);
ellipseMode(CENTER);

fill(55,40,2);
ellipse(148,204,100,70);//small black elipse

fill(220,75,12);
ellipse(168,210,40,40);//small orange elipse

fill(217,240,246);
ellipseMode(CORNER);
ellipse(0, 0, 00, 400);

fill(55,40,2);
triangle(182, 228, 189, 208, 217, 234);//triangle

fill(55,40,2);
ellipse(320,550,70,50);//small black elipse 2

fill(220,75,12);
ellipse(315,550,50,50);//small orange elipse 2

fill(55,40,2);
beginShape();
curveVertex(480,248); //C1
curveVertex(448,223); //V1
curveVertex(445,346); //V2
curveVertex(296,468); //V3
curveVertex(192,572);// V4
curveVertex(177,562);
curveVertex(159,559);
curveVertex(236,477);
curveVertex(419,346);
curveVertex(452,266);
curveVertex(453,190);
endShape(CLOSE);

fill(55,40,2);
beginShape();
curveVertex(394,225); //C1
curveVertex(388,225); //V1
curveVertex(387,298); //V2
curveVertex(213,449);
curveVertex(152,495);
curveVertex(131,468);
curveVertex(101,466);
curveVertex(177,419);
curveVertex(264,387);
curveVertex(333,334);
curveVertex(370,282);
curveVertex(388,196);
curveVertex(384,165);
endShape(CLOSE);


fill(55,40,2);
beginShape();
curveVertex(361,88); 
curveVertex(343,69); 
curveVertex(344,131); 
curveVertex(336,168); 
curveVertex(299,220);
curveVertex(103,374);
curveVertex(65,375);
curveVertex(111,332);
curveVertex(175,289);
curveVertex(236,240);
curveVertex(313,162);
curveVertex(337,102);
curveVertex(328,48);
curveVertex(326,6.5);
endShape(CLOSE);

fill(220,75,12);
ellipseMode(CORNER);
ellipse(520, 590, 250, 520);

noFill();
strokeWeight(5); 
curve(200, 500, 350, 500, 346, 680, 200, 900); 

noFill();
strokeWeight(5); 
curve(5, 346, 346, 680, -400, 340, 50, 20);

line(310,674,310,750);

PFont myFont;
PFont myFont2;
fill(220,200,22);
myFont = createFont("Helvetica",32,true);
 textFont (myFont);
  text("I am a",20,100);
  text("bird",22,140);
  text("waiting for better code",290,500);
  
  

