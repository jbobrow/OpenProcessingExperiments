
//////////////////////////////////////
//                                  //
//    Generative Gestaltung         //
//    Diana Lange                   //
//    20140407                      //
//    Processing basic              //
//    Hausaufgabe_03                //
//    #504 Rumour                   //
//                                  //
//////////////////////////////////////

void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  
  int a = 340;
  int b = 400;
  int c = 460;
  
  int r1 = 120;
  int r2 = r1*2;
  int r3 = r2*2;
  
//  frameRate(1);
  smooth();
  noFill();
  strokeWeight(0.01);
  stroke(136, 159, 173);
  ellipse(a, a, r1, r1);  // 01
  ellipse(a, a, r1, r2);
  ellipse(a, a, r1, r3);
  ellipse(a, a, r2, r1);
  ellipse(a, a, r2, r2);
  ellipse(a, a, r2, r3);
  ellipse(a, a, r3, r1);
  ellipse(a, a, r3, r2);
  ellipse(a, a, r3, r3);
    
  ellipse(a, b, r1, r1);  // 02
  ellipse(a, b, r1, r2);
  ellipse(a, b, r1, r3);
  ellipse(a, b, r2, r1);
  ellipse(a, b, r2, r2);
  ellipse(a, b, r2, r3);
  ellipse(a, b, r3, r1);
  ellipse(a, b, r3, r2);
  ellipse(a, b, r3, r3);
  
  ellipse(a, c, r1, r1);  // 03
  ellipse(a, c, r1, r2);
  ellipse(a, c, r1, r3);
  ellipse(a, c, r2, r1);
  ellipse(a, c, r2, r2);
  ellipse(a, c, r2, r3);
  ellipse(a, c, r3, r1);
  ellipse(a, c, r3, r2);
  ellipse(a, c, r3, r3);
  
  ellipse(b, a, r1, r1);  // 04
  ellipse(b, a, r1, r2);
  ellipse(b, a, r1, r3);
  ellipse(b, a, r2, r1);
  ellipse(b, a, r2, r2);
  ellipse(b, a, r2, r3);
  ellipse(b, a, r3, r1);
  ellipse(b, a, r3, r2);
  ellipse(b, a, r3, r3);
  
  ellipse(b, b, r1, r1);  // 05
  ellipse(b, b, r1, r2);
  ellipse(b, b, r1, r3);
  ellipse(b, b, r2, r1);
  ellipse(b, b, r2, r2);
  ellipse(b, b, r2, r3);
  ellipse(b, b, r3, r1);
  ellipse(b, b, r3, r2);
  ellipse(b, b, r3, r3);
  
  ellipse(b, c, r1, r1);  // 06
  ellipse(b, c, r1, r2);
  ellipse(b, c, r1, r3);
  ellipse(b, c, r2, r1);
  ellipse(b, c, r2, r2);
  ellipse(b, c, r2, r3);
  ellipse(b, c, r3, r1);
  ellipse(b, c, r3, r2);
  ellipse(b, c, r3, r3);
  
  ellipse(c, a, r1, r1);  // 07
  ellipse(c, a, r1, r2);
  ellipse(c, a, r1, r3);
  ellipse(c, a, r2, r1);
  ellipse(c, a, r2, r2);
  ellipse(c, a, r2, r3);
  ellipse(c, a, r3, r1);
  ellipse(c, a, r3, r2);
  ellipse(c, a, r3, r3);
  
  ellipse(c, b, r1, r1);  // 08
  ellipse(c, b, r1, r2);
  ellipse(c, b, r1, r3);
  ellipse(c, b, r2, r1);
  ellipse(c, b, r2, r2);
  ellipse(c, b, r2, r3);
  ellipse(c, b, r3, r1);
  ellipse(c, b, r3, r2);
  ellipse(c, b, r3, r3);
  
  ellipse(c, c, r1, r1);  // 09
  ellipse(c, c, r1, r2);
  ellipse(c, c, r1, r3);
  ellipse(c, c, r2, r1);
  ellipse(c, c, r2, r2);
  ellipse(c, c, r2, r3);
  ellipse(c, c, r3, r1);
  ellipse(c, c, r3, r2);
  ellipse(c, c, r3, r3);
 
}




