
background(0);

size (800, 800); //easier to figure out coordinates

smooth();
//{BODY}
fill(206,0,183,200); 
stroke (255, 210,0);
strokeWeight (2);
rect(280, 300, 200, 250); //back of body
rect(250, 270, 200, 250);//front of body

//connecting lines on the right side
line(450,270,480,300);
line(450,270+250,480,300+250);
//connecting lines on the left side
line(450-200,270,480-200,300);
line(450-199,270+250,480-199,300+250);

//Sides
quad(450,270,480,300,450,270+250,480,300+250);//right side
quad(450-200,270,480-200,300,450-199,270+250,480-199,300+250);//left side

//Inards
fill(206,0,183,400); 
stroke (255, 210,0);
strokeWeight (2);
triangle(300+50,350,350+50,400,350+50,350);
fill(206,0,183,200);
triangle(300+50-10,350-10,350+50-10,400-10,350+50-10,350-10);
fill(189,10,255,200); 
stroke (255, 210,0);
strokeWeight (1);
triangle(300+50,350,450-20,300,350+50,350);
fill(255,200); 
stroke (255, 210,0);
strokeWeight (2);
ellipse(400-10,400-30,10,15);

//{HEAD}
//neck hole
fill(206,0,183,250);
stroke (255, 210,0);
strokeWeight(7);
ellipse(360,280,35,10);

//neck
strokeWeight(4);
quad(360,280,370,280,360,100,370,110);

//head
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
ellipse(360,100,25,65);

//{RIGHT HAND}

//cuff hole
fill(206,0,183,200);
stroke (255, 210,0);
strokeWeight(7);
ellipse(465,415,15,30);

//shoulder to elbow
strokeWeight(4);
quad(465,415,460,417,600,330,605,350);

//elbow to hand
strokeWeight(3);
quad(600,330,605,350,600,250,605,255);

//hand
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
ellipse(613+7,250,55,20);

//fingers

//{LEFT HAND}

//shoulder to elbow
fill(206,0,183,200);
strokeWeight(4);
quad(465-190,415,460-195,417,110,450,120,455);

//elbow to hand
fill(206,0,183,200);
strokeWeight(3);
quad(100,200,105,200,110,450,120,455);

//hand
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
ellipse(100-20,200,55,20);

//cuff hole
fill(206,0,183,200);
stroke (255, 210,0);
strokeWeight(7);
ellipse(465-200,415,15,30);

//{RIGHT LEG}

//cuff hole
fill(206,0,183,250);
stroke (255, 210,0);
strokeWeight(7);
ellipse(310,535,35,10);

//Leg
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
quad(310,555-20, 315, 555-20, 350+40,710, 355+45,710);

//foot
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
ellipse(400-5,710+20,20,50);

//{LEFT LEG}

//cuff hole
fill(206,0,183,250);
stroke (255, 210,0);
strokeWeight(7);
ellipse(320+100,535,35,10);

//Leg
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
quad(420, 535, 425, 535, 310, 710, 315, 710);

//foot
fill(255,10,96, 250); 
stroke (255, 210,0);
strokeWeight(3);
ellipse(315,710+20,20,50);





