
// "Robot" by Brandon Messner //
// A Simple sketch of a friendly neighborhood robot.//

//Colors
int a=180;
int w=255;
int b=0;
int d=130;

size(400,600);
background(w);
fill(220);

//Right Arm
quad(350,190,327,120,335,120,356,183);
quad(285,208,350,180,354,186,287,216);
fill(180);
ellipse(290,210,30,30);
ellipse(352,183,20,20);

//Left Arm
quad(119,235,127,235,104,310,96,310);
quad(96,310,104,306,174,356,166,360);
fill(180);
ellipse(123,235,30,30);
ellipse(100,310,20,20);
fill(220);

//Right Leg
quad(239,375,251,375,212,560,200,560);
fill(a);
ellipse(245,375,30,30);
ellipse(227,460,25,25);
fill(d);
triangle(200,560,207,530,260,565);
fill(220);

//Left Leg
quad(189,375,201,375,162,560,150,560);
fill(a);
ellipse(195,375,30,30);
ellipse(177,460,25,25);
fill(d);
triangle(150,560,157,530,210,565);
fill(220);

//body
quad(130,215,280,190,260,360,180,363);

//Head
fill(224,31,31);
quad(140,150,160,80,200,80,220,150);
fill(220);
quad(195,202,175,172,185,172,205,202);
ellipse(180,150,200,80);
ellipse(200,202,20,5);
fill(255,235,23);
quad(177+5,78,183+5,78,188+5,100,182+5,100);


//Right Eye
fill(w);
ellipse(230,140,25,25);
ellipse(230,140,20,20);
fill(b);
ellipse(228,141,10,10);
fill(w);
ellipse(228,141,5,5);

//Left Eye
fill(255);
ellipse(130,140,25,25);
ellipse(130,140,20,20);
fill(b);
ellipse(132,141,10,10);
fill(w);
ellipse(132,141,5,5);
fill(220);

//Smile
line(162,157,198,157);
