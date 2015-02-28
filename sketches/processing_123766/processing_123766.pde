
int x = 180;
int y = 175;
int richting = 5;
int teller = 0;
boolean test = true;

void setup () {
  size (600, 300);
}

void draw () {
  background (255);
  if (test == true) {
      fill(255,0,0);
  }
  if (test == false) {
      fill (0, 0, 255);
  }    
  text (teller, 15, 25);
  textSize (15);
  
    
// mannetje

  line (x-60, y-140, x-50, y-125);                    // haarspriet links
  line (x-50, y-145, x-50, y-125);                    // haarspriet midden
  line (x-40, y-140, x-50, y-125);                    // haarspriet rechts
  fill (200);                                         // licht grijs
  ellipse (x-50, y-75, 100, 100);                     // hoofd  
  fill (255);                                         // wit
  ellipse (x-70, y-75, 40, 80);                       // oog links
  ellipse (x-30, y-75, 40, 80);                       // oog rechts
  fill (0);                                           // zwart
  ellipse (x-65, y-55, 15, 30);                       // pupil links
  ellipse (x-35, y-55, 15, 30);                       // pupil rechts
  noFill ();                                          // geen kleur
  line (x-50, y-25, x-50, y+25);                      // lijfje
  line (x-90, y+15, x-50, y-15);                      // arm links
  line (x-50, y-15, x, y);                            // arm rechts
  
  if (test == true) {
    fill (200,55,0);                                  // bruin
  }
  if (test == false) {                                // blauw
    fill (75, 0, 180);
  }
  
  rect (x-100, y+25, 100, 40);                        // broekje
  line (x-50, y+55, x-50, y+65);                      // lijn broekje
  
  if (test == true) {
    fill (0);                                         // zwart
  }
  if (test == false) {
    fill (25);                                        // donker grijs
  }
  
  rect (x-100, y+25, 100, 10);                        // riem 
  fill (125);                                         // grijs
  rect (x-60, y +25,20,10);                           // gesp
 
  if (test == true) {
    fill (0);                                         // zwart
  }
  if (test == false) {
    fill (25);                                        // donker grijs
  }
  
  rect (x-56, y+29, 12,2);                            // riem
  line (x-75, y+65, x-75, y+85);                      // been links
  line (x-25, y+65, x-25, y+85);                      // been rechts
  
// vrouwtje

  line (x+20, y-75, x+20, y-25);                      // haar links
  line (x+120, y-75, x+120, y-25);                    // haar rechts
  fill (200);                                         // licht grijs
  ellipse (x+70, y-75, 100, 100);                     // hoofd  
  fill (255);                                         // wit
  ellipse (x+90, y-75, 40, 80);                       // oog links
  ellipse (x+50, y-75, 40, 80);                       // oog rechts
  fill (0);                                           // zwart
  ellipse (x+55, y-55, 15, 30);                       // pupil links
  ellipse (x+85, y-55, 15, 30);                       // pupil rechts 
  noFill ();                                          // geen kleur
  line (x+70, y-25, x+70, y-20);                      // nek
  line (x-5, y, x+50, y-15);                          // arm links
  line (x+95, y-15, x+120, y+25);                     // arm rechts
  
  if (test == true) {
    fill (25);                                        // donker grijs
  }
  if (test == false) {
    fill (75);                                        // licht grijs
  }
  
  rect (x+45, y+25, 50, 40);                          // rokje
  
  if (test == true) {
    fill (255,0,0);                                   // rood
  } 
  if (test == false) {
    fill (135, 0, 120);                               // paars
  }
  
  rect (x+45, y-20, 50, 45);                          // truitje
  
  if (test == true) {
    fill (108,23,8);                                  // rood/bruin
  }
  if (test == false) {
    fill (25);                                        // donker grijs
  }
  
  rect (x+45, y+25, 50, 10);                          // riem
  fill (50);                                          // donker grijs
  rect (x+60, y+25, 20, 10);                          // gesp
  
  if (test == true) {
    fill (108,23,8);                                  // rood/bruin
  }
  if (test == false) {
    fill (25);                                        // donker grijs
  }
  
  rect (x+65, y+29, 10, 3);                           // riem
  line (x+55, y+65, x+55, y+85);                      // been links
  line (x+85, y+65, x+85, y+85);                      // been rechts
  
  x = x + richting; 
  
  if (x < 100 || x > 475) {
    richting = -richting;
    teller = teller + 1;
  }
  
  if (teller == 10) {
    test = !test;  
    teller = 0;
  }  
  
}
