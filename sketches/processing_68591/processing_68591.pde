
size(500,550);
background(153,217,234);

smooth();
noStroke();
fill(255,255,230);
arc(200,550,500,500,0,2*PI);//body

fill(255,127,39,200);
quad(0,390,80,325,80,420,0,550);//left arm

fill(255,127,39,200);
quad(300,400,370,370,455,550,360,550); 
triangle(365,360,430,440,455,550);//right arm

fill(70);
triangle(408,410,440,470,340,460);//right arm pattern
triangle(40,355,75,435,10,382);//left arm pattern

stroke(70);
strokeWeight(1);
fill(255,40,0);
bezier(410,330,80,670,0,400,98,305);//red
triangle(435,245,425,335,470,295);
triangle(435,415,425,335,485,355);
ellipse(420,340,60,45);

noStroke();
fill(255,255,230);
quad(60,160,280,70,430,310,130,435);//face
fill(255,127,39,200);
quad(252,84,286,82,210,250,120,210);//nose
fill(255,127,39,200);
triangle(309,115,429,308,320,220);//face-top right
fill(255,127,39,200);
triangle(247,84,288,84,280,68);//top edgy
fill(255,127,39,200);
triangle(59,160,110,138,81,250);//face-left
fill(255,127,39,200);
triangle(365,255,432,310,255,383);//face-bottom right

fill(70);
triangle(59,159,120,180,71,210);//dark pattern top left
triangle(86,260,110,250,97,310);//dark bottom left
triangle(320,357,350,345,270,290);//dark bottom right 
triangle(400,323,432,310,270,230);//dark middle right
triangle(363,200,337,160,290,200);//dark top right

fill(255,255,230);
ellipse(220,380,100,70);//chin
ellipse(160,406,100,70);
ellipse(140,360,90,70);

fill(70);
ellipse(202,76,50,50);//left ear
fill(255,255,230);
ellipse(205,82,30,40);//left ear inside
fill(70);
ellipse(320,87,50,50);//right ear
fill(255,255,230);
ellipse(314,94,35,40);//right ear inside

stroke(70);
fill(255,255,230);//nose
curve(218,9,250,82,120,210,14,166);//nose
curve(500,30,288,82,210,250,300,300);//nose

stroke(70);
strokeWeight(2);
noFill();
curve(170,230,190,135,155,135,100,270);//eyebrow left
curve(220,260,250,145,285,160,250,250);//eyebrow right

noStroke();
fill(89,90,146);
curve(0,350,120,210,210,250,210,370);//nose
curve(250,100,120,210,211,250,350,50);//nose

stroke(0);
strokeWeight(2);
noFill();
curve(210,300,210,260,340,205,350,290);//whiskers
curve(250,300,200,275,355,225,350,320);
curve(290,300,205,280,380,245,350,390);
curve(30,240,50,190,150,265,110,290);
curve(30,290,35,210,140,265,110,320);
curve(30,290,42,250,145,275,110,320);//whiskers

stroke(70);
noFill();
curve(150,0,265,250,170,257,100,-400);//mouth
curve(150,0,182,289,115,240,100,-200);
curve(50,150,181,288,140,340,10,200);
curve(90,90,250,292,140,340,0,0);//mouth

stroke(0);
strokeWeight(1);
fill(0);
ellipse(170,154,20,40);//eyes
fill(255,242,0);
ellipse(170,154,18,38);
fill(0);
ellipse(174,158,13,18);
fill(0);
ellipse(260,174,20,40);
fill(255,242,0);
ellipse(260,174,18,38);
fill(0);
ellipse(264,178,13,18);//eyes
