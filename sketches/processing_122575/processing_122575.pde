
int y = 175;

void setup () {
  size (400, 300);
}

void draw () {
  background (255);
  
// mannetje

  line (mouseX-60, y-140, mouseX-50, y-125);                    // haarspriet links
  line (mouseX-50, y-145, mouseX-50, y-125);                    // haarspriet midden
  line (mouseX-40, y-140, mouseX-50, y-125);                    // haarspriet rechts
  fill (200);                                                   // licht grijs
  ellipse (mouseX-50, y-75, 100, 100);                          // hoofd  
  fill (255);                                                   // wit
  ellipse (mouseX-70, y-75, 40, 80);                            // oog links
  ellipse (mouseX-30, y-75, 40, 80);                            // oog rechts
  fill (0);                                                     // zwart
  ellipse (mouseX-65, y-55, 15, 30);                            // pupil links
  ellipse (mouseX-35, y-55, 15, 30);                            // pupil rechts
  noFill ();                                                    // geen kleur
  line (mouseX-50, y-25, mouseX-50, y+25);                      // lijfje
  line (mouseX-90, y+15, mouseX-50, y-15);                      // arm links
  line (mouseX-50, y-15, mouseX, y);                            // arm rechts
  fill (200,55,0);                                              // bruin
  rect (mouseX-100, y+25, 100, 40);                             // broekje
  line (mouseX-50, y+55, mouseX-50, y+65);                      // lijn broekje
  fill (0);                                                     // zwart
  rect (mouseX-100, y+25, 100, 10);                             // riem 
  fill (125);                                                   // grijs
  rect (mouseX-60, y +25,20,10);                                // gesp
  fill (0);                                                     // zwart
  rect (mouseX-56, y+29, 12,2);                                 // riem
  line (mouseX-75, y+65, mouseX-75, y+85);                      // been links
  line (mouseX-25, y+65, mouseX-25, y+85);                      // been rechts
  
// vrouwtje

  line (mouseX+20, y-75, mouseX+20, y-25);                      // haar links
  line (mouseX+120, y-75, mouseX+120, y-25);                    // haar rechts
  fill (200);                                                   // licht grijs
  ellipse (mouseX+70, y-75, 100, 100);                          // hoofd  
  fill (255);                                                   // wit
  ellipse (mouseX+90, y-75, 40, 80);                            // oog links
  ellipse (mouseX+50, y-75, 40, 80);                            // oog rechts
  fill (0);                                                     // zwart
  ellipse (mouseX+55, y-55, 15, 30);                            // pupil links
  ellipse (mouseX+85, y-55, 15, 30);                            // pupil rechts 
  noFill ();                                                    // geen kleur
  line (mouseX+70, y-25, mouseX+70, y-20);                      // nek
  line (mouseX-5, y, mouseX+50, y-15);                          // arm links
  line (mouseX+95, y-15, mouseX+120, y+25);                     // arm rechts
  fill (50);                                                    // donker grijs
  rect (mouseX+45, y+25, 50, 40);                               // rokje
  fill (255,0,0);                                               // rood
  rect (mouseX+45, y-20, 50, 45);                               // truitje
  fill (108,23,8);                                              // rood/bruin
  rect (mouseX+45, y+25, 50, 10);                               // riem
  fill (50);                                                    // donker grijs
  rect (mouseX+60, y+25, 20, 10);                               // gesp
  fill (108,23,8);                                              // rood/bruin
  rect (mouseX+65, y+29, 10, 3);                                // riem
  line (mouseX+55, y+65, mouseX+55, y+85);                      // been links
  line (mouseX+85, y+65, mouseX+85, y+85);                      // been rechts
  
  y--;
  
  if (y == -100) {
    y = 500;
  }
  
}

