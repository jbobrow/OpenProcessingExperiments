
//homework2, 51-257
//Suzanne Choi, suzanne1
//Copyright 2013 January Suzanne Choi. All rights reserved

size(400,400);
smooth();
background(74,80,64);

//giving variables
float x,y,wd,ht;
x=10;
y=10;
wd=400;
ht=400;

//bounding box and circle
noFill();
strokeWeight(3);
noStroke();
//stroke(160,167,147);
rect(x,y,wd,ht);
strokeWeight(3);
//stroke(160,167,147);
ellipse(x+wd*.5,y+ht*.5,wd,ht);

//color filled face
fill(237,219,196);
beginShape();
stroke(237,219,196);
strokeWeight(3);
curveVertex(x+wd*.75,y-ht*.03);//a control point
curveVertex(x+wd*.5,y);
curveVertex(x+wd*.35,y+ht*.05);
curveVertex(x+wd*.25,y+ht*.1);
curveVertex(x+wd*.20,y+ht*.2);
curveVertex(x+wd*.20,y+ht*.3);
curveVertex(x+wd*.25,y+ht*.4);
curveVertex(x+wd*.28,y+ht*.5);
curveVertex(x+wd*.28,y+ht*.6);
curveVertex(x+wd*.30,y+ht*.7);
curveVertex(x+wd*.34,y+ht*.74);
curveVertex(x+wd*.4,y+ht*.8);
curveVertex(x+wd*.45,y+ht*.82);
//neck
vertex(x+wd*.45,y+ht);
vertex(x+wd*.65,y+ht);
vertex(x+wd*.65,y+ht*.75);
//face continue(right side)
curveVertex(x+wd*.7,y+ht*.65);
curveVertex(x+wd*.75,y+ht*.5);
curveVertex(x+wd*.8,y+ht*.4);
curveVertex(x+wd*.8,y+ht*.3);
curveVertex(x+wd*.8,y+ht*.2);
curveVertex(x+wd*.78,y+ht*.15);
curveVertex(x+wd*.65,y+ht*.05);
curveVertex(x+wd*.6,y+ht*.03); //control point
endShape();

//nose
strokeWeight(3);
stroke(193,181,164);
line(x+wd*.38,y+ht*.3,x+wd*.33,y+ht*.5);
line(x+wd*.33,y+ht*.5,x+wd*.38,y+ht*.53);
beginShape();
noFill();
strokeWeight(3);
stroke(155,145,130);
curveVertex(x+wd*.38,y+ht*.55); //control point
curveVertex(x+wd*.4,y+ht*.53);
curveVertex(x+wd*.41,y+ht*.51);
curveVertex(x+wd*.39,y+ht*.5); 
curveVertex(x+wd*.41,y+ht*.48);  //control point
endShape();


//glasses 
noFill();
strokeWeight(3);
stroke(108,94,76);
ellipse(x+wd*.28,y+ht*.35,wd*.15,ht*.15);
ellipse(x+wd*.48,y+ht*.35,wd*.15,ht*.15);
line(x+wd*.36,y+ht*.35,x+wd*.40,y+ht*.35);
line(x+wd*.56,y+ht*.35,x+wd*.65,y+ht*.35);

//initial S on top of glasses
//pink side
beginShape();
noFill();
strokeWeight(7);
stroke(216,118,205,95);
curveVertex(x+wd*.26, y+ht*.28); //control point
curveVertex(x+wd*.21,y+ht*.32);
curveVertex(x+wd*.2,y+ht*.35);
curveVertex(x+wd*.21,y+ht*.38);
curveVertex(x+wd*.23,y+ht*.41);
curveVertex(x+wd*.26,y+ht*.42);
curveVertex(x+wd*.3,y+ht*.42);
curveVertex(x+wd*.33,y+ht*.4);
curveVertex(x+wd*.36,y+ht*.38);
curveVertex(x+wd*.39,y+ht*.35);
curveVertex(x+wd*.42,y+ht*.32); // control point
endShape();
//blue side
beginShape();
noFill();
strokeWeight(7);
stroke(118,166,216,95);
curveVertex(x+wd*.36,y+ht*.38); //control point
curveVertex(x+wd*.39,y+ht*.35);
curveVertex(x+wd*.42,y+ht*.31);
curveVertex(x+wd*.45,y+ht*.28);
curveVertex(x+wd*.5,y+ht*.28);
curveVertex(x+wd*.54,y+ht*.31);
curveVertex(x+wd*.55,y+ht*.34);
curveVertex(x+wd*.55,y+ht*.37);
curveVertex(x+wd*.54,y+ht*.4); //control point
endShape();

//mustache
fill(77,68,56);
noStroke();
triangle(x+wd*.37,y+ht*.55,x+wd*.37,y+ht*.60,x+wd*.25,y+ht*.60);
triangle(x+wd*.385,y+ht*.55,x+wd*.385,y+ht*.60,x+wd*.505,y+ht*.60);

//lip
strokeWeight(3);
stroke(155,136,136);
line(x+wd*.33,y+ht*.63,x+wd*.43,y+ht*.63);

//ear (initial C)
beginShape();
noFill();
strokeWeight(3);
stroke(193,181,164);
curveVertex(x+wd*.63,y+ht*.4); //controlpoint    
curveVertex(x+wd*.65,y+ht*.35);
curveVertex(x+wd*.68,y+ht*.33);
curveVertex(x+wd*.72,y+ht*.35);
curveVertex(x+wd*.72,y+ht*.4);
curveVertex(x+wd*.68,y+ht*.45);
curveVertex(x+wd*.66,y+ht*.5); //controlpoint
endShape();

//hairs(left)
beginShape();
fill(108,94,76);
strokeWeight(3);
stroke(108,94,76);
curveVertex(x+wd*.35,y); //controlpoint
curveVertex(x+wd*.3,y+ht*.1);
curveVertex(x+wd*.2,y+ht*.2);
curveVertex(x+wd*.5,y);
curveVertex(x+wd*.35,y+ht*.05);
curveVertex(x+wd*.25,y+ht*.1);
curveVertex(x+wd*.20,y+ht*.2);
curveVertex(x+wd*.20,y+ht*.3); //controlpoint
endShape();

//hair(right)
beginShape();
fill(108,94,76);
strokeWeight(3);
stroke(108,94,76);
curveVertex(x+wd*.25,y); //controlpoint
curveVertex(x+wd*.3,y+ht*.1);
curveVertex(x+wd*.4,y+ht*.15);
curveVertex(x+wd*.45,y+ht*.17);
curveVertex(x+wd*.5,y+ht*.2);
curveVertex(x+wd*.6,y+ht*.23);
curveVertex(x+wd*.7,y+ht*.25);
curveVertex(x+wd*.75,y+ht*.3);
curveVertex(x+wd*.8,y+ht*.4);
curveVertex(x+wd*.8,y+ht*.3);
curveVertex(x+wd*.8,y+ht*.2);
curveVertex(x+wd*.78,y+ht*.15);
curveVertex(x+wd*.65,y+ht*.05);
curveVertex(x+wd*.6,y+ht*.03);
curveVertex(x+wd*.5,y);
curveVertex(x+wd*.45,y-ht*.05); //controlpoint
endShape();

//eyes
beginShape();
noFill();
strokeWeight(3);
stroke(52,41,25);
curveVertex(x+wd*.18,y+ht*.32); //control point
curveVertex(x+wd*.2,y+ht*.34);
curveVertex(x+wd*.23,y+ht*.36);
curveVertex(x+wd*.27,y+ht*.37);
curveVertex(x+wd*.31,y+ht*.36);
curveVertex(x+wd*.33,y+ht*.34);
curveVertex(x+wd*.35,y+ht*.32); //control point
endShape();

beginShape();
noFill();
strokeWeight(3);
stroke(52,41,25);
curveVertex(x+wd*.38,y+ht*.32); //control point
curveVertex(x+wd*.4,y+ht*.34);
curveVertex(x+wd*.43,y+ht*.36);
curveVertex(x+wd*.47,y+ht*.37);
curveVertex(x+wd*.51,y+ht*.36);
curveVertex(x+wd*.53,y+ht*.34);
curveVertex(x+wd*.55,y+ht*.32); //control point
endShape();




//saveFrame("hw2.jpg");













