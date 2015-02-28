
/*esperimento 2 - Psicologia della Percezione - luglio 2009
 versione beta
 studente: Giuseppe Burdo
 docente di psicologia: Prof. Emanele Arielli
 docente di informatica: Prof. Davide Rocchesso
 
 abstract: assimilazione di grandezza basato su più livelli    
 */

// PrintWriter output;

Cerchio1 myCerchio1; //dichiarazione del primo cerchio a sinistra
Cerchio2 myCerchio2;
Cerchio1a myCerchio1a;
Cerchio2a myCerchio2a;
Cerchio1b myCerchio1b;
Cerchio2b myCerchio2b;
Cerchio1c myCerchio1c;
Cerchio2c myCerchio2c;
Cerchio1d myCerchio1d;
Cerchio2d myCerchio2d;
Cerchio1e myCerchio1e;
Cerchio2e myCerchio2e;
Cerchio1f myCerchio1f;
Cerchio2f myCerchio2f;
Cerchio1g myCerchio1g;
Cerchio2g myCerchio2g;
Cerchio1h myCerchio1h;   // livello cerchi in posizione random
Cerchio2h myCerchio2h;
Cerchio1i myCerchio1i;   // livello cerchi con sfarfallio
Cerchio2i myCerchio2i;

int score;

float xa; 
float ya;
float xb;
float yb;


void setup () {
  size (screen.width,screen.height);

 // output = createWriter("punteggi.txt");
  
  frameRate (30);

  xa = random (100,width-100);
  ya = random (100,height-100);
  xb = random (100,width-100);
  yb = random (100,height-100);
}

void draw () {
  background (255);
  
  if (score == 0) {

    myCerchio1 = new Cerchio1();
    myCerchio2 = new Cerchio2();
    myCerchio1.display();
    myCerchio2.display();

  }
  if (score == 1) {

    myCerchio1a = new Cerchio1a();
    myCerchio2a = new Cerchio2a();
    myCerchio1a.display();
    myCerchio2a.display();

  }

  if (score == 2) {

    myCerchio1b = new Cerchio1b();
    myCerchio2b = new Cerchio2b();
    myCerchio1b.display();
    myCerchio2b.display();

  }
  if (score == 3) {

    myCerchio1c = new Cerchio1c();
    myCerchio2c = new Cerchio2c();
    myCerchio1c.display();
    myCerchio2c.display();

  }
  if (score == 4) {

    myCerchio1d = new Cerchio1d();
    myCerchio2d = new Cerchio2d();
    myCerchio1d.display();
    myCerchio2d.display();

  }
  if (score == 5) {

    myCerchio1e = new Cerchio1e();
    myCerchio2e = new Cerchio2e();
    myCerchio1e.display();
    myCerchio2e.display();

  }
  if (score == 6) {

    myCerchio1f = new Cerchio1f();
    myCerchio2f = new Cerchio2f();
    myCerchio1f.display();
    myCerchio2f.display();

  }
  if (score == 7) {

    myCerchio1g = new Cerchio1g();
    myCerchio2g = new Cerchio2g();
    myCerchio1g.display();
    myCerchio2g.display();

  }
  if (score == 8) {

    myCerchio1h = new Cerchio1h();
    myCerchio2h = new Cerchio2h();
    myCerchio1h.display();
    myCerchio2h.display();

  }
  if (score == 9) {

    myCerchio1i = new Cerchio1i();
    myCerchio2i = new Cerchio2i();
    myCerchio1i.display();
    myCerchio2i.display();

  }
}

class Cerchio1 {
  void display () {

    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,160,160);
    stroke (255,0,0);
    ellipse (200,height/2,130,130);

  }

}

class Cerchio2 {
  void display () {

    stroke (255,0,0);
    noFill ();
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX,mouseX);
    stroke (0);
    ellipse (width-200,height/2,100,100);

    if (mousePressed ) {

      stroke (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX,mouseX);
    }
  }
}

class Cerchio1a {

  void display () {

    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,200,200);
    stroke (255,0,0);
    ellipse (200,height/2,20,20);

  }
}

class Cerchio2a {

  void display () {

    stroke (255,0,0);
    noFill ();
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX,mouseX);
    stroke (0);
    ellipse (width-200,height/2,200,200);

    if (mousePressed ) {

      stroke (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX,mouseX);
    }
  }
}

class Cerchio1b {

  void display () {
    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,20,20);
    stroke (255,0,0);
    ellipse (200,height/2,100,100);
  }
}

class Cerchio2b {

  void display () {

    stroke (255,0,0);
    noFill ();
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX,mouseX);
    stroke (0);
    ellipse (width-200,height/2,20,20);

    if (mousePressed ) {

      stroke (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX,mouseX);

      score = 2; 
    }
  }
}

class Cerchio1c {

  void display () {
    strokeWeight (10);
    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,150,150);
    stroke (255,0,0);
    ellipse (205,height/2+5,95,95);
  }
}

class Cerchio2c {
  void display () {
    smooth ();
    strokeWeight (10);
    stroke (255,0,0);
    noFill ();
    ellipseMode (CENTER);
    ellipse (width-195,height/2,mouseX,mouseX);
    stroke (0);
    ellipse (width-200,height/2,150,150);

    if (mousePressed ) {
      //    strokeWeight (10);
      stroke (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-195,height/2+5,mouseX,mouseX);

      score = 3; 
    }
  }
}

class Cerchio1d {

  void display () {
    smooth ();
    strokeWeight (1);
    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,150,150);
    fill (255,0,0);
    stroke (255,0,0);
    ellipse (200,height/2,80,80);
  }
}

class Cerchio2d {
  void display () {
    //   strokeWeight (10);
    stroke (255,0,0);
    fill (255,0,0);
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX,mouseX);
    noFill ();
    stroke (0);
    ellipse (width-200,height/2,150,150);

    if (mousePressed ) {
      stroke (255,0,0);
      fill (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX,mouseX);
      score = 4; 
    }
  }
}

class Cerchio1e {

  void display () {
    smooth ();
    strokeWeight (1);
    stroke (0);
    ellipseMode (CORNER);
    ellipse (200,height/2,170,170);
    //   fill (255,0,0);
    stroke (255,0,0);
    ellipse (250,height/2+50,100,100);
  }
}

class Cerchio2e {

  void display () {

    stroke (255,0,0);
    ellipseMode (CORNER);
    ellipse (width-150,height/2+50,mouseX,mouseX);
    noFill ();
    stroke (0);
    ellipse (width-200,height/2,170,170);

    if (mousePressed ) {
      stroke (255,0,0);
      ellipseMode (CORNER);
      ellipse (width-150,height/2+50,mouseX,mouseX);
      score = 5; 
    }
  }
}

class Cerchio1f {

  void display () {

    smooth ();
    strokeWeight (1);
    stroke (0);
    ellipseMode (CORNER);
    ellipse (200,height/2,170,170);
    stroke (255,0,0);
    ellipse (250,height/2+50,20,20);
  }
}

class Cerchio2f {

  void display () {

    stroke (255,0,0);
    ellipseMode (CORNER);
    ellipse (width-150,height/2+50,mouseX,mouseX);
    noFill ();
    stroke (0);
    ellipse (width-200,height/2,170,170);

    if (mousePressed ) {
      stroke (255,0,0);
      ellipseMode (CORNER);
      ellipse (width-150,height/2+50,mouseX,mouseX);
      score = 6; 
    }
  }
}

class Cerchio1g {

  void display () {
    smooth ();
    strokeWeight (1);
    fill (255,0,0);
    stroke (255,0,0);
    ellipseMode (CENTER);
    ellipse (200,height/2,150,150);
    fill (0);
    stroke (0);
    ellipse (200,height/2,80,80);
  }
}

class Cerchio2g {
  void display () {
    stroke (255,0,0);
    fill (255,0,0);
    ellipse (width-200,height/2,150,150);
    stroke (0);
    fill (0);
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX,mouseX);
    if (mousePressed ) {
      //    strokeWeight (10);
      fill (0);
      stroke (0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX,mouseX);
      score = 7; 
    }
  }
}

class Cerchio1h {

  void display () {


    stroke (0);
    ellipseMode (CENTER);
    ellipse (xa,ya,160,160);
    stroke (255,0,0);
    ellipse (xa,ya,130,130);

  }

}

class Cerchio2h {
  void display () {


    stroke (255,0,0);
    noFill ();
    ellipseMode (CENTER);
    ellipse (xb,yb,mouseX,mouseX);
    stroke (0);
    ellipse (xb,yb,100,100);

    if (mousePressed ) {

      stroke (255,0,0);
      ellipseMode (CENTER);
      ellipse (xb,yb,mouseX,mouseX);
      score = 8; 
    }
  }
}

class Cerchio1i {

  void display () {
    smooth ();
    strokeWeight (1);
    stroke (0);
    ellipseMode (CENTER);
    ellipse (200,height/2,150,150);
    fill (255,0,0);
    stroke (255,0,0,int(random(255)));
    strokeWeight(10);
    ellipse (200,height/2,70,70);
  }
}

class Cerchio2i {
  void display () {
    //   strokeWeight (10);
    strokeWeight(10);
    stroke (255,0,0,int(random(255)));
    fill (255,0,0);
    ellipseMode (CENTER);
    ellipse (width-200,height/2,mouseX-5,mouseX-5);
    noFill ();
    strokeWeight(1);
    stroke (0);
    ellipse (width-200,height/2,150,150);

    if (mousePressed ) {
      //    strokeWeight (10);
      strokeWeight(10);
      stroke (255,0,0,int(random(255)));
      fill (255,0,0);
      ellipseMode (CENTER);
      ellipse (width-200,height/2,mouseX-5,mouseX-5);
      score = 9; 
    }
  }
}

void mouseReleased() {

  if (score == 0) {
    if (mouseX > 130) {
   //   output.println (int(mouseX-130 ));
     // output.println (float(int(mouseX-130 ))/130 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-130 ) + (" ") + "pixel");

    }
    else if (mouseX == 130) {
   //   output.println ("0"); 
     // output.println (float(int(mouseX-130 ))/130 + "%");
      println ("bravo, il nuovo cerchio rosso è uguale"); 


    } 
    else if (mouseX < 130) {
  //    output.println (int(mouseX-130));
    //  output.println (float(int(mouseX-130 ))/130 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-130 )) + (" ") +"pixel");

    }         
  } 


  if (score == 1) {
    if (mouseX > 20) {
 //     output.println (int(mouseX-20 ));
   //   output.println (float(int(mouseX-20 ))/20 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-20 ) + (" ") + "pixel");

    }
    else if (mouseX == 20) {
   //   output.println ("0");
     // output.println (float(int(mouseX-20 ))/20 + "%"); 
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 20) {
    //  output.println (int(mouseX-20 ));
      //output.println (float(int(mouseX-20 ))/20 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-20 )) + (" ") +"pixel");
    }
  }


  if (score == 2) {
    if (mouseX > 100) {
    //  output.println (int(mouseX-100 ));
    //  output.println (float(int(mouseX-100 ))/100 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-100 ) + (" ") + "pixel");

    }
    else if (mouseX == 100) {
   //   output.println ("0"); 
     // output.println (float(int(mouseX-100 ))/100 + "%");
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 100) {
    //  output.println (int(mouseX-100 ));
     // output.println (float(int(mouseX-100 ))/100 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-100 )) + (" ") +"pixel");
    }
  }
  if (score == 3) {
    if (mouseX > 95) {
   //   output.println (int(mouseX-95 ));
     // output.println (float(int(mouseX-95 ))/95 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-95 ) + (" ") + "pixel");

    }
    else if (mouseX == 95) {
  //    output.println ("0");
    //  output.println (float(int(mouseX-95 ))/95 + "%"); 
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 95) {
  //    output.println (int(mouseX-95 ));
    //  output.println (float(int(mouseX-95 ))/95 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-95 )) + (" ") +"pixel");
    }
  }
  if (score == 4) {
    if (mouseX > 80) {
   //   output.println (int(mouseX-80 ));
   //   output.println (float(int(mouseX-80 ))/80 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-80 ) + (" ") + "pixel");

    }
    else if (mouseX == 80) {
    //  output.println ("0"); 
      //output.println (float(int(mouseX-80 ))/80 + "%");
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 80) {
    //  output.println (int(mouseX-80 ));
    //  output.println (float(int(mouseX-80 ))/80 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-80 )) + (" ") +"pixel");
    }
  }
  if (score == 5) {
    if (mouseX > 100) {
    //  output.println (int(mouseX-100 ));
     // output.println (float(int(mouseX-100 ))/100 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-100 ) + (" ") + "pixel");

    }
    else if (mouseX == 100) {
    //  output.println ("0"); 
      //output.println (float(int(mouseX-100 ))/100 + "%");
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 100) {
    //  output.println (int(mouseX-100));
    //  output.println (float(int(mouseX-100 ))/100 + "%");
      // println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-100 )) + (" ") +"pixel");
    }
  }
  if (score == 6) {
    if (mouseX > 20) {
    //  output.println (int(mouseX-20 ));
    //  output.println (float(int(mouseX-20 ))/20 + "%");
      //println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-20 ) + (" ") + "pixel");

    }
    else if (mouseX == 20) {
   //   output.println ("0"); 
    //  output.println (float(int(mouseX-20 ))/20 + "%");
      // println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 20) {
    //  output.println (int(mouseX-20 ));
      //output.println (float(int(mouseX-20 ))/20 + "%");
       println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-20 )) + (" ") +"pixel");
    }
  }
  if (score == 7) {
    if (mouseX > 80) {
   //   println (int(mouseX-80 ));
     // println (float(int(mouseX-80 ))/80 + "%");
       println ("Il nuovo cerchio nero è più grande di" + (" ") + int(mouseX-80 ) + (" ") + "pixel");

    }
    else if (mouseX == 80) {
   //   output.println ("0"); 
   //   output.println (float(int(mouseX-80 ))/80 + "%");
      println ("bravo, il nuovo cerchio nero è uguale"); 

    } 
    else if (mouseX < 80) {
  //    output.println (int(mouseX-80));
    //  output.println (float(int(mouseX-80 ))/80 + "%");
      println ("Il nuovo cerchio nero è più piccolo di" + (" ") + int(-(mouseX-80 )) + (" ") +"pixel");
    }
  }
  if (score == 8) {
    if (mouseX > 130) {
  //    output.println (int(mouseX-130 ));
    //  output.println (float(int(mouseX-130 ))/130 + "%");
       println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-130 ) + (" ") + "pixel");

    }
    else if (mouseX == 130) {
  //    output.println ("0"); 
    //  output.println (float(int(mouseX-130 ))/130 + "%");
       println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 130) {
  //    output.println (int(mouseX-130));
    //  output.println (float(int(mouseX-130 ))/130 + "%");
      println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-130 )) + (" ") +"pixel");

    }         
  } 
  if (score == 9) {
    if (mouseX > 80) {
    //  output.println (int(mouseX-80 ));
      //output.println (float(int(mouseX-80 ))/80 + "%");
      println ("Il nuovo cerchio rosso è più grande di" + (" ") + int(mouseX-80 ) + (" ") + "pixel");

    }
    else if (mouseX == 80) {
   //   output.println ("0"); 
     // output.println (float(int(mouseX-80 ))/80 + "%");
      println ("bravo, il nuovo cerchio rosso è uguale"); 

    } 
    else if (mouseX < 80) {
   //   output.println (int(mouseX-80 ));
     // output.println (float(int(mouseX-80 ))/80 + "%");
  println ("Il nuovo cerchio rosso è più piccolo di" + (" ") + int(-(mouseX-80 )) + (" ") +"pixel");
    }
  }


//  output.flush();
  score++;

}


























