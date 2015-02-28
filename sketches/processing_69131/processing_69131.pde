
//Kevin T. Computer Programming 1 16-17
size(600,600);
int r = 255;
int y = 0;
while(y<600)
{
  stroke(r,90,255);
  line(0,y,600,y);
  y= y + 1;
  r = r- 1;
}
noStroke();
smooth();
fill(0);
//body
quad(270,265,330,265,360,415,240,415);
//head
ellipse(300,200,150,150);
//ears
ellipse(210,140,90,100);
ellipse(390,140,90,100);
//face
fill(255,223,160);
ellipse(275,190,60,100);
ellipse(325,190,60,100);
ellipse(300,245,130,60);
//legs
fill(0);
rect(320,460,30,40);
rect(250,460,30,40);
//torso cloth
fill(255,0,0);
ellipse(300,395,130,110);
rect(250,335,100,30);
rect(300-50,430,40,40);
rect(300+10,430,40,40);
triangle(250,430,240,470,260,470);
triangle(350,430,340,470,360,470);
//ellipse(245,350,30,30); maybe add this
fill(252,152,43);
ellipse(300-25,395,30,55);
ellipse(300+25,395,30,55);
//eyes
fill(0);
ellipse(275,190,30,50);
ellipse(325,190,30,50);
fill(255,255,255);
ellipse(270,180,10,10);
ellipse(320,180,10,10);
//mouth
fill(0);
arc(300,245,60,40,0,PI);
//tongue
fill(247,90,90);
rect(300-15,262,30,20);
ellipse(300,278,30,30);
ellipse(300,265,30,30);
stroke(0);
line(300,262,300,300);
//nose
fill(0);
ellipse(300,220,17,10);
//mouth line
noFill();
stroke(0);
arc(300,164,300+90,164,PI/2.4,7*PI/12);
//shoes
noStroke();
fill(250,204,53);
ellipse(300-55,520,100,70);
ellipse(300+55,520,100,70);
//arms
fill(0);
quad(330,273,400,273,400,303,330,303);
ellipse(400,576.0/2.0,30,30);
quad(270,273,200,273,200,303,270,303);
ellipse(200,576.0/2.0,30,30);
rect(388,220,27,70);
rect(185,220,27,70);
//hands
fill(255,255,255);
ellipse(300+101,230,40,20);
ellipse(300-101,230,40,20);
ellipse(300+101,210,50,50);
ellipse(300-101,210,50,50);
//fingers left
ellipse(300-120,185,15,70);
ellipse(300-100,180,15,70);
ellipse(300-80,185,15,70);
ellipse(300-80,215,50,15);
//fingers right
ellipse(300+120,185,15,70);
ellipse(300+100,180,15,70);
ellipse(300+80,185,15,70);
ellipse(300+80,215,50,15);
