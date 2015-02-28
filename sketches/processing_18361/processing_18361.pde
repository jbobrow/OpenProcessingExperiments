
//SelfPortrait
size (600,600);
background (75);
smooth ();
noStroke ();

fill (240,191,191); //head
ellipseMode (CENTER);
ellipse (285,287,246,361);

fill (240,191,191); //ears
ellipseMode (CENTER);
ellipse (166,286,36,106);
ellipse (409,281,36,106);

fill (240,191,191); //body
beginShape();
vertex(330,430);
vertex(340,480);
vertex(520,500);
vertex(550,600);
vertex(46,600);
vertex(90,490);
vertex (240,480);
vertex (250,440);
endShape(CLOSE);

fill (122,30,32);  //shirt
beginShape();  
vertex(370,475);
vertex(520,500);
vertex(550,600);
vertex(46,600);
vertex(90,490);
vertex (240,475);
endShape(CLOSE);
fill (240,191,191);
arc (290,465,200,140,radians(10), radians(170));

fill (71,46,33);  //hair
beginShape();
vertex(312,105);
vertex(307,133);
vertex(277,150);
vertex(247,150);
vertex(163,250);
vertex(180,183);
vertex(216,127);
vertex(261,107);
endShape(CLOSE);

beginShape();
vertex(313,105);
vertex(309,133);
vertex(343,150);
vertex(360,153);
vertex(408,250);
vertex(400,183);
vertex(372,127);
endShape(CLOSE);

fill (255); //left_eye
arc (230,285,50,35,PI,TWO_PI);
rect (205,285,50,05);
fill (71,46,33);
ellipseMode (CENTER);
ellipse (230,280,20,20);
fill (43,26,17);
ellipse (230,280,10,10);
noFill ();
stroke (71,46,33);
arc (230,255,50,15,PI,TWO_PI);

fill (255); //right_eye
noStroke ();
arc (350,285,50,35,PI,TWO_PI);
rect (325,285,50,05);
fill (71,46,33);
ellipseMode (CENTER);
ellipse (350,280,20,20);
fill (43,26,17);
ellipse (350,280,10,10);
noFill ();
stroke (71,46,33);
arc (350,255,50,15,PI,TWO_PI);

noFill ();//nose
stroke (71,46,33); 
arc (290,350,50,15,0,PI); 

noStroke ();       //mouth
fill (250,121,121); 
triangle (230,385,290,395,290,415);
triangle (340,385,290,395,290,415);




 
















