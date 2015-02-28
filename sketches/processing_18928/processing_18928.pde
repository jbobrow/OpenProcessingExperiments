
void setup()  {
size(600,700);
smooth();
background(#000000);

stroke(#996699);
noFill();
arc(0,0,160,160,0,PI/2);
arc(0,0,170,170,0,PI/2);
arc(0,0,180,180,0,PI/2);
arc(0,0,190,190,0,PI/2);
arc(0,0,200,200,0,PI/2);
arc(0,0,210,210,0,PI/2);
arc(0,0,220,220,0,PI/2);
arc(0,0,230,230,0,PI/2);
arc(0,0,240,240,0,PI/2);
arc(0,0,250,250,0,PI/2);
arc(0,0,260,260,0,PI/2);
arc(0,0,270,270,0,PI/2);
arc(0,0,280,280,0,PI/2);
arc(0,0,290,290,0,PI/2);
//background

stroke(#00CC66,900);
arc(width,0,880,480,PI/2,PI);
arc(width,0,890,490,PI/2,PI);
arc(width,0,900,500,PI/2,PI);
arc(width,0,910,510,PI/2,PI);
arc(width,0,920,520,PI/2,PI);
arc(width,0,930,530,PI/2,PI);
arc(width,0,940,540,PI/2,PI);
arc(width,0,950,550,PI/2,PI);
arc(width,0,960,560,PI/2,PI);
arc(width,0,970,570,PI/2,PI);
arc(width,0,980,580,PI/2,PI);
arc(width,0,990,590,PI/2,PI);
arc(width,0,1000,600,PI/2,PI);
arc(width,0,1010,610,PI/2,PI);
arc(width,0,1020,620,PI/2,PI);
arc(width,0,1030,630,PI/2,PI);
arc(width,0,1040,640,PI/2,PI);
arc(width,0,1050,650,PI/2,PI);
arc(width,0,1060,660,PI/2,PI);
arc(width,0,1070,670,PI/2,PI);
//background

stroke(#FFFF33);
strokeWeight(6);
line(430,35,550,height);
line(300,0,320,height);
//two main front lines

beginShape();
noFill();
vertex(300,0);
bezierVertex(350,100,330,300,430,35);
endShape();
//top horns

beginShape();
strokeWeight(3);
vertex(300,0);
bezierVertex(350,100,320,350,430,35);
endShape();
//top horn right below

beginShape();
strokeWeight(3);
vertex(300,0);
bezierVertex(350,100,310,400,430,35);
endShape();
//top horn (lowest)


strokeWeight(3);
line(430,35,540,height);
line(430,35,530,height);
line(430,35,520,height);


beginShape();
stroke(#FFFF33);
vertex(300,0);
bezierVertex(300,100,270,300,280,75);
endShape();
//side horns (also in yellow)

stroke(#FF3333);
fill(#FF3333,100);
triangle(280,330,250,360,280,75);
fill(#FF3333,930);
triangle(290,320,300,0,270,340);
//side triangles in red

beginShape();
strokeWeight(0);
stroke(#CCCC99);
fill(#999966,100);
vertex(290,320);
vertex(170,450);
vertex(100,470);
vertex(80,380);
vertex(40,height);
vertex(270,height);
vertex(290,320);
endShape();
//side gray 

fill(#999999,100);
triangle(100,680,140,680,140,430);
fill(#999999,200);
triangle(160,680,200,680,180,400);
fill(#66CC99,950);
triangle(200,680,240,680,220,360);
fill(#009966);
triangle(240,680,280,680,260,300);
fill(#999933,50);
triangle(80,680,120,680,110,440);
fill(#999933,100);
triangle(120,680,160,680,160,420);
//side mini-tower


beginShape();
fill(#666699, 200); 
vertex(0,590);
vertex(0,670);
vertex(280,670);
vertex(280,580);
endShape();
//front arch(left)


beginShape();
strokeWeight(0);
fill(#666699,200);
vertex(width,585);
vertex(530,580);
vertex(540,680);
vertex(width,680);
endShape();
//front arch(right)


fill(#FF3333,100);
strokeWeight(2);
stroke(#FF3333);
rect(30,605,50,58);
stroke(#66CC66);
rect(100,600,50,60);
stroke(#FF3333);
rect(165,595,50,65);
stroke(#66CC66);
rect(230,593,55,67);
//arches in transparent red (left)
stroke(#66CC66);
rect(550,600,40,55);
//arches in transparent red (right)


strokeWeight(3);
stroke(#FFFF33);
line(300,0,290,height);
//yellow supporting center yellow line
strokeWeight(3);
line(300,0,280,height);
//yellow supporting center yellow line
strokeWeight(3);
line(300,0,270,height);
//yellow supporting center yellow line
strokeWeight(3);
line(300,0,300,height);
//yellow supporting center yellow line
strokeWeight(3);
line(300,0,310,height);
//yellow supporting center yellow line
strokeWeight(3);
line(300,0,320,height);
//yellow supporting center yellow line
strokeWeight(5);
line(320,590,430,620);
line(320,600,425,630);
line(320,610,420,640);
line(320,620,415,650);
line(320,630,410,660);
line(320,640,405,670);
line(320,650,400,680);
line(320,660,395,690);
//*
line(429,620,502,590);
line(425,630,503,600);
line(420,640,504,610);
line(415,650,505,620);
line(410,660,506,630);
line(405,670,507,640);
line(400,680,508,650);
line(395,690,509,660);
line(390,700,510,670);
//*
line(320,590,350,470);
line(330,590,360,480);
line(340,595,370,490);
line(350,595,380,500);
line(360,600,390,510);
line(370,600,400,520);
line(380,605,410,530);
line(390,605,420,540);
//*
line(350,470,485,450);
line(360,480,486,460);
line(370,490,487,470);
line(380,500,488,480);
line(390,510,489,490);
line(400,520,490,500);
line(410,530,491,510);
line(420,540,492,520);
//*
line(390,460,468,320);
line(405,458,470,340);
line(420,456,472,360);
line(435,454,475,380);
line(450,452,478,400);
line(465,450,482,417);
line(480,448,484,440);
//*
line(390,456,315,410);
line(380,465,315,425);
line(360,465,316,440);
line(345,471,316,455);
line(343,485,316,470);
line(342,500,316,485);
line(339,514,316,500);
line(335,528,316,517);
line(330,542,317,535);
line(328,557,317,550);
//*







fill(#FFF000,1000);
noStroke();
rect(0,670,width,670);
//ground in yellow!

beginShape();
stroke(#000000);
strokeWeight(2);
noFill();
vertex(0,620);
vertex(50,620);
vertex(50,640);
vertex(80,640);
vertex(80,620);
vertex(110,620);
vertex(110,640);
vertex(140,640);
vertex(140,620);
vertex(180,620);
vertex(180,640);
vertex(230,640);
vertex(230,620);
vertex(260,620);
vertex(260,640);
vertex(270,640);
endShape();
//train trail on the front

beginShape();
vertex(0,650);
vertex(20,650);
vertex(20,595);
vertex(70,595);
vertex(70,650);
vertex(100,650);
vertex(100,595);
vertex(130,595);
vertex(130,650);
vertex(190,650);
vertex(190,590);
vertex(220,590);
vertex(220,650);
vertex(250,650);
vertex(250,587);
vertex(273,587);
endShape();
//train trail on the front

beginShape();
vertex(600,665);
vertex(580,665);
vertex(580,620);
vertex(560,620);
vertex(560,665);
vertex(540,665);
endShape();
//train on right

beginShape();
vertex(600,640);
vertex(570,640);
vertex(570,590);
vertex(540,590);
vertex(540,640);
vertex(536,640);
endShape();
//train on right

stroke(#CC9933);
strokeWeight(1);
line(0,680,width,680);
line(0,685,width,685);
stroke(#FF0000);
line(0,690,width,690);
strokeWeight(1);
line(0,695,width,695);

}

