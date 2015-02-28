
size(600,600);
background(100,50,200);
strokeWeight(2);

fill(255,255,0);
//body
rect(200,170,200,170);
strokeWeight(2);
 fill(121,84,50);
 //pants
rect(200,335,200,40);
strokeWeight(1);
fill(0);
//belt
rect(205,342,30,10);
rect(245,342,30,10);
rect(285,342,30,10);
rect(325,342,30,10);
rect(365,342,30,10);
fill(255,255,255);
//eyes
ellipse(270,220,50,50);
ellipse(320,220,50,50);
fill(255,255,0);
//arm left
ellipse(140,270,100,20);
ellipse(450,270,100,20);
fill(255,255,255);
//sleeves 
rect(185,260,15,25);
rect(400,260,15,25);
fill(66,250,227);
//pupils
ellipse(274,220,25,25);
ellipse(324,220,25,25);
fill(255,255,0);
ellipse(295,270,20,70);
rect(240,375,20,100);
rect(340,375,20,100);
fill(0,0,0);
ellipse(273,220,10,10);
ellipse(323,220,10,10);
arc(300, 305, 80, 60, 0, PI+QUARTER_PI, OPEN);

for (int i=0; i<22;i++){
  point(random(200,170), random(200,170));
}


