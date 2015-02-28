
  /*****************************************
 * Assignment 01
 * Name:         Shuyi Lin
 * E-mail:       slin01@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    1/26/2012
 * 
 * I decided to draw Hello Kitty wearing a tank top that says Bryn Mawr College. I had many difficulties when creating the Hello Kitty's body and filling her tank top in. 
 I drew two curves and a line to create the outline for her torso before realizing that it wouldn't fill up the whole body to create her clothes.
 Therefore I proceeeded to use shapes such as rectangles and trapezoids to fill in Hello Kitty's body to form the tank top. I also played around with 
 the order of the codes.  
 ***********************************************/ 

void setup () {
  size (1000,600);
  background (255);
  smooth ();
}

void draw(){
    // red tank top
  noStroke ();
  fill (255, 0, 0); 
  rect (376, 429, 267, 20 );
  quad (572, 280, 430, 280, 400, 340, 680, 340);
  quad (600, 340, 400, 340, 378, 430, 639, 430);
  stroke (0);
  strokeWeight (8);
  fill (255);
  arc(505,280,100,100,-0.014,3.327);


  // head shape 
  bezier(358,100,239,346,775,346,645,103); 
  arc(501,70,152,66,3.806,5.480);
  
  // ears
  bezier(358,99,352,27,373,10,438,46); 
  bezier(639,86,640,8,607,12,556,45); 
  
  // eyes
  fill (0);
  ellipse (410, 180, 20, 30); 
  ellipse (590, 180, 20, 30);

  // nose
  fill (255, 200, 100);
  ellipse (500, 200, 30, 20);  

  // whiskers
  fill (255);   
  line (300, 170, 370, 170); 
  line (320, 200, 370, 190); 
  line (315, 240, 370, 210);
  line (640, 170, 710, 170); 
  line (640, 190, 700, 200); 
  line (640, 210, 700, 230); 
  
  // arms
  bezier(426,272,235,328,325,433,374,386); 
  bezier(582,275,789,328,688,435,645,390); 
  
  // torso
  stroke (0);
  fill (255, 0, 0);
  curve (669,83,436,277,371,448,440,658);
  line (371, 450, 647, 450);
  curve(268,99,572,276,647,450,584,696);
  
  // top of head bow
  beginShape (); 
  strokeWeight (5);
  curveVertex (779, 683);
  curveVertex (585, 62);
  curveVertex (573, 92);
  curveVertex (1184, -160);
  endShape (CLOSE);

  // bottom of head bow
  beginShape (); 
  curveVertex (-20, 440);
  curveVertex (600, 78);
  curveVertex (590, 98);
  curveVertex (400, -600);
  endShape (CLOSE);

  // middle of head bow
  ellipse (570, 75, 20, 20); 
  ellipse (610, 95, 20, 20); 
  ellipse (590, 85, 40, 40); 

  // legs
  fill (255);
  strokeWeight (8);
  arc (440, 454, 135, 150, 0.000, 3.142); 
  arc (580, 454, 135, 150, 0.000, 3.142); 

  // Bryn Mawr College Logo
  PFont font;
  font = loadFont("College-34.vlw"); 
  textFont(font); 
  fill(255);
  text("BRYN MAWR",420, 370);
  font = loadFont ("College-24.vlw");
  textFont (font);
  text ("College", 470, 395);

}

