
class Grid {


  void gridAll () {
    rect1 ();
    rect2 ();
    rect3 ();
    rect4 ();
    rect5 ();
    rect6 ();
    rect7 ();
    rect8 ();
    rect9 ();
    score ();
  }

  void rect1 () {
    beginShape(QUAD);
    vertex (2, 2);
    vertex (100, 2);
    vertex (100, 100);
    vertex (2, 100);
    endShape (CLOSE);
  }

  void rect2 () {
    beginShape(QUAD);
    vertex (100, 2);
    vertex (200, 2);
    vertex (200, 100);
    vertex (100, 100);
    endShape (CLOSE);
  }

  void rect3 () {
    beginShape(QUAD);
    vertex (200, 2);
    vertex (300, 2);
    vertex (300, 100);
    vertex (200, 100);
    endShape (CLOSE);
  }

  void rect4 () {
    beginShape(QUAD);
    vertex (2, 100);
    vertex (100, 100);
    vertex (100, 200);
    vertex (2, 200);
    endShape (CLOSE);
  }

  void rect5 () {
    beginShape(QUAD);
    vertex (100, 100);
    vertex (200, 100);
    vertex (200, 200);
    vertex (100, 200);
    endShape (CLOSE);
  }

  void rect6 () {
    beginShape(QUAD);
    vertex (200, 100);
    vertex (300, 100);
    vertex (300, 200);
    vertex (200, 200);
    endShape (CLOSE);
  }

  void rect7 () {
    beginShape(QUAD);
    vertex (2, 200);
    vertex (100, 200);
    vertex (100, 300);
    vertex (2, 300);
    endShape (CLOSE);
  }

  void rect8 () {
    beginShape(QUAD);
    vertex (100, 200);
    vertex (200, 200);
    vertex (200, 300);
    vertex (100, 300);
    endShape (CLOSE);
  }

  void rect9 () {
    beginShape(QUAD);
    vertex (200, 200);
    vertex (300, 200);
    vertex (300, 300);
    vertex (200, 300);
    endShape (CLOSE);
  }

  void score () {
    beginShape(QUAD);
    fill(0);
    vertex (2, 300);
    vertex (300, 300);
    vertex (300, 333);
    vertex (2, 333);
    noFill();
    endShape (CLOSE);
  }
}


