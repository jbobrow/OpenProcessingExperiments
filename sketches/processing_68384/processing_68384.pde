
//Sarah Anderson, seanders
//HW2, 11:30 AM
//Copyright Sarah Anderson 2012 CMU All Rights Reserved

size(400,400);
smooth();
background(50);


float x,y, di; //4 float variables

x=200; //taken from class notes
y=200;
di=200; //diameter of ellipse

noFill();
strokeWeight(2);
stroke(255);

//bouding circle
ellipseMode(CENTER);
ellipse(x,y, di, di); //taken from class notes

/*
//points used to guid the curve
strokeWeight(8);
//letter E
//control points
  stroke(0);
  point(x+(di*0.35), y-(di*0.35));
  point(x+(di*0.35), y+(di*0.35));
//normal points
  stroke(0,0, 255);
  point(x+(di*0.2), y-(di*0.45));
  point(x, y-(di*0.5));
  point(x,y);
  point(x+(di*0.15),y);
  point(x, y+(di*0.5));
  point(x+(di*0.2), y+(di*0.45));

//letter A
//control points
  stroke(0);
  point(x+(di*0.6),y);
  point(x+(di*0.35), y+(di*0.35));
//normal points
  stroke(255, 0,0);
  point(x+(di*0.45),y+(di*0.2));
  point(x+(di*0.5), y);
  point(x+(di*0.45), y-(di*0.2));
  point(x+(di*0.3), y-(di*.40));
  point(x+(di*0.3), y);
  point(x+(di*0.3), y+(di*0.4));

//letter S
//control points
  stroke(0);
  point(x-(di*0.05), y-(di*0.55));
  point(x-(di*0.5),y+(di*0.1));
//normal points
  stroke(0,255,0);
  point(x-(di*0.1), y-(di*0.49));
  point(x-(di*0.2), y-(di*0.45));
  point(x-(di*0.3), y-(di*0.4));
  point(x-(di*0.4), y-(di*0.3));
  point(x-(di*0.35), y-(di*0.15));
  point(x-(di*0.15), y-(di*0.05));
  point(x-(di*0.1), y+(di*0.05));
  point(x-(di*0.05), y+(di*0.25));
  point(x-(di*0.1), y+(di*0.49));
  point(x-(di*0.3), y+(di*0.4));
  point(x-(di*0.45), y+(di*0.2));
  */
//connect the dots
strokeWeight(8);
// letter S
stroke(211,54,255);
beginShape();
  curveVertex(x-(di*0.05), y-(di*0.55)); //control point
  curveVertex(x-(di*0.1), y-(di*0.49));
  curveVertex(x-(di*0.2), y-(di*0.45));
  curveVertex(x-(di*0.3), y-(di*0.4));
  curveVertex(x-(di*0.4), y-(di*0.3));
  curveVertex(x-(di*0.35), y-(di*0.15));
  curveVertex(x-(di*0.15), y-(di*0.05));
  curveVertex(x-(di*0.1), y+(di*0.05));
  curveVertex(x-(di*0.05), y+(di*0.25));
  curveVertex(x-(di*0.1), y+(di*0.49));
  curveVertex(x-(di*0.3), y+(di*0.4));
  curveVertex(x-(di*0.45), y+(di*0.2));
  curveVertex(x-(di*0.5),y+(di*0.1)); //control point
endShape();

//letter E
stroke(255,243,134);
beginShape();
  curveVertex(x+(di*0.35), y-(di*0.35)); //control point
  curveVertex(x+(di*0.2), y-(di*0.45));
  curveVertex(x, y-(di*0.5));
  curveVertex(x,y);
  curveVertex(x+(di*0.15),y);
  curveVertex(x,y);
  curveVertex(x, y+(di*0.5));
  curveVertex(x+(di*0.2), y+(di*0.45));
  curveVertex(x+(di*0.35), y+(di*0.35));  //control point
endShape();

//letter A
stroke(103,222,179);
beginShape();
  curveVertex(x+(di*0.6),y); //control point
  curveVertex(x+(di*0.45),y+(di*0.2));
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.45), y-(di*0.2));
  curveVertex(x+(di*0.3), y-(di*.40));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.3), y+(di*0.4));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.35), y+(di*0.35)); //control point
endShape();
  
  

//saveFrame( "hw2.jpg");
  
  



