
//Author: Liliam Rodas
//Purpose: To practice and overview functions
//Functioning: Same as the first Kandisky; just reorganized.


//Application of Functions on:
//Composition VIII-Kandinsky

// Space setup
void setup (){
  size (500,400);
 
}

//Function for circles

 void CirclesArea () {
  
  //Circles

  //yellow glow
    fill(222,227,26,80);
    strokeWeight(0);
    stroke (222,227,26);
    ellipse (200,200,130,130);
    
  //red circle
   stroke(242,106,91);
  strokeWeight(6);
  fill(241,90,73,80);
  ellipse (110,120,240,240);
  
  //exterior glow 
  noStroke();
  fill(233,126,20,50);
  ellipse (110,120,260,260);
  
  //red  small circle
  stroke(192,27,3);
  fill(192,27,3);
  ellipse (200,200,80,80);
  
  //black circle
  stroke(0,0,0);
  fill(0);
  ellipse (110,120,200,200);
  
  //purple circle
  stroke(64,0,64);
  fill(64,0,64);
  ellipse (110,120,100,100);
  
}

//Function for blue area and lines

 void BlueareaANDlines () {
   
   //Blue area
  
  noStroke();
  fill(51,146,151,60);
  triangle(90,400,340,150,650,400);
  
   
  //lines
  stroke(0);
  strokeWeight(1);
  line(180,310,340,150); //big triangle
  line(340,148,500,280);
  line(340,40,340,220); //vertical line
    noStroke();
  fill(222,227,26,40); 
  rect (337,40,8,185); //glow
  
  
  stroke(0);
  strokeWeight(1);
  line(300,40,430,100); //oblicuous line
  noStroke();
  fill(222,227,26,40); 
  quad (300,35,300,45,415,100,415,90);  //glow
  
  stroke(0);
  strokeWeight(1);
  line(315,100,380,100); //horizontal 1
  noStroke();
  fill(222,227,26,40); 
  rect(320,100,70,5); //glow
  
  stroke(0);
  strokeWeight(1);
  line(320,115,390,115); //horizontal 2
  noStroke();
  fill(222,227,26,40);
  rect(325,115,70,5); //glow
  
  stroke(0); //inclined line
  strokeWeight(1);
  line(110,310,480,200);
  noStroke();
  fill(222,227,26,40);
  quad(110,310,110,315,480,200,485,205); //glow
  
 }
 
 //Function for Curves

 void Curves () {
   
   //curves
  
  // center arc
  
  noFill ();
  stroke (0);
  strokeWeight(3);
  arc(285,120, 190,170, 0, PI/2);
  arc(285,120, 190,165, 0, PI/2);
  arc(285,120, 190,160, 0, PI/2);
  arc(285,120, 190,155, 0, PI/2);
  arc(285,120, 190,150, 0, PI/2);
  arc(285,120, 190,145, 0, PI/2);

  //1. CONTINUOUS CURVE
//First section  
beginShape (); 

noFill();
smooth ();
strokeWeight(3);
curveVertex (155, 350); // beginning-point section 1
curveVertex (155, 350); 

//s.p.= smoothing point

curveVertex (138, 330); //s.p.

curveVertex (128, 290); //s.p.

curveVertex (150, 268); // first important turn-point

curveVertex (190, 283); // second important turn-point

curveVertex (230, 300); //lower curve
curveVertex (257, 290); //s.p.

curveVertex (267, 266); 
curveVertex (267, 266); // end-point

endShape ();

//Second section  
beginShape (); //continuous curve

noFill();
strokeWeight(2);
curveVertex (267, 266); // beginning-point section 1
curveVertex (267,266); 

curveVertex (273, 250); //s.p.
curveVertex (295, 237); //upper curve
curveVertex (320, 245);//s.p.

curveVertex (340, 260); //lower curve
curveVertex (360, 255); //s.p.

curveVertex (375, 233); 
curveVertex (375, 233); // end-point

endShape ();

//Last section 
beginShape (); //continuous curve

noFill();
strokeWeight(1.5);
curveVertex (374,233); // beginning-point section 1
curveVertex (374,233); 

curveVertex (400,210); //upper curve
curveVertex (445,192);//s.p.

curveVertex (490, 190); 
curveVertex (490, 190); // end-point

endShape ();

 //2. CURVES IN RIGHT SIDE
 
   //curve 1
 beginShape (); 

strokeWeight(1.5);
curveVertex (500,50); // beginning-point section 1
curveVertex (500,50); 


curveVertex (475,80); //s.p.
curveVertex (465,96);//s.p.
curveVertex (445,140);//s.p.

curveVertex (440,170); 
curveVertex (440,170); // end-point

endShape ();
 
 //curve 2
 beginShape (); 

strokeWeight(1);
curveVertex (500,90); // beginning-point section 1
curveVertex (500,90); 


curveVertex (480,110); //s.p.
curveVertex (460,140); //s.p.

curveVertex (450,180); 
curveVertex (450,180); // end-point

endShape ();

 //Ellipses on right side
 
 noStroke();  
 fill(247,193,83,100);
 ellipse(510,160,60,70); //glow
 
 stroke(0);
 fill(255);
 ellipse(510,160,50,60); //white ellipse
 
 stroke(0);
 fill(0);
 ellipse(510,160,25,30);  //black ellipse
 
 //glow for big black square
 noStroke (); //glow
  fill(232,234,153);
  quad(270,310,205,430,310,410,330,380);
  

 //small ellipses: first part
  
  noStroke();
  fill(232,234,153); 
  ellipse (325,360,60,80); //glow
  
   noStroke();//purple
  fill(219,164,223); 
  ellipse (325,360,58,70);
  
  noStroke();//white
  fill(255); 
  ellipse (325,360,52,65);
  
  noStroke();//green
  fill(27,63,12); 
  ellipse (325,360,48,53);
  
  stroke(0);//white
  fill(255); 
  ellipse (325,360,38,41);
  
  //small ellipses: second part
  
  noStroke();
  fill(232,234,153); 
  arc (410,360,80,80,PI,TWO_PI); //glow
  
  noStroke();
  fill(219,164,223); 
  arc (410,360,76,76,PI,TWO_PI); //purple
  
   noStroke();
  fill(255); 
  arc (410,360,74,74,PI,TWO_PI); //white
  
  noStroke();
  fill(51,146,151,100); 
  arc (410,363,60,50,PI,TWO_PI); //blue
  
  noStroke();
  fill(255); 
  ellipse (405,363,40,40); //white
  
  stroke(0);
  noFill(); 
  ellipse (405,363,25,25); //circle line
 
 }
  
  //Function for Black and white area

 void BlackANDwhite () { 
   
   //Black and white

   stroke (0); //big black square
  fill(0);
  quad(270,320,250,360,310,410,330,380);
  
  stroke (0); //big white square
  fill(255);
  quad(250,360,235,390,270,430,310,410);
  
  stroke (0); //green square
  fill(27,63,12);
  quad(235,390,210,430,300,410,260,410);
  
  stroke (0); //white triangle in bottom
  fill(255);
  quad(330,380,310,410,350,420,360,410);
  
  stroke (0); 
  fill(0);
  quad(340,365,330,380,360,410,375,395);
  
  stroke (0); //white square between 2 black squares
  strokeWeight(2);
  fill(255);
  quad(350,352,340,365,375,395,385,382);
  
  stroke (0); //black corner diamond
  strokeWeight(0);
  fill(0);
  quad(365,330,349,352,386,383,405,370);
  
  stroke (0); //small triangle 1
  fill(255);
  triangle(376,394,358,410,400,410);
  
  stroke (0); //small black diamond
  fill(0);
  quad(385,382,375,395,388,405,398,394);
  
  stroke (0); //large white diamond
  strokeWeight(1); 
  fill(255);
  quad(452,310,385,382,395,391,458,318);
  
  strokeWeight(1.5);
  line (400,367,409,375);
  line (428,335,437,343);
  
  stroke (0); 
  fill(0);
  quad(470,290,452,310,458,318,476,298);
  
  stroke (0); //small triangle 2
  fill(255);
  triangle(396,394,378,410,420,410);
  
  stroke (0); //brown diamond
  strokeWeight(1); 
  fill(128,64,0);
  quad(410,375,395,391,408,403,422,387);
  
  stroke (0); //white lower
  strokeWeight(1); 
  fill(255);
  quad(437,343,410,375,422,387,449,355);
  
  stroke (0); //black lower
  fill(0);
  quad(458,319,437,343,449,355,469,332);
  
  stroke (0); //white small near corner
  strokeWeight(1); 
  fill(255);
  quad(477,298,458,319,469,332,487,309);
  
  stroke (0); //black small near corner
    fill(0);
  quad(495,275,477,298,487,309,505,285);
  
  strokeWeight(2);
  line (495,275,500,268);
}

void draw () {
   background (255,233,185);
  smooth ();
  
 CirclesArea ();
 BlueareaANDlines ();   
 Curves (); 
 BlackANDwhite ();
 
}
  
  

  
  
  


