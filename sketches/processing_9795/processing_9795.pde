
/*

   LocusProblem.pde
   by Greg Recco, May 19, 2010 (version 0.2)
   A tool for exploring Descartes' general solution to 
   the four-line locus problem (*Geometry*, Dover [1954],
   pp. 26-34, 60-80).
   
   The problem is to find the locus of points such that 
   lines dropped at given angles to given lines stand 
   in a certain relationship, namely, that the product 
   of the lengths of two is in a constant ratio (in this
   case, of equality) to the product of the lengths of 
   the other two. In general, such a locus is a conic 
   section.
   
   The given lines are drawn in black, the dropped lines 
   in green, and the locus itself appears in red. 
   Controls on the left allow any of the nine parameters 
   to be adjusted; the green buttons increase the angle
   or length, while the red ones decrease it. The blue 
   buttons are for animating the steady changing any of
   the angles stated in the problem. Given lines and 
   dropped lines may be toggled on or off.
   
   The default sketch is from Descartes' own example of
   such a problem (76), one whose solution is a circle.
   The names for points are given on his page 27. 
   
   KNOWN PROBLEMS: 1) portions of the locus whose 
   tangents are parallel to the principal dropped line 
   CB are not being drawn. 2) Values of angles very close
   to critical points (such as 180 degrees) produce 
   pathological results. (A useful reminder of the limited
   precision of the calculations.) 3) Most seriously, the 
   ratio between the products of the dropped lines is not 
   always equal. This is likely due to certain shortcuts 
   that effectively ignore the differing configurations and 
   orderings of the intersections of given and dropped 
   lines, but it could be a more fundamental error.
   
   Any comments, questions, or corrections would be greatly 
   appreciated. You can e-mail the author at: 
       
       greg.recco@sjca.edu
   
*/
int size_x = 700; int size_y = 700; 
int ctr_x = 350; int ctr_y = 350;
float bad, bef, xgh; float x_from_a, ae, ag; int my_ab;
float cba, cfs, cht, cdr;
PFont font;
float b, c, d, e, f, g, k, l, m, n, o, p;
int rectSize = 12; boolean fine = false; boolean update = true;
boolean given = true; boolean dropped = true;
boolean an_bad = false; boolean an_bef = false; boolean an_xgh = false;
boolean an_cba = false; boolean an_cfs = false; boolean an_cht = false; boolean an_cdr = false;
float inc = radians(0.1);

void setup()
{
  background(195);
  smooth();
//  size(size_x, size_y);
  size(700,700);
  font = loadFont("Monospaced-12.vlw"); 
  // principal lines, in reference to horizontal center line
  bad = radians(120.0); x_from_a = 0;
  bef = radians(150.0); ae = -90; // we simplify and assume AD, EF, and GH cross AB 
  xgh = radians(30.0); ag = 150;
  my_ab = int(ag/2);

  // angles for dropped lines
  cba = radians(120.0); cfs = radians(30.0);
  cht = radians(48.5); cdr = radians(35.0);
}

void draw() // main loop
{

  if(an_bad||an_bef||an_xgh||an_cba||an_cfs||an_cht||an_cdr) {
    update = true;
    if(an_bad) { bad = (2*PI + bad + inc)%(2*PI); }
    if(an_bef) { bef = (2*PI + bef + inc)%(2*PI); }
    if(an_xgh) { xgh = (2*PI + xgh + inc)%(2*PI); }
    if(an_cba) { cba = (2*PI + cba + inc)%(2*PI); }
    if(an_cfs) { cfs = (2*PI + cfs + inc)%(2*PI); }
    if(an_cht) { cht = (2*PI + cht + inc)%(2*PI); }
    if(an_cdr) { cdr = (2*PI + cdr + inc)%(2*PI); }
  }

  if (update) {
    background(195);
    if (given) { given_lines(); }
    b = sin( PI - bad ) / sin( bad - PI + cba );
    c = sin( bad + cba - PI ) / sin( cdr );
    d = sin( PI - bef ) / sin (PI - ((PI-cba) + (PI-bef)));// sin ( bef - PI + cba );
    e = sin( PI - ((PI-cba) + (PI-bef)) ) / sin ( cfs );
    f = sin( xgh ) / sin ( PI - cba - xgh );
    g = sin ( PI - cba - xgh ) / sin ( cht );
    k = abs(ae); l = ag; my_ab = int(ag/2);
    m = ((c*f*l*g) - (d*e*k)) / 2*(e - c*g);
    n = ( (d*e) + (c*f*g) - (b*c*g) ) / 2*(e - c*g);
    o = -2*m*n + (b*c*f*g*l) / (e - c*g);
    p = m*n*n - (m*b*c*f*g) / (e - c*g);
    draw_curve(m,n,o,p,cba);
    update_numbers();
    boxes();
  }
  update = false;
}

void draw_line( float x1, float y1, float the_angle, float length ) {
  line( x1, y1, x1 + length*cos(the_angle), y1 + length*sin(the_angle) );
}

void draw_curve( float m, float n, float o, float p, float cba ) {
  float y1a, y2a, y1b, y2b;
  color cl; cl = color(255, 0, 0);
  stroke(cl);
  for( int x = -1 * ctr_x; x < ctr_x; x = x+1 ) {
    int xa = x; int xb = x+1;
    y1a = m - n*xa + sqrt( m*m + o*xa + (p/m)*xa*xa );
    y2a = m - n*xa - sqrt( m*m + o*xa + (p/m)*xa*xa );
    y1b = m - n*xb + sqrt( m*m + o*xb + (p/m)*xb*xb );
    y2b = m - n*xb - sqrt( m*m + o*xb + (p/m)*xb*xb );
    line( xa + y1a*cos(PI-cba) + ctr_x, y1a*sin(PI-cba) + ctr_y, 
    xb + y1b*cos(PI-cba) + ctr_x, y1b*sin(PI-cba) + ctr_y );
    line( xa + y2a*cos(PI-cba) + ctr_x, y2a*sin(PI-cba) + ctr_y,
    xb + y2b*cos(PI-cba) + ctr_x, y2b*sin(PI-cba) + ctr_y );
  }
  if (dropped) {
    // draw dropped line CB
    float my_y1 = m - n*my_ab + sqrt( m*m + o*my_ab + (p/m)*my_ab*my_ab );
    float my_x1 = my_ab + my_y1*cos(PI-cba) + ctr_x;
    stroke(50,110,0); line(my_x1, my_y1*sin(PI-cba)+ctr_y, my_ab+ctr_x, ctr_y);
  
    // dropped line CD
    float gamma_cd = 2*PI - (cba + bad + cdr);
    float length_cd = c*my_y1 + b*c*my_ab;
    draw_line(my_x1, my_y1*sin(PI-cba)+ctr_y, -1*cba-gamma_cd, length_cd);
  
    // dropped line CF
    float gamma_cf = 2*PI - (cba + bef + cfs);
    float length_cf = e*my_y1 + d*e*k + d*e*my_ab;
    draw_line(my_x1, my_y1*sin(PI-cba)+ctr_y, -1*cba-gamma_cf, length_cf );
  
    // dropped line CH
    float gamma_ch = 2*PI - ( (PI-cba) + (PI-xgh) + cht );
    float length_ch = g*my_y1 + f*g*l - f*g*my_ab;
    draw_line(my_x1, my_y1*sin(PI-cba)+ctr_y, (PI-cba)+gamma_ch-PI, length_ch);

//    Problem here: it appears the ratio does not remain constant.    
//    String ratio = nf((my_y1*length_cf)/(length_cd*length_ch),1,2);
//    text("ratio: " + ratio, 585, 80);
  }
}

void boxes() {
  stroke(0); fill(255);
  if (!given) { fill(100); }
  rect(30, 40, rectSize, rectSize); // Given lines
  fill(255);                        //    col 2 row 3

  if(!dropped) { fill(100); }
  rect(30, 100, rectSize, rectSize); // Dropped lines
  fill(255);                         //    col 2 row 7

  fill(255,100,100);
  rect(15, 10, rectSize, rectSize); // AE col 1 row 1
  rect(15, 25, rectSize, rectSize); // AG col 1 row 2
  rect(15, 55, rectSize, rectSize); // BEF col 1 row 4
  rect(15, 70, rectSize, rectSize); // BAD col 1 row 5
  rect(15, 85, rectSize, rectSize); // TGB col 1 row 6
  rect(15, 115, rectSize, rectSize); // CBA col 1 row 8
  rect(15, 130, rectSize, rectSize); // CFS col 1 row 9
  rect(15, 145, rectSize, rectSize); // CHT col 1 row 10
  rect(15, 160, rectSize, rectSize); // CDR col 1 row 11

  fill(100,255,100);
  rect(30, 10, rectSize, rectSize); // AE col 2 row 1
  rect(30, 25, rectSize, rectSize); // AG col 2 row 2
  rect(30, 55, rectSize, rectSize); // BEF col 2 row 4
  rect(30, 70, rectSize, rectSize); // BAD col 2 row 5
  rect(30, 85, rectSize, rectSize); // TGB col 2 row 6
  rect(30, 115, rectSize, rectSize); // CBA col 2 row 8
  rect(30, 130, rectSize, rectSize); // CFS col 2 row 9
  rect(30, 145, rectSize, rectSize); // CHT col 2 row 10
  rect(30, 160, rectSize, rectSize); // CDR col 2 row 11

  color an = color(100,100,255); color no_an = color(50,50,126);
  if(an_bef) { fill(an); } else { fill(no_an); }
  rect(45, 55, rectSize, rectSize); // BEF col 3 row 4
  if(an_bad) { fill(an); } else { fill(no_an); }
  rect(45, 70, rectSize, rectSize); // BAD col 3 row 5
  if(an_xgh) { fill(an); } else { fill(no_an); }
  rect(45, 85, rectSize, rectSize); // TGB col 3 row 6
  if(an_cba) { fill(an); } else { fill(no_an); }
  rect(45, 115, rectSize, rectSize); // CBA col 3 row 8
  if(an_cfs) { fill(an); } else { fill(no_an); }
  rect(45, 130, rectSize, rectSize); // CFS col 3 row 9
  if(an_cht) { fill(an); } else { fill(no_an); }
  rect(45, 145, rectSize, rectSize); // CHT col 3 row 10
  if(an_cdr) { fill(an); } else { fill(no_an); }
  rect(45, 160, rectSize, rectSize); // CDR col 3 row 11

  if ( !fine ) { fill(100); }        // fine control
  rect(30, 175, rectSize, rectSize); //     col 2 row 12
  fill(255);
}

void mousePressed()
{
  int x = mouseX; int y = mouseY;
  int lineInc; float angleInc;
  if (!fine) { lineInc = 5; angleInc = radians(2.5); }
  else { lineInc = 1; angleInc = radians(.5); }
  if (x >= 15 && x <= 15+rectSize && y >= 10 && y <= 10+rectSize) { ae = ae - lineInc; }
  if (x >= 30 && x <= 30+rectSize && y >= 10 && y <= 10+rectSize) { ae = ae + lineInc; }
  if (x >= 15 && x <= 15+rectSize && y >= 25 && y <= 25+rectSize) { ag = ag - lineInc; }
  if (x >= 30 && x <= 30+rectSize && y >= 25 && y <= 25+rectSize) { ag = ag + lineInc; }

  if (x >= 30 && x <= 30+rectSize && y >= 40 && y <= 40+rectSize) { 
    if(given) { given = false; dropped = false; }
    else { given = true; }
  }

  if (x >= 15 && x <= 15+rectSize && y >= 55 && y <= 55+rectSize) { bef = (2*PI + bef - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 55 && y <= 55+rectSize) { bef = (2*PI + bef + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 55 && y <= 55+rectSize) { if(an_bef) {an_bef=false;} else {an_bef=true;} }
  if (x >= 15 && x <= 15+rectSize && y >= 70 && y <= 70+rectSize) { bad = (2*PI + bad - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 70 && y <= 70+rectSize) { bad = (2*PI + bad + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 70 && y <= 70+rectSize) { if(an_bad) {an_bad=false;} else {an_bad=true;} }
  if (x >= 15 && x <= 15+rectSize && y >= 85 && y <= 85+rectSize) { xgh = (2*PI + xgh - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 85 && y <= 85+rectSize) { xgh = (2*PI + xgh + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 85 && y <= 85+rectSize) { if(an_xgh) {an_xgh=false;} else {an_xgh=true;} }

  if (x >= 30 && x <= 30+rectSize && y >= 100 && y <= 100+rectSize) { 
    if(dropped) { dropped = false; }
    else { dropped = true; given = true;} // dropped lines only visually meaningful if given lines shown
  }
  if (x >= 15 && x <= 15+rectSize && y >= 115 && y <= 115+rectSize) { cba = (2*PI + cba - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 115 && y <= 115+rectSize) { cba = (2*PI + cba + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 115 && y <= 115+rectSize) { if(an_cba) {an_cba=false;} else {an_cba=true;} }
  if (x >= 15 && x <= 15+rectSize && y >= 130 && y <= 130+rectSize) { cfs = (2*PI + cfs - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 130 && y <= 130+rectSize) { cfs = (2*PI + cfs + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 130 && y <= 130+rectSize) { if(an_cfs) {an_cfs=false;} else {an_cfs=true;} }
  if (x >= 15 && x <= 15+rectSize && y >= 145 && y <= 145+rectSize) { cht = (2*PI + cht - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 145 && y <= 145+rectSize) { cht = (2*PI + cht + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 145 && y <= 145+rectSize) { if(an_cht) {an_cht=false;} else {an_cht=true;} }
  if (x >= 15 && x <= 15+rectSize && y >= 160 && y <= 160+rectSize) { cdr = (2*PI + cdr - angleInc)%(2*PI); }
  if (x >= 30 && x <= 30+rectSize && y >= 160 && y <= 160+rectSize) { cdr = (2*PI + cdr + angleInc)%(2*PI); }
  if (x >= 45 && x <= 45+rectSize && y >= 160 && y <= 160+rectSize) { if(an_cdr) {an_cdr=false;} else {an_cdr=true;} }
  if (x >= 30 && x <= 30+rectSize && y >= 175 && y <= 175+rectSize) { 
    if (fine) { fine = false; }
    else { fine = true ; }
  }
  update = true;
}

void given_lines() {
  stroke(0);
  line(0, ctr_y, size_x, ctr_y); // line AB extended
  draw_line( ctr_x + ag, ctr_y, xgh, 700 ); // draw_line gets point of intersection with AB 
  draw_line( ctr_x + ag, ctr_y, xgh, -700 ); // and angle (ccw from AB/positive x) 
  draw_line( ctr_x + ae, ctr_y, bef, 700 ); // and length
  draw_line( ctr_x + ae, ctr_y, bef, -700 ); 
  draw_line( ctr_x + x_from_a, ctr_y, bad, 700 );
  draw_line( ctr_x + x_from_a, ctr_y, bad, -700 );
}

void update_numbers() {
  textFont(font, 12); 
  fill(0,0,0);
  String sm = nfp(m, 1, 2);
  text("m: " + sm, 585, 20);
  String sn = nfp(n, 1, 2);
  text("n: " + sn, 585, 35);
  String so = nfp(o, 1, 2);
  text("o: " + so, 585, 50);
  String spm = nfp(p/m, 1, 2);
  text("p/m: " + spm, 585, 65);

  text("y = m - n*x ± sqrt(m^2 + o*x + (p/m)*x^2)", 215, 20);
  String sae = nfp(ae, 1, 0);
  text("AE:" + sae, 65, 20);
  String sag = nfp(ag,1,0);
  text("AG:" + sag, 65, 35);

  text("Given lines", 65, 50);
  String sbef = nf(degrees(bef), 3, 2);
  text("BEF:" + sbef, 65, 65);
  String sbad = nf(degrees(bad), 3, 2);
  text("BAD:" + sbad, 65, 80);
  String sxgh = nf(degrees(xgh), 3, 2);
  text("TGB:" + sxgh, 65, 95);
  
  text("Dropped lines", 65, 110);
  String scba = nf(degrees(cba), 3, 2);
  text("CBA:" + scba, 65, 125);
  String scfs = nf(degrees(cfs), 3, 2);
  text("CFS:" + scfs, 65, 140);
  String scht = nf(degrees(cht), 3, 2);
  text("CHT:" + scht, 65, 155);
  String scdr = nf(degrees(cdr), 3, 2);
  text("CDR:" + scdr, 65, 170);

  text("precise", 65, 185);
}

