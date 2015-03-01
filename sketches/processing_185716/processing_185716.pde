
class bouncyWord {
  String theWord;
  float px, py, vx, vy;
  bouncyWord(String iWord, float ipx) {
    theWord = iWord;
    px=ipx;
    vx=0;
    py=height/21;
    vy=random(23, 77);
  }
  void draw() {
    px+=vx;
    py+=vy;
    if (py<0) {
      py=0;
      vy=-vy;
    }
    if (py>height) {
      py=height;
      vy=-vy;
    }
    text(theWord, px, py);
  }
}

bouncyWord aa, bb, cc;

void setup() {
  size(400, 400);
  textAlign(CENTER);
  aa = new bouncyWord("it", width/4);
  bb = new bouncyWord("gets", width/2);
  cc = new bouncyWord("stranger", 3*width/4);
 
  fill(#0FFA0D);
}

void draw() {
  background(random(250));
  aa.draw();
  bb.draw();
  cc.draw();
}
