

size(500, 500);
background (255, 255, 255);

fill(255,255,0);//yellow
ellipse(250, 250, 250, 250);//face
//ellipse(100,100, 300, 350);


fill(255,255,255);//white
ellipse(200,220,50,50);//left eye
ellipse(300,220,50,50);//right eye
fill(0,0,255);//blue
ellipse(200,220,25,25);//left pupil
ellipse(300,220,25,25);//right pupil
fill(255,255,255);//white
ellipse(200,220,12.5,12.5);//left inner pupil
ellipse(300,220,12.5,12.5);//right inner pupil

fill(0,0,0);//black
triangle(225,275,250,200,275,275);
//rect(235,255,30,30);
rect(235,255,30,30);

fill(255,0,0);//red 
arc (250,310,100,50,0,3.14); //smile
line(200,310,300,310);

fill(153,102,0);
rect(100,130,300,30);//bottom rect of hat
rect(135,40,225,90);//top rect of hat
fill(0,0,0);
point(190,330);
ellipse(180,340,5,5);
ellipse(150,360,10,10);
ellipse(130,390,25,25);
fill(255,255,255);
ellipse(230, 450, 400, 70);

fill(0,0,0);
textFont(createFont("SansSerif",23));
textAlign(CENTER);
text("Hello World!", 230,450);

