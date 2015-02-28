
background(250);
size(600,600);
smooth();

strokeWeight(25);
noFill();
stroke(240);
ellipse(300,200,580,580);
strokeWeight(10);
stroke(240);
ellipse(300,200,530,530);
strokeWeight(2);
stroke(240);
ellipse(300,200,650,650);
strokeWeight(5);
stroke(240);
ellipse(300,200,660,660);
strokeWeight(2);
stroke(240);
ellipse(300,200,510,510);

/*man dui background line bubun*/
//right//
int a = 600;
stroke(220);
strokeWeight(5);
line(100,0,a,380);
stroke(220);
strokeWeight(2);
line(70,0,a,380);
stroke(220);
strokeWeight(1);
line(50,0,a,380);
stroke(220);
strokeWeight(1);
line(35,0,a,380);
stroke(220);
strokeWeight(1);
line(40,0,a,360);

//left, stroke weight soon//

stroke(223);
strokeWeight(10);
line(0,380,a,150);
strokeWeight(2);
line(0,330,a,40);
line(0,337,a,50);
strokeWeight(1);
line(0,345,a,30);
line(0,330,a,60);
stroke(220);
line(0,350,a,50);
stroke(220);
line(0,335,a,40);
stroke(220);
line(0,360,a,180);
line(0,363,a,175);
line(0,337,a,50);
line(0,360,a,70);

stroke(220);
line(0,363,a,90);

line(0,320,a,63);
line(0,320,a,130);
line(0,322,a,110);
line(0,312,a,115);
line(0,324,a,65);
line(0,324,a,65);
line(0,400,a,150);

stroke(220);
line(0,270,a,120);

stroke(220);
line(0,330,a,110);
strokeWeight(1);
line(0,290,600,80);

//under central rect//
stroke(220);
strokeWeight(5);
noFill();
ellipse(460,360,250,250);
strokeWeight(2);
ellipse(450,350,230,230);
strokeWeight(1);
ellipse(445,345,210,210);


//under rect bubun//
int b = 80;
int c = 20;
int d = 30;
fill(190);
noStroke();
rect(0,450,600,150);
fill(180);
rect(0,460,80,20);
rect(c,460+d,80,20);
rect(c+c,460+d+d,80,20);
rect(c+c+c,460+d+d+d,80,20);
rect(c+c+c+c,460+d+d+d+d,80,20);

rect(110,460,80,20);
rect(110+c,460+d,80,20);
rect(110+c+c,460+d+d,80,20);
rect(110+c+c+c,460+d+d+d,80,20);
rect(110+c+c+c+c,460+d+d+d+d,80,20);

rect(220,460,80,20);
rect(220+c,460+d,80,20);
rect(220+c+c,460+d+d,80,20);
rect(220+c+c+c,460+d+d+d,80,20);
rect(220+c+c+c+c,460+d+d+d+d,80,20);

rect(330,460,80,20);
rect(330+c,460+d,80,20);
rect(330+c+c,460+d+d,80,20);
rect(330+c+c+c,460+d+d+d,80,20);
rect(330+c+c+c+c,460+d+d+d+d,80,20);

rect(440,460,80,20);
rect(440+c,460+d,80,20);
rect(440+c+c,460+d+d,80,20);
rect(440+c+c+c,460+d+d+d,80,20);
rect(440+c+c+c+c,460+d+d+d+d,80,20);

//under side rect//
rect(550,460,80,20);
rect(550+c,460+d,80,20);
rect(550+c+c,460+d+d,80,20);

rect(0,460+d+d,10,20);
rect(0,460+d+d+d,30,20);
rect(0,460+d+d+d+d,50,20);

/*central rect bubun*/

stroke(150);
strokeWeight(8);
fill(100);
rect(160,60,280,280);

noStroke();
fill(255);
rect(200,100,200,200);

//side rect//
fill(230);
stroke(100);
strokeWeight(13);
quad(480,160,550,140,550,400,480,380);

fill(230);
stroke(180);
strokeWeight(13);
quad(50,140,120,160,120,380,50,400);

//upper cross//
noFill();
strokeWeight(1);
stroke(235);
ellipse(300,200,70,70);
ellipse(300,200,80,80);
ellipse(300,200,100,100);
ellipse(300,200,105,105);
ellipse(300,200,107,107);
ellipse(300,200,115,115);
ellipse(300,200,125,125);
ellipse(300,200,180,180);
ellipse(300,200,175,175);
strokeWeight(2);
triangle(300,110,380,240,220,240);
triangle(300,290,220,160,380,160);

//cross//
fill(0);
noStroke();
rect(280,120,40,160);
rect(220,180,160,40);

fill(190);
quad(80,32,100,43,100,137,80,130);
quad(53,50,125,80,125,100,53,70);

noFill();
strokeWeight(2);
stroke(200);
triangle(510,40,540,105,498,125);
triangle(490,70,532,50,519,135);
ellipse(515,88,54,95);
strokeWeight(1);
ellipse(515,88,59,100);

//picture in square//
noStroke();
fill(130);
triangle(495,195,515,205,490,330);
fill(180);
triangle(505,210,520,320,500,340);

strokeCap(SQUARE);
stroke(160);
line(80,250,100,320);

stroke(200);
strokeWeight(4);
line(100,235,90,370);

stroke(180);
strokeWeight(6);
line(100,205,70,300);

//under picture//
noStroke();
fill(180);
rect(220,360,160,25);
fill(200);
rect(240,400,120,20);
fill(220);
rect(260,430,80,15);



