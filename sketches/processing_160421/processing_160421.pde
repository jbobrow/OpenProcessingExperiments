
size(600, 600);
background(255);

//diagonal bars//
noStroke();
fill(255, 198, 82, 100);
beginShape();
vertex(600, 0);
vertex(550, 0);
vertex(-100, 600);
vertex(120, 600);
endShape(CLOSE);

fill(82, 98, 255, 99);
beginShape();
vertex(85, 0);
vertex(170, 0);
vertex(800, 550);
vertex(630, 590);
endShape(CLOSE);

//circles//

noStroke();
fill(255,243,134,130);
ellipse(370,435,10,10);  //lightyellowsmall

noFill();
stroke(0);
strokeWeight(25);
ellipse(300, 300, 500, 500);

strokeWeight(1);
stroke(0, 99);
fill(77, 77, 77, 230);
ellipse(300, 330, 150, 150);  //black

fill(104, 139, 124,210);
ellipse(390, 300, 110, 110);  //aqua

fill(255, 239, 95,99);
ellipse(250, 350, 110, 110);  //yellow

fill(255,72,72,99);
ellipse(310, 250, 80, 80);  //red

fill(255,243,134,130);
ellipse(380,375,80,80);  //lightyellow

fill(43,90,147,99);
ellipse(250,282,60,60);  //blue

fill(237,113,202,99);
ellipse(255,210,110,110);  //pink

fill(138,63,201,150);
ellipse(390,210,50,50);  //purple

fill(66,94,203,150);
ellipse(435,300,45,45);   //blue2

fill(255,118,39,150);
ellipse(180,450,40,40);  //orange

fill(255,72,72,190);
ellipse(308,360,15,15);  //reddd

noStroke();
fill(255,243,134,130);
ellipse(370,435,10,10);  //lightyellowsmall


stroke(0);
strokeWeight(1);
fill(255,72,72,210);
ellipse(250,400, 50, 50);  //red

fill(237,113,202,99);
ellipse(350,480,25,25); //pink

fill(138,63,201,200);
ellipse(450,420,20,20);  //purple2

fill(255,72,72,210);
ellipse(300,415,10,10); //redddd


strokeWeight(2);
stroke(0,255);
fill(255,118,39,150);
ellipse(300,300,55,55);  //orange

fill(43,90,147,99);
ellipse(195,355,35,35);  //blue3

fill(43,55,100);
ellipse(130,340,12,12);  //blue4

fill(255,118,39);
ellipse(300,90,10,10);  //orangeee


strokeWeight(5);
fill(255,72,72);
ellipse(150,290,25,25); //red


fill(0);
ellipse(300,300,15,15);  //black
ellipse(405,400,20,20);  
ellipse(355,230,30,30);
ellipse(390,280,20,20);
ellipse(280,440,5,5);

//vertical lines//

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

//horizontal lines//

strokeWeight(1);
line(100,310,500,360);
line(180,180,480,220);
line(410,270,445,270);
line(410,280,450,280);

strokeWeight(0.5);
line(220,150,480,350);
line(100,250,480,330);
line(100,256,480,336);
line(120,380,480,400);
line(120,360,460,450);

//diagonal lines//

strokeWeight(1);
line(300,150,350,170);
line(300,157,350,177);
line(180,420,240,470);
line(160,460,260,420);

strokeWeight(0.5);
line(350,460,420,430);
line(350,470,420,440);
line(350,480,420,450);
line(130,250,120,280);
line(120,250,115,280);
line(180,260,175,300);


