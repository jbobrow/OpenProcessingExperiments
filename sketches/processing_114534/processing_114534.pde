
/*@pjs preload="sozai.png";*/

PImage img;
img = loadImage("sozai.png");
 
size(400, 400); 
background(0, 150,150);   

stroke(120,0,0);
strokeWeight(1);
line(5,55,25,25);
line(5,345,25,375);
line(35,25,75,55);
line(35,375,75,345);
line(85,55,115,25);
line(85,345,115,375);
line(125,25,155,55);
line(125,375,155,345);
line(165,55,195,25);
line(165,345,195,375);
line(205,25,235,55);
line(205,375,235,345);
line(245,55,275,25);
line(245,345,275,375);
line(285,25,315,55);
line(285,375,315,345);
line(325,55,355,25);
line(325,345,355,375);
line(365,25,395,55);
line(365,375,395,345);

stroke(255,255,0); 
strokeWeight(2); 
line(0, 20, 400, 20);  
line(0, 380, 400, 380);

strokeWeight(5) ; 
point (80, 30) ;
point (160, 30) ; 
point (240, 30) ;
point (320, 30) ;

point (80, 370) ;
point (160, 370) ;
point (240, 370) ;
point (320, 370) ;

stroke(220,220,0);
strokeWeight(3);
line(0, 40, 400, 40);
line(0, 360, 400, 360);

strokeWeight(5) ; 
point (40, 50) ;
point (120, 50) ; 
point (200, 50) ;
point (280, 50) ;
point (360, 50) ;

point (30, 350) ;
point (120, 350) ;
point (200, 350) ;
point (280, 350) ;
point (360, 350) ;


stroke(175,175,0);
strokeWeight(5);
line(0, 60, 400, 60);
line(0, 340, 400,340);

noStroke();
fill(0,100, 150);
rectMode(CENTER);
rect(80, 300, 50, 50);
rect(160, 300, 25, 25);
rect(240, 300, 25, 25);
rect(320, 300, 50, 50);
rect(80, 100, 50, 50);
rect(160, 100, 25, 25);
rect(240, 100, 25, 25);
rect(320, 100, 50, 50);

fill(0,150, 200);
rect(80, 300, 40, 40);
rect(160, 300, 15, 15);
rect(240, 300, 15, 15);
rect(320, 300, 40, 40);
rect(80, 100, 40, 40);
rect(160, 100, 15, 15);
rect(240, 100, 15, 15);
rect(320, 100, 40, 40);

fill(0,100, 150);
rect(80, 300, 30, 30);
rect(160, 300, 5, 5);
rect(240, 300, 5, 5);
rect(320, 300, 30, 30);
rect(80, 100, 30, 30);
rect(160, 100, 5, 5);
rect(240, 100, 5, 5);
rect(320, 100, 30, 30);

fill(0,150, 200);
rect(80, 300, 20, 20);
rect(320, 300, 20, 20);
rect(80, 100, 20, 20);
rect(320, 100, 20, 20);



stroke(150,150,0);
strokeWeight(4);
line(20, 250, 380, 250);
line(20, 150, 380, 150);



imageMode(CENTER);
tint(0, 17, 33);
image(img, 200, 200, 100, 100);

noStroke();
fill(#054967);
ellipseMode(CENTER);
ellipse(120,200,40,40);
ellipse(280,200,40,40);
fill(#24627c);
ellipse(80,220,30,30);
ellipse(320,180,30,30);
fill(#65adcb);
ellipse(40,200,20,20);
ellipse(360,200,20,20);


