
size(600,440);
background(240);

//Wheel
fill(20);
ellipse(310,375,120,120);
fill(200);
stroke(255);
ellipse(310,375,80,80);

//Body
fill(200);
stroke(0);
beginShape();
vertex(260,140);
vertex(340,140);
vertex(380,180);
vertex(380,280);
vertex(260,280);
endShape(CLOSE);

fill(100);
rect(265,145,5,130);
rect(275,145,5,130);

//Head
fill(200);
rect(300,120,20,20);
rect(295,80,50,40);
rect(335,70,5,10);
line(337,50,337,70);
ellipse(310,100,55,55);
fill(20);
ellipse(310,100,45,45);
fill(255);
ellipse(322,100,12,24);

//Leg
fill(200);
rect(300,280,20,90);
rect(295,300,30,60);
ellipse(310,375,25,25);

