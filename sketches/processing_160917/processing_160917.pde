
size(600, 600);
background(255);

//Background
noStroke();
fill(250,190,80, 100);
rect(0,0,600, 600);


//Diagonal Bar (Yellow)
noStroke();
fill(250, 190, 80,100);
beginShape();
vertex(580, 0);
vertex(530, 0);
vertex(-150, 600);
vertex(90, 600);
endShape(CLOSE);
 
//Diagonal Bar (Green)
fill(50, 140, 120,120);
beginShape();
vertex(40, 0);
vertex(150, 0);
vertex(800, 550);
vertex(620, 580);
endShape(CLOSE);
 

//Orange Circle
stroke(0); 
strokeWeight(2);
fill(225,90,30,130);
ellipse(380,430,20,20); 

//Orange2 
fill(250,115,35,150);
ellipse(150,420,30,30);

//Orange3 
strokeWeight(3);
fill(210,80,50);
ellipse(300,140,20,20); 

//Big Black Circle 
noFill();
stroke(0);
strokeWeight(27);
ellipse(300, 300, 480, 480);

//Grey Circle in the Middle 
strokeWeight(1);
stroke(0, 99);
fill(90, 90, 90, 180);
ellipse(280, 330, 150, 150);  

//Yellow1
fill(225,190,80, 100);
ellipse(390, 300, 115, 115);

//Yellow2
strokeWeight(2); 
fill(225, 200, 95,190);
ellipse(220, 350, 110, 110);  

//Yellow3
strokeWeight(2);
stroke(0);
noFill();
ellipse(360,375,80,80); 
fill(180,160,0,130);
ellipse(360,375,80,80);  

//Yellow4
strokeWeight(1);
fill(255,240,0,130);
ellipse(365,430,15,15);  

//Red1
fill(210,50,70,150);
ellipse(310, 250, 80, 80);  
 
//Red2 
fill(165,40,40,190);
ellipse(280,355,25,25);
 
//Red3
stroke(0);
strokeWeight(2);
fill(190,50,50,150);
ellipse(250,400, 50, 50);


//Red4 
fill(255,70,70);
ellipse(300,410,15,15);

//Red5
strokeWeight(7);
fill(190,60,60);
ellipse(150,280,25,25);


strokeWeight(2);


//Blue1
fill(45,90,150,90);
ellipse(230,285,65,65);

//Blue2
fill(43,55,100);
ellipse(110,330,20,20);
 
//Pink1 
fill(237,113,202,99);
ellipse(255,225,110,110);

//Purple1 
fill(140,30,200,150);
ellipse(380,195,50,50);
 
//Purple2
fill(120,80,110);
ellipse(320,480,30,30);

//Green 
fill(35,140,35,130);
ellipse(435,300,45,45); 

//Brown
fill(205,175,150);
ellipse(460,390,20,20);


//Orange4 
strokeWeight(4);
stroke(0,255);
fill(255,120,40,150);
ellipse(270,315,55,55);
 
//Blue3 
fill(45,90,150,100);
ellipse(195,355,35,35);

//Black 
fill(0);
ellipse(270,315,15,15);
ellipse(395,400,30,30); 
ellipse(355,230,30,30);
ellipse(395,265,20,20);
ellipse(280,435,10,10);
 
//Vertical Lines
 
strokeWeight(1);
line(410,150,200,480);
line(410,180,380,480);
line(330,150,160,400);
line(280,180,150,340);
line(420,250,425,450);
 
strokeWeight(0.5);
line(350,230,180,450);
line(350,230,175,440);
line(406,180,376,480);
line(414,180,384,480);
 
//Horizontal Lines
 
strokeWeight(2);
line(80,300,480,380);
line(410,240,445,240);
line(410,250,450,250);
 
strokeWeight(1);
line(150,180,490,200);
 
strokeWeight(0.5);
line(220,150,480,350);
line(100,250,480,330);
line(100,256,480,336);
line(120,380,480,400);
line(120,360,460,450);
 
//diagonal lines//
 
strokeWeight(1.5);
line(300,150,350,170);
line(300,157,350,180);
line(170,425,270,480);
line(160,460,295,445);
 
strokeWeight(0.5);
line(350,460,420,430);
line(350,470,420,440);
line(355,480,415,450);
line(130,250,120,280);
line(120,250,115,280);
line(170,260,160,300);

