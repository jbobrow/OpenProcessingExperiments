
//Home Assignment 2: Copy Image (24 Sep.2012)

//Q 1 Suprematistic _ 1923
//László Moholy-Nagy (American, born Hungary. 1895–1946)
//Oil on canvas, 37 1/2 x 37 1/2" (95.2 x 95.2 cm). 
//The Riklis Collection of McCrory Corporation. © 2012 Artists Rights Society (ARS), New York / VG Bild-Kunst, Bonn 1051.1983

//Student Name:Dana Silberberg-Sahar]

void setup (){
 size (655,655);// 25% of original work size
 smooth();//That's the anti-alliasing thingee
 colorMode (RGB);
 background(255,255,255);}
 void draw (){

   //Frame & Background [rect]
 strokeWeight (3);
 stroke (0,0,0,169);//stroke color
 fill(237,218,220,105);//RGB color, 4th argument is transparency
 rect (5,5, 645,645);
   fill(237,240,215,150);//RGB color, 4th argument is transparency
rect (5,5, 645,645);
 
 //Right-half main red large circle [Bezier]:
 stroke(200,10,7);//stroke color
 strokeWeight (1);//stroke weight 
 fill(194,11,13);//RGB color
 bezier (435, 155,640, 155, 640,457, 435,475);

//Left-half main red large circle[Bezier]:
 stroke(200,10,7);//stroke color
 strokeWeight (1);//stroke weight 
 fill(194,11,13);//RGB color
 bezier (430, 155,222, 155, 222,475, 430,475);

//Upper small black circle [point]:
 stroke(0,0,0);//stroke color
 strokeWeight (65);//stroke weight 
 point (375,51);
 
 ////Lower small black circle [elipse]:
 stroke(0,0,0);//stroke color
 strokeWeight (1);//stroke weight
fill (0,0,0);
ellipse (375,339,67,67);

//Vertical crossing yellow "strings" [rect & line]:
noStroke();
 fill(204,158,73,70);//RGB color, 4th argument is transparency
 rect (368,7.5,30,642);
strokeWeight (2.2);
 stroke (204,158,73);
 line(367,8,367,647);
strokeWeight (2);
 stroke (207,174,70);
 line(376,8,376,647);
 strokeWeight (2);
 stroke (217,174,90);
 line(387,8,387,647);
strokeWeight (2.3);
 stroke (204,158,73);
 line(398,8,398,647);
 
 //Horizontal yellow line [line]:
 strokeWeight (5);
 stroke (232,228,97);//stroke color
 line(8,398,647,398);
 
 //transparent grey "Blur" on everything.. [rect]
 strokeWeight (3);
 stroke (0,0,0,169);//stroke color
 fill(110,110,110,16);//RGB color, 4th argument is transparency
 rect (5,5, 645,645);
   fill(237,240,215,33);//RGB color, 4th argument is transparency
rect (5,5, 645,645);
}

