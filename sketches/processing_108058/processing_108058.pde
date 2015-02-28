
  //      CTIN 506: Fundamentals of Procedural Media
  
  //                    HOW TO DRAW A CONSOLE
  
  //                  
  //                    by: Austin Drexler
void setup(){
  
  size(640,480);
  background(255,200,0);
 
  //    BODY SHAPE DEPTH
  rectMode(CENTER);
  fill(0,120,100);
  rect(303,262,327,410,18,30,18,41);
  
  //    BODY MAIN LAYER
  rectMode(CENTER);
  fill(0,220,200);
  rect(320,270,300,400,18);
  
  //    SCREEN UNDERLAY
  rectMode(CENTER);
  strokeWeight(2);
  fill(75,150,150);
  rect(322,202,229,185,18);
  
  //    SCREEN
  rectMode(CENTER);
  noStroke();
  fill(125,225,225);
  rect(320,200,225,180,18);
  
  //    FACE
  fill(0);
  ellipse(262,175,36,36);
  ellipse(378,175,35.5,35.5);
  stroke(0);
  strokeWeight(15);
  line(285,220,357,220);
  
  //    SLOT
  
  fill(0,100,80);
  strokeWeight(2);
  rect(285,325,130,25);
  
  fill(0,75,50);
  strokeWeight(.8);
  rect(285,323,127,20);
  
  //    BUTTONS
  
  //      BLUE CIRCLE
  fill(0,0,255);
  strokeWeight(1);
  ellipse(400,325,20,20);
  //      TURQOISE TRIANGLE
  fill(0,130,130);
  triangle(358,349,375,375,342,375);  
  
  fill(0,230,230);
  triangle(360,350,375,375,345,375); 
  //      GREEN CIRCLE
  fill(0,130,0);
  ellipse(413,374,22,22); 
  fill(0,230,0);
  ellipse(415,375,22,22); 
  //      RED  CIRCLE
  fill(130,0,25);
  ellipse(383,409,35,35);
  fill(230,0,75);
  ellipse(385,410,35,35);
  
  //    D-PAD
  //      Underlay
  noFill();
  strokeWeight(1);
  rectMode(CENTER);
  rect(252,387,25,55); 
  rectMode(CENTER);
  rect(252,387,55,25);
  fill(140,140,0);
  noStroke();
  rectMode(CENTER);
  rect(252,387,25,55); 
  rectMode(CENTER);
  rect(252,387,55,25);
  //      Top            *** overly complicated ***
  fill(1);
  strokeWeight(3);
  rectMode(CENTER);
  rect(255,390,25,55); 
  rectMode(CENTER);
  rect(255,390,55,25);
  fill(240,240,0);
  noStroke();
  rectMode(CENTER);
  rect(255,390,25,55); 
  rectMode(CENTER);
  rect(255,390,55,25);
  
  //     OPTION BUTTONS
  stroke(20,0,40);
  strokeWeight(10);
  line(225,450,250,450);
  line(275,450,300,450);
  
}
//void keyPressed(){
//   print("mouseX: " + mouseX + "  mouseY: " + mouseY);
//}


