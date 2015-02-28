


void setup (){
  smooth();
  size(400,400);
  background(255); 
  
}


void draw(){
 
  /*** BODY ***/
  noStroke();
  /* arms */
  fill(0);
  ellipse(200,250,250,270);
  /* fill(0);
  ellipse(315,198,18,18); */
  fill(255);
  ellipse(309,118,100,110);
  ellipse(91,118,100,110);
  fill(255);
  ellipse(340,90,160,200);
  ellipse(60,90,160,200);
  fill(255);
  ellipse(200,325,490,300);
  /* head */
  fill(0);
  ellipse(200,125,120,125);
  fill(100);
  ellipse(200,100,85,70);
  /* body*/ 
  fill(0);
  ellipse(200,200,160,160);
  fill(200);
  ellipse(200,220,120,150);
  fill(255);
  ellipse(200,210,110,140);
  /* floor */
  fill(255);
  ellipse(200,307,1000,50);
  /*** END BODY ***/
  
  
  /*** FEET  ***/
  /* base */
  fill(202,157,0);
  ellipse(240,275,70,45);
  ellipse(160,275,70,45);
  /* shine */
  fill(#fad75f);
  ellipse(248,272,40,30);
  ellipse(152,272,40,30);
  /* floor */
  fill(255);
  ellipse(200,310,1000,50);
  /*** END FEET ***/
  
  
  
  /*** EYES ***/
  strokeWeight(2);
  /* eyelid */
  stroke(0);
  fill(180);
  ellipse(180,120,50,55);  
  ellipse(220,125,50,40);
  noStroke();
  fill(0);
  ellipse(180,125,60,55);  
  ellipse(220,130,60,40);
  /* white */
  stroke(130);
  fill(255);
  ellipse(180,125,40,50);  
  ellipse(220,130,40,35);
  /* pupil */
  fill(50);
  noStroke();
  ellipse(192,130,12,18);
  ellipse(208,130,12,18);
  fill(0);
  ellipse(192,132,5,8);
  ellipse(208,132,5,8);
  /* shine */
  fill(240);
  ellipse(194,124,4,3);
  ellipse(210,124,4,3);
  /*** END EYES ***/
 
 
 
 /*** PEAK ***/
 fill(202,157,0);
 noStroke();
 ellipse(200,156,40,30); 
 fill(255);
 ellipse(223,177,40,50);
 ellipse(177,177,40,50);
 fill(255);
 ellipse(208,174,20,20);
 ellipse(192,174,20,20);
  fill(202,157,0);
  ellipse(200,165,10,10);
 /*** END PEAK ***/
 
  
  
  /*** TEXT ***/
fill(0);
ellipse(100,340,10,40); /* L */
ellipse(110,355,30,10); /* L */
ellipse(140,340,10,40); /* I */
ellipse(160,340,10,40); /* N */
ellipse(167,335,10,20); /* N */
ellipse(175,340,10,20); /* N */
ellipse(182,345,10,20); /* N */
ellipse(190,340,10,40); /* N */
ellipse(210,340,10,40); /* U */
ellipse(240,340,10,40); /* U */
ellipse(225,355,40,10); /* U */
ellipse(260,330,10,20); /* X */
ellipse(267,335,10,20); /* X */
ellipse(275,340,10,20); /* X */
ellipse(282,345,10,20); /* X */
ellipse(290,350,10,20); /* X */
ellipse(290,330,10,20); /* X */
ellipse(282,335,10,20); /* X */
ellipse(275,340,10,20); /* X */
ellipse(267,345,10,20); /* X */
ellipse(260,350,10,20); /* X */

/*** END TEXT ***/  
  
}

