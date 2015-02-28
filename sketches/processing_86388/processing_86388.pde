
/*
Sahana Kumar
copyright Sahana Kumar 2013
Assignment 2
*/

//setup
size(400,400);
smooth( );
background(251,255,242);

// Variables
float x = 200;
float y = 190;
float c = 250;
 
/*
// Bounding Circle
noFill();
ellipse(x, y, c, c);
*/
/*
strokeWeight(10);
  stroke( 200, 0, 0);
point(x+(c*.6), y-(c*.4)); //control

point(x+(c*.41), y-(c*.45));
point(x+(c*.01), y-(c*.66));
point(x-(c*.36), y-(c*.45));
point(x-(c*.09), y+(c*.013));
point(x+(c*.46), y+(c*.28));
point(x+(c*.01), y+(c*.66));
point(x-(c*.4), y+(c*.406));
*/

//s
fill( 255,195,155 );
strokeWeight(5);
stroke( 232,190,144);

beginShape();
curveVertex(x+(c*.6), y-(c*.4)); //control

curveVertex(x+(c*.3), y-(c*.55));
curveVertex(x+(c*.01), y-(c*.6));
curveVertex(x-(c*.28), y-(c*.36));
curveVertex(x-(c*.2), y-(c*.1));
curveVertex(x+(c*.23), y+(c*.28));
curveVertex(x+(c*.04), y+(c*.66));
curveVertex(x-(c*.42), y+(c*.55));

curveVertex(x-(c*.3), y+(c*.5));//control

endShape();

//k glasses
fill(240,232,237);
strokeWeight(3);
stroke(65,54,89);

/*beginShape();
//vertex(x+(c*.5),y+(c*.25)); //control
vertex(x-(c*.63), y-(c*.4));
vertex(x+(c*.429),y-(c*.4));
//vertex(x+(c*.3),y+(c*.25)); //control
endShape( );
*/

beginShape( );

curveVertex(x+(c*.6),y-(c*.4));
curveVertex(x+(c*.429),y-(c*.4));
curveVertex(x+(c*.2),y-(c*.14));
curveVertex(x-(c*.1),y-(c*.4));
curveVertex(x-(c*.35),y-(c*.14));
curveVertex(x-(c*.63), y-(c*.4));
vertex(x-(c*.63), y-(c*.4));

endShape( );

//smile

fill(203,197,201);
strokeWeight(2);
stroke(93,90,92);

beginShape();
vertex(x-(c*.2),y+(c*.30));//control
   
vertex(x-(c*.35),y+(c*.30));
vertex(x+(c*.3),y+(c*.30));
vertex(x+(c*.35),y+(c*.43));
vertex(x-(c*.43),y+(c*.43));
vertex(x-(c*.35),y+(c*.30));

vertex(x-(c*.2),y+(c*.30));//control

endShape( );

//mustache lines
noFill( );
stroke(224,222,215);

line(x-(c*.25),y+(c*.30), x-(c*.33),y+(c*.43));
line(x-(c*.15),y+(c*.30), x-(c*.23),y+(c*.43));


line(x+(c*.21),y+(c*.30), x+(c*.28),y+(c*.43));
line(x+(c*.12),y+(c*.30), x+(c*.18),y+(c*.43));
line(x+(c*.03),y+(c*.30), x+(c*.1),y+(c*.43));

//line(x-(c*.23),y+(c*.30), x-(c*.15),y+(c*.43));






   
//eyeballs
//ellipse(a, b, c, d)
fill(255,255,255);
noStroke();
ellipse(x-(c*.35),y-(c*.2), 25, 25);
ellipse(x+(c*.2),y-(c*.2), 25,25);

fill(49,48,44);
ellipse(x-(c*.35),y-(c*.2), 15, 15);
ellipse(x+(c*.2),y-(c*.2), 15,15);


//nose
fill( 255,195,155 );
strokeWeight(5);
stroke( 216,187,127);

beginShape();

curveVertex(x-(c*.2),y+(c*.30));//control
   
curveVertex(x-(c*.07), y+(c*.01));
curveVertex(x-(c*.3), y+(c*.1));
curveVertex(x-(c*.1), y+(c*.1));
curveVertex(x-(c*.2),y+(c*.30));//control


endShape( );

//left ear
fill( 255,195,155 );
strokeWeight(4);
stroke( 216,187,127);
beginShape();

curveVertex(x-(c*.3), y-(c*.2));
   
curveVertex(x-(c*.5), y-(c*.2));
curveVertex(x-(c*.57), y-(c*.12));
curveVertex(x-(c*.5), y-(c*.01));
curveVertex(x-(c*.3),y+(c*.30));//control
endShape( );

//rightear
beginShape();

curveVertex(x+(c*.3), y+(c*.2));
   
curveVertex(x+(c*.5), y-(c*.2));
curveVertex(x+(c*.6), y-(c*.12));
curveVertex(x+(c*.5), y+(c*.01));
curveVertex(x+(c*.3),y-(c*.30));
endShape( );

//saveFrame("hw2.jpg");


