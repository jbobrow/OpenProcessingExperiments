
size(500,500);
background(45,125,250);//sky color

//house body
fill(60,100,100);
rect(250,150,245,150);//body of house
line(350,300,350,135);//line1 for side dividing

//roof
fill(0);//color of roof
stroke(126);
triangle(250,150,350,149,300,90);//roof triangle part
noStroke();

triangle(350,149,300,90,350,90);//for roof
rect(350,90,145,60);//for roof

//house accessories
fill(204, 102, 0);
rect(420,65,20,25);//chimney
fill(255,0,0);
rect(278,250,40,50);//door
color c1 = color(204, 153, 0);
color c2 = #FFCC00;
noStroke();
fill(c1);
ellipse(310,280,10,10);//door handle
//windows
rect(310,195,30,40); //right window from the door
rect(258,195,30,40); // left window from the door
rect(375,195,30,40);//left window on side of house
rect(450,195,30,40);//right window on side of house

//shutters
fill(0,0,0);
rect(360,195,15,40);//Lshutter4LW
rect(400,195,15,40);//rshutter4LW
rect(475,195,15,40);//Lshutter4RW
rect(435,195,15,40);//Rshutter4RW

fill(250);

//landscaping

//sun
fill(230,235,0);
ellipse(120,75,100,100);

// tree color
color c = color(20, 75, 200);  // Define color 'c'
fill(c);  // Use color variable 'c' as fill color
float greenValue = green(c);  // Get green in 'c'
println(greenValue);  // Print "75.0"
fill(0, greenValue, 0);  // Use 'greenValue' in new fill

triangle(125,300,200,300,170,175);//tree
noFill();

//grass
fill(15, 100, 0);//grass color
rect(0,300,500,500);

//path
stroke(126);

fill(100,80,25);
quad(280, 300, 320, 300, 350, 500, 280, 500);
//the stone for the path-please tell me there is an easier way to do this
fill(100,60,25);
ellipse(290,350,10,20);
ellipse(295,400,15,20);
ellipse(315,445,20,30);
ellipse(305,315,15,10);
ellipse(315,350,10,20);
ellipse(315,410,15,20);

//smoke for the chimney
fill(255,75,0);
ellipse(420,55,10,10);
ellipse(430,50,10,10);
ellipse(440,55,10,12);

//bush on side of house
fill(60,150,0);
ellipse(420,280,65,50);













