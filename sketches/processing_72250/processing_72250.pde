
class AHHead {
  int xPos, yPos;
  String head = "CalebHead final mouth.png";
  String head2 = "CalebHead.png";
  String currenthead;

  AHHead(int x, int y) {
    xPos = x;
    yPos = y;
  }

  void drawFace() {
    if (mousePressed == true) {
      currenthead = head2;
    } 
    else {
      currenthead = head;
    }
    PImage ahh = loadImage(currenthead);
    xPos = mouseX;
    yPos = mouseY;
    fill(0);
    rect(xPos-50, yPos+100, 100, 50);
    beginShape();
    texture(ahh);
    noStroke();
    vertex(xPos-300, yPos-300, 0, 0);
    vertex(xPos+300, yPos-300, 1200, 0);
    vertex(xPos+300, yPos+300, 1200, 1200);
    vertex(xPos-300, yPos+300, 0, 1200);
    endShape(CLOSE);
  }
}



