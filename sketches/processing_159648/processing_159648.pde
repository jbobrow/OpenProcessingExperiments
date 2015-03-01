
size(800,600);
smooth();
noStroke();
fill(0,0,200);//blue
rect(0,0,800,470);//sky
fill(0,55,0);//green
rect(0,470,800,600);//ground
fill(130,74,17);//brown
ellipse(400,375,195,300);//body
ellipse(400,200,135,125);//head
arc(350,200,80,60,HALF_PI,HALF_PI+PI);//right outer ear
arc(450,200,80,60,PI+HALF_PI,TWO_PI+HALF_PI);//left outer ear
rect(225,315,95,25);//right upper arm
rect(480,315,95,25);//left upper arm
rect(225,220,25,100);//right fore arm
rect(550,315,25,100);//left fore arm
quad(375,475,345,495,250,450,275,425);
quad(350,455,305,525,250,450,275,425);//right leg
quad(425,475,455,495,550,450,525,425);
quad(450,455,495,525,550,450,525,425);//left leg
rect(230,510,75,20);//right foot
rect(495,510,75,20);//left foot
fill(84,45,5);//dark brown
arc(375,190,20,20,PI,TWO_PI);//right eye
arc(425,190,20,20,PI,TWO_PI);//left eye
arc(350,200,60,30,HALF_PI,HALF_PI+PI);//right ear
arc(450,200,60,30,PI+HALF_PI,TWO_PI+HALF_PI);//left ear
ellipse(400,225,50,45);//face
fill(5,5,5);//black
triangle(400,220,395,215,405,215);//nose
fill(227,192,157);//tan
ellipse(400,400,125,200);//belly
