
class Dude {

  color outline; 
  color filler; 
  float x;
  float y;
  boolean hit = false;
  int r=80;

  Dude(float _x, float _y, color _outline, color _filler) { 

    outline = _outline;
    filler = _filler;  
    x = _x; 
    y = _y;
  }

  void display() {
    fill (filler);
    stroke (outline);
    strokeWeight (3);

    // If mouseOver start jittering
    if ((abs(mouseX - x) < r && abs(mouseY - y) < r) || hit == true) {
      x = x+ int (random (-4, +4));
      y = y+ int (random (-4, +4));
      legs ();
      jittering ();
      head ();
      eyes ();
      mouth ();
      player.play();
    } 
    else 
    {
      legs ();
      standing ();
      head ();
      eyes ();
      player.pause();
    }
  }

  void hitTest(Dude _name) {

    if (dist(x, y, _name.x, _name.y) <= r) {
      hit = true;
    } 
    else {
      hit = false;
    }
  }



  void jittering () {


    //Left 
    beginShape ();
    vertex(x, y-30);
    vertex(x-52, y-30);
    vertex(x-52, y-10);
    vertex(x-38, y-10);
    vertex(x-38, y-15);
    vertex(x-16, y-15);
    vertex(x-16, y);
    endShape ();

    //Right
    beginShape ();
    vertex(x, y-30);
    vertex(x+52, y-30);
    vertex(x+52, y-10);
    vertex(x+38, y-10);
    vertex(x+38, y-15);
    vertex(x+16, y-15);
    vertex(x+16, y);
    endShape ();
  }  


  void standing () {

    //Left
    beginShape ();
    vertex(x, y-30);
    vertex(x-27, y-30);
    vertex(x-27, y+22);
    vertex(x-10, y+22);
    vertex(x-10, y+9);
    vertex(x-14, y+9);
    vertex(x-14, y);
    endShape ();

    //Right
    beginShape ();
    vertex(x, y-30);
    vertex(x+27, y-30);
    vertex(x+27, y+22);
    vertex(x+10, y+22);
    vertex(x+10, y+9);
    vertex(x+14, y+9);
    vertex(x+14, y);
    endShape ();
  }

  void legs () {

    rectMode(CENTER);
    // legs fill
    noStroke ();
    rect (x, y+10, 30, 80);
    stroke (outline);

    //Left
    beginShape ();
    vertex(x-16, y);
    vertex(x-16, y+50);
    vertex(x, y+50);
    endShape ();

    //Right
    beginShape ();
    vertex(x+16, y);
    vertex(x+16, y+50);
    vertex(x, y+50);
    vertex(x, y+20);
    endShape ();
  }

  void head () {

    //Head
    rectMode(CENTER);
    rect (x, y-36, 24, 24);
  }

  void eyes () {

    //Eyes
    fill (255);
    noStroke ();
    rect (x-4, y-40, 8, 8);
    rect (x+5, y-40, 8, 8);

    fill (0);  
    rect (x-4, y-40, 2, 2);
    rect (x+5, y-40, 2, 2);
  }


  void mouth () {

    rectMode(CORNER);

    //Mouth
    noStroke();
    fill (outline);
    rect (x-8, y-34, 17, 7);

    // Teeth
    fill (0);
    rect (x-8, y-31, 17, 1);
    rect (x-6, y-34, 1, 7);
    rect (x-2, y-34, 1, 7);
    rect (x+2, y-34, 1, 7);
    rect (x+6, y-34, 1, 7);
  }
}


