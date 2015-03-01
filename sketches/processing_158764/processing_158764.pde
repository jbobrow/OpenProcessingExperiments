
size(400,470);//set size to 400x 400y
background(0,0,255);//blue background
ellipseMode(CENTER);// ellipses are drawn from center
rectMode(CENTER);//rectangles are drawn from center
fill(0,190,0);//darker green
rect(200,100,400,200);//land background
fill(30,180,255);//color for sky
rect(200,80,400,200);//sky
fill(255,255,0);//color for sun
ellipse(350,60,60,60);//sun
fill(0,160,0);//even darker green
strokeWeight(2);
arc(200,370,230,230,-4,1,3);//lilly pad
fill(0,255,0);//green
strokeWeight(1);
triangle(140,270,165,271,140,340);//right back leg
triangle(235,271,260,270,260,340);//left back leg
triangle(115,355,140,340,130,360);//right back foot
triangle(260,340,285,355,270,360);//left back foot
triangle(178,370,185,350,192,370);//front right footpad
triangle(208,370,215,350,222,370);//front left footpad
strokeWeight(2);
line(123,357,140,340);//right back foot pad line
line(277,357,260,340);//left back foot pad line
line(185,370,185,350);//right front footpad line
line(215,370,215,350);//left front footpad line
strokeWeight(1);
ellipse(200,300,100,80);//frog body
ellipse(200,250,60,40);//frog head
ellipse(190,230,15,15);//frog left eye
ellipse(210,230,15,15);//frog right eye
quad(170,280,180,280,170,330,160,330);//right front leg part1
quad(220,280,230,280,240,330,230,330);//left front leg part1
quad(160,330,170,330,185,350,185,350);//right front leg part2
quad(230,330,240,330,215,350,215,350);//left front leg part2
fill(0);//black
ellipse(190,230,5,5);//left pupil
ellipse(210,230,5,5);//right pupil
triangle(190,250,195,245,197,255);//left nostril
triangle(205,245,210,250,203,255);//right nostril
fill(255,100,100);//color
ellipse(200,263,20,10);//mouth
fill(123,63,0);//brown color for tree
rect(70,150,30,90);//tree trunk
fill(155);//grey color for mountains
triangle(200,180,250,90,300,180);//back middle mountain
triangle(170,180,220,100,270,180);//middle right mountain
triangle(240,180,290,130,340,180);//front middle mountain
noStroke();
fill(0,160,0);
ellipse(50,100,30,30);//tree top
ellipse(70,100,30,30);
ellipse(90,100,30,30);
ellipse(35,85,30,30);
ellipse(50,85,30,30);
ellipse(70,85,30,30);
ellipse(90,85,30,30);
ellipse(105,85,30,30);
ellipse(50,70,30,30);
ellipse(70,70,30,30);
ellipse(90,70,30,30);//end treetop
fill(255);
triangle(233,120,250,87,268,120);//snow cap middle mountain
triangle(208,120,220,97,233,120);//snow cap right mountain


