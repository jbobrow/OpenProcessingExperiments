
int x = 180;
int y = 225;
int spatieh = 50;
int spatiev = 75;
int spatie = 225;
int richting = 5;

void setup () {
  size (800, 350);
}

void draw () {
  background (50);  
  hartjesGrid ();
  stroke (0) ;
  for (int h = -10; h < width - 180; h = h + spatie){
   mannetje (h + 180);
   vrouwtje (h + 180);
  }
}

void mannetje (int x) {
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
  line (x-100, y+15, x-50, y-15);                      // arm links
  line (x-50, y-15, x, y);                            // arm rechts
  fill (200,55,0);                                    // bruin
  rect (x-100, y+25, 100, 40);                        // broekje
  line (x-50, y+55, x-50, y+65);                      // lijn broekje
  fill (0);                                           // zwart
  rect (x-100, y+25, 100, 10);                        // riem 
  fill (125);                                         // grijs
  rect (x-60, y +25,20,10);                           // gesp
  fill (0);                                           // zwart
  rect (x-56, y+29, 12,2);                            // riem
  line (x-75, y+65, x-75, y+85);                      // been links
  line (x-25, y+65, x-25, y+85);                      // been rechts
}

void vrouwtje (int x) {
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
  line (x, y, x+50, y-15);                            // arm links
  line (x+95, y-15, x+125, y+15);                     // arm rechts
  fill (10);                                          // grijs/zwart
  rect (x+45, y+25, 50, 40);                          // rokje
  fill (125, 0, 130);                                 // paars
  rect (x+45, y-20, 50, 45);                          // truitje
  fill (108,23,8);                                    // rood/bruin
  rect (x+45, y+25, 50, 10);                          // riem
  fill (10);                                          // grijs/zwart 
  rect (x+60, y+25, 20, 10);                          // gesp
  fill (108,23,8);                                    // rood/bruin
  rect (x+65, y+29, 10, 3);                           // riem
  line (x+55, y+65, x+55, y+85);                      // been links
  line (x+85, y+65, x+85, y+85);                      // been rechts
}

void hartjesGrid () {
  for (int i = 40; i < height + 50; i = i + spatiev) {
    for (int j = width + 20; j > 50 ; j = j - spatieh) { 
      stroke (j, 10, 390 - j);
      fill (j, 10, 390 - j);                             
      ellipse(j-57, i - 25, 27, 25);                   
      ellipse(j-32, i - 25, 27, 25);                   
      triangle(j-69.5, i - 20, j - 44.5, i + 5, j-18.5, i - 21); 
    } 
  }
}
