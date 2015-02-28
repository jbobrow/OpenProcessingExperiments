
/* add type?
 whats the approach?
 Didot-48.vlw
 */
//PShape e;

//Fonts
PFont did; 

//function floats
float angle = 0.0;
float speed = 0.05;
float easing = .08;
float ad = 0.00;
//Move
float mov; 
//stroke floats
float gr;
float mx;
float mp;
float st;
//fill floats
float f;
int i;




void setup() {
  size (1275, 800);
  smooth();
  shapeMode (CENTER);
  //e = loadShape ("dlogo.svg");
  did = loadFont ("Didot-48.vlw");
  textFont (did);
}



void draw() {



  //Main Control
  background (255);

if (mouseX>=900) {
    //for (int i=1; i<200; i+=1) {
    mov+=mov+.01;
  }

  //ETL
  f = map (mouseX, 0, 1275, -200, 150);
  fill(0, 100, 100, f-mov/3);
  //mov= 1;
  text ("e", 290+mov, height/2-40); 
  text ("t", 549, height/2-40);
  text ("l", 800-mov, height/2-40);  
  


  println (mov);
  fill(0, 3);

  //Far Right
  e(width-795.2, height/6, 100, 0, .7);

  //Far Left
  e(-30, height/6, 0, 100, .7); 

  //Center
  e(903.5, height-165, 80, 80, -.7); 

  angle += speed;
  ad += 0.08;
  
}





//e shape function
void e (float x, float y, float sl, float sr, float sca) {


  //Active floats
  gr = dist (width/2, 0, mouseX, 0);
  gr = width/2-gr;
  //Stroke var
  st = map (gr, 0, width/2, 0, 70);

  //clean fade
  //  noStroke();
  //  fill (255, 55-gr);
  //  ellipse (mouseX, mouseY, 600, 600); 

  pushMatrix();

  //controls

  translate (x, y);
  scale(sca);
  //left bottom
  block(35, 620, radians(30), -20, 0, 0, 10, st-sl); 
  block(111, 653, radians (16), 0, 1, 0, 0, st-sl/1.15);
  block (185, 670, radians (10), 5, 2, 0, 8, st-sl/2);
  block (265, 677, radians (0), 3, 2.5, 0, 10, st-sl/3);
  block (349, 660, radians(335), 0, -6, -3, 8, st-sl/4);
  block (420, 615, radians(321), -2, -3, 0, 0, st);
  block (480, 565, radians (318), 3, 0, 0, 3, st); //center bottom

  //Right top
  block (536, 509, radians (312), 4, 0, 0, 3, st);
  block (588, 448, radians (309), 2, 1, 0, 10, st);
  block (634, 377, radians (295), 0, 0, 0, 10, st);
  block (659, 298, radians (279), 0, 1, 0, 13, st);
  block (659, 213, radians (259), 1, 0, 0, 20, st);
  block (622, 134, radians (228), 0, -2, 3, 15, st);
  block (557, 85, radians (200), 10, 0, 0, 0, st);
  block (478, 71, radians (180), 5, -8, 1, 15, st); //center top

  //left top
  block (400, 93, radians (143), 8, -3, -3, 0, st);
  block (342, 144, radians (135), 3, 0, 0, 5, st);
  block (303, 208, radians (105), 12, -3, -1, 6, st);
  block (305, 295, radians (75), 0, -15, 0, 0, st);
  block (331, 370, radians (68), 1, -2, 0, 0, st);
  block (368, 440, radians (57), 3, -4, 0, 10, st);
  block (420, 503, radians (44), 2, 3, 0, -9, st);
  block (475.5, 559, radians (47), 0, -8, 0, 7, st);//center bottom2
  block (538, 617, radians (38), -2, -2, 0, 5, st-sr/4);
  block (611, 662, radians (25), -2, -5, 2, 15, st-sr/3);
  block (695, 682, radians (0), 0, -2, 0, 0, st-sr/2);
  block (775, 681, radians(355), 0, 0, -7, 5, st-sr/1.8);
  block (852, 664, radians (340), 0, -3, 0, 14, st-sr/1.15);
  block (931, 627, radians (330), -3, 2, 0, 0, st-sr);


  popMatrix();
}  





//Line Tesolation Funtion

void block (float x, float y, float rot, float tpx, float btx, float tpx2, float btx2, float s) {

  //new variables
  float cy; 
  float sy;

  float noiy; 

  //New Tesa

  cy = cos (ad)*20;
  sy = sin (ad)*20;
  noiy = 1.7 * noise (ad/5) *35;





  pushMatrix();
  translate (x, y);
  rotate (rot);

  //bacground pattern (add with love);

  fill(250, s/8);
  strokeWeight(.3);
  stroke (0, 200, 200, s);
  //rect ((s/8), (s/4), width, height);
  strokeWeight(1);

  stroke (0, 200, 200, s);
  //rect ((s/8), (s/4), width, height);

  // first shape 
  beginShape();
  vertex((tpx)-40, -20);
  vertex (0-noiy, 1+cy);
  vertex((btx)-40, +20);
  endShape ();

  beginShape();
  vertex((tpx2)+40, -20);
  vertex (0-noiy, 1+cy);
  vertex((btx2)+40, +20);
  endShape ();

  //Second Pattern
  beginShape();
  vertex((tpx)-40, -20);
  vertex (0+noiy, 1+sy);
  vertex((btx)-40, +20);
  endShape ();

  beginShape();
  vertex((tpx2)+40, -20);
  vertex (0+noiy, 1+sy);
  vertex((btx2)+40, +20);
  endShape ();

  /*right end
   beginShape();
   vertex(40,-20);
   vertex (80/*+noiy,(sty)+1/*+sy);
   vertex(40,20);
   endShape ();
   */

  stroke(0, 200, 200, s);
  //Cue me in after done and smile
  beginShape();
  vertex(-40, -20);
  vertex (-10+noiy/16, 1+sy);
  vertex(-40, 20);
  endShape ();


  /*forget me left end
   beginShape();
   vertex(-40, -20);
   vertex (-80/*-noiy,(eny)+1/*+sy);
   vertex(-40, 20);
   endShape ();*/

  //Cue me in after done and smile
  beginShape();
  vertex(40, -20);
  vertex (-10-noiy/16, 1+sy);
  vertex(40, 20);
  endShape ();



  popMatrix();
}


