
class Info {

  //vars
  String opinion;
  PFont goth13;

  //const
  Info(String opinion_) {
    opinion = opinion_;
    goth13 = loadFont("GothamRounded-Light-13.vlw");
    //goth = goth_;
  }

  void display(float x, float y) {
    //text width
    textFont(goth13);
    float infoW = textWidth(opinion);
    if (x + infoW + 50 > width) {
      x -= (infoW + 50);
    }
    fill(200);
    noStroke();
    rectMode(CORNER);
    rect(x+10, y-10, infoW+10, 30);
    
    //text
    fill(20);
    text(opinion, x+10, y); 
  } 
}


