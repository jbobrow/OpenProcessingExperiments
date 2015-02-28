
class Cursor {

  int CursorSize = 20;

  Cursor() {
  }

  ///////////////////////////////////////////
  void display(int mx, int my) {
    stroke(255);
    //draw cross at mouse position
    line(mx-CursorSize/2, my, mx+CursorSize/2, my);
    line(mx, my-CursorSize/2, mx, my+CursorSize/2);
  }
}


