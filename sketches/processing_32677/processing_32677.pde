
//Wassily Kandinsky’s Transverse Line (1923)//
//section 9//


size( 400,500 );
background(239,222,193);
//paintng//

beginShape();

//started drawing from the center out//


//top colored arcs//

noFill();
stroke(128,150,115);
strokeWeight(25);
arc(135, 185, 200, 150, PI, TWO_PI-PI/2);







// overlaping lines from the bottom //
strokeWeight(4);
stroke(0);
line(131,216,357,426);
line(152,195,317,468);
line(145,214,375,384);


//small black & white circle + red outline + lines to small circle//
strokeWeight(20);
stroke(223,61,50);
ellipse(184,258,20,22);

stroke(0);  
strokeWeight(6);
fill(255);
ellipse(184,258,23,25);





stroke(0);
strokeWeight(5);
line(187,260,128,59);

stroke(0);
strokeWeight(5);
line(175,280,38,115);



//top triangles//

noStroke();
fill(128,150,115);
triangle(73,91,74,68,57,77);


noStroke();
fill(223,61,50);
triangle(83,118,91,77,53,96);






//Curves, Top left corner//
//1//
strokeWeight(5);
stroke(0);
noFill();
beginShape();


curveVertex(128, 59);
curveVertex(128, 59);

curveVertex(100,51);
curveVertex(59, 54);
curveVertex(40,78);
curveVertex(39,117);

curveVertex(38,115);
curveVertex(38,115);


endShape();

//2//
strokeWeight(5);
stroke(0);
noFill();
beginShape();


curveVertex(38,115);
curveVertex(38,115);

curveVertex(22,114);
curveVertex(10,112);
curveVertex(5,114);

curveVertex(0,115);
curveVertex(0,115);



endShape();



//3 - top corner fill//
strokeWeight(5);
stroke(226,134,37);
fill(0);
beginShape();


curveVertex(-5,100);
curveVertex(-5,100);


curveVertex(100,-5);
curveVertex(-5,-5);




curveVertex(-5,100);
curveVertex(-5,100);

endShape();



//4 - bottom corner line//
strokeWeight(5);
stroke(0);
noFill();
beginShape();


curveVertex(0,360);
curveVertex(0,360);

curveVertex(82,380);
curveVertex(154,398);
curveVertex(237,436);


curveVertex(300,500);
curveVertex(300,500);

endShape();


//4 - bottom corner line//
strokeWeight(5);
stroke(0);
noFill();
beginShape();


curveVertex(129,422);
curveVertex(129,422);

curveVertex(244,285);
curveVertex(215,64);

curveVertex(175,0);

curveVertex(151,11);


curveVertex(125,61);
curveVertex(125,61);

endShape();







//big arcs//
//
noFill();
stroke(0);  
strokeWeight(6);

ellipse(35,200,650,700);
ellipse(15,225,650,575);
//






endShape();







endShape();

