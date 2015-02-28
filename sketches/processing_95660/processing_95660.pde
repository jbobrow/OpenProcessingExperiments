

{size(600,600);
smooth();
background(255);

float x,y;
float Diameter;
float Color;

for(int i=0;i<100;i=i+1)
{
 x=random(0,width);
 y=random(0,height);

Diameter=random(0,100);
Color=random(10,100);

strokeWeight(0.5);
fill(Color,150,200,200);
ellipse(x,y,Diameter,Diameter);
}
}

noStroke();

fill(237,255,0);
stroke(152,157,19);
strokeWeight(2);
rect(230,200,150,140);

stroke(0,0,0);
strokeWeight(1.25);
fill(93,60,40);
rect(230,340,150,55);

fill(255,255,255);
rect(230,340,150,22);

fill(93,60,40);
rect(250,395,40,15);
rect(320,395,40,15);

//pierna2
stroke(152,157,19);
strokeWeight(1.25);
fill(237,255,0);
rect(335,410,10,60);
stroke(0,0,0);
fill(255,255,255);
rect(335,430,10,40);
noStroke();
fill(18,174,250);
rect(336,435,9,2);
noStroke();
fill(250,3,19);
rect(336,438,9,2);
fill(0,0,0);
ellipse(340,475,30,15);

//pierna1
stroke(152,157,19);
strokeWeight(1.25);
fill(237,255,0);
rect(265,410,10,60);
stroke(0,0,0);
fill(255,255,255);
rect(265,430,10,40);
noStroke();
fill(18,174,250);
rect(266,435,9,2);
noStroke();
fill(250,3,19);
rect(266,438,9,2);
fill(0,0,0);
ellipse(270,475,30,15);


stroke(0,0,0);
strokeWeight(2);
line(240,370,260,370);
line(275,370,295,370);
line(315,370,335,370);
line(350,370,370,370);

fill(255,0,0);
noStroke();
rect(298,340,15,30);
triangle(298,370,313,370,305.5,380);


fill(152,157,19);
ellipse(250,220,15,20);
ellipse(245,240,8,10);
ellipse(365,218,10,12);
ellipse(365,300,8,20);
ellipse(365,325,8,10);
ellipse(245,310,8,10);
ellipse(260,325,15,22);


//Ojo1
fill(255,255,255);
stroke(0,0,0);
strokeWeight(1.5);
ellipse(280,250,48,50);
fill(18,143,250);
ellipse(288,240,20,20);
fill(0,0,0);
ellipse(288,240,10,10);
fill(255,255,255);
ellipse(290,238,4,4);


//Ojo2
fill(255,255,255);
stroke(0,0,0);
strokeWeight(1.5);
ellipse(330,250,48,50);
fill(18,143,250);
ellipse(324,260,20,20);
fill(0,0,0);
ellipse(324,260,10,10);
fill(255,255,255);
ellipse(322,262,4,4);

fill(237,255,0);
stroke(152,157,19);
strokeWeight(2);
ellipse(305,270,26,28);

stroke(0,0,0);
line(280,300,330,300);

fill(255,255,255);
stroke(0,0,0);
strokeWeight(1);
rect(290,300,12,10);
rect(310,300,12,10);

//brazo1
stroke(0);
strokeWeight(1.25);
fill(255,255,255);
rect(215,300,15,30);
fill(237,255,0);
stroke(152,157,19);
rect(219,330.5,7,60);


//brazo2
stroke (0,0,0);
strokeWeight(1.25);
fill(255,255,255);
rect(380,300,15,30);
stroke(152,157,19);
fill(237,255,0);
rect(384,330.5,7,60);














