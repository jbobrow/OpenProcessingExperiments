


void setup () {
  size (500, 500);
  background (#808000);


  //bordo
  fill (#D2691E);
  noStroke ();
  rect (10, 50, 450, 20);
  rect (10, 50, 20, 430); 
  rect (20, 460, 460, 20); 
  rect ( 460, 50, 20, 430);

  //chiodo
  fill (50, 50, 50, 50);
  smooth();
  stroke (0);
  strokeWeight (2);
  ellipse (250, 20, 20, 20);

  //filochereggechiodo
  smooth();
  stroke (0);
  strokeWeight (1);
  line (120, 50, 240, 15);
  line (385, 50, 260, 15);

  //spacchettilegno
  smooth();
  stroke (0);
  strokeWeight (1);
  line (10, 50, 30, 70);
  line (480, 50, 460, 70);
  line (10, 480, 30, 460);
  line (480, 480, 460, 460);
  //lunghi
  smooth();
  stroke (0);
  strokeWeight (2);
  line (10, 50, 10, 480);
  line (480, 50, 480, 480);
  line (10, 50, 480, 50);
  line (10, 480, 480, 480);
  //lunghichiari
  smooth();
  stroke (40, 40, 40);
  strokeWeight (1.5);
  line (30, 70, 30, 460);
  line (460, 70, 460, 460);
  line (30, 70, 460, 70);
  line (30, 460, 460, 460);
  //foglio bianco
  fill (255, 255, 255, 80);
  smooth();
  noStroke();
  rect (32,72, 428, 388);
  
}

void draw() {
  boolean a = false;
  if (mouseX > 34 && mouseX <= 458) {
    if (mouseY >75 && mouseY<= 454) {
      a = true;
      if (mousePressed) { 
        strokeWeight (4);
        stroke(0);
        line (mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }
}


