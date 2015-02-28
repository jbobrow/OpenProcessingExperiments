
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
    noCursor();
    if (mousePressed == true) {
      currenthead = head2;
    } 
    else {
      currenthead = head;
    }
    PImage ahh = loadImage(currenthead);
    xPos = mouseX;
    yPos = mouseY;
    
    beginShape();
    texture(ahh);
    noStroke();
    vertex(xPos-150, yPos-150, 0, 0);
    vertex(xPos+150, yPos-150, 1200, 0);
    vertex(xPos+150, yPos+150, 1200, 1200);
    vertex(xPos-150, yPos+150, 0, 1200);
    endShape(CLOSE);
    //fill(0);
    //rect(xPos-25, yPos+50, 50, 25);
  }
}



