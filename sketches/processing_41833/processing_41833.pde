
class Chime {

  //Constructor
  Chime(float tempchimePosX, float tempchimePosY, float tempchimeWidth, float tempchimeHeight) {
    chimePosX = tempchimePosX;
    chimePosY = tempchimePosY;
    chimeWidth = tempchimeWidth;
    chimeHeight = tempchimeHeight;
  }

  void drawChime() {
    fill(255);
    rect(chimePosX, chimePosY, chimeWidth, chimeHeight);
    line(chimePosX + (chimeWidth/2), 20, chimePosX + (chimeWidth/2), chimePosY); 
    if (chimePosX <= canvasX - 150) { 
      chimeHeight = random(50, 200);
    }
  }

  void chimeUpdatePosition() {
    if (chimePosX <= canvasX - 150) {
      chimePosX = chimeWidth + 10 + chimePosX;
    }
  }


  void chimeNoise() {
    if(mousePressed){
      playerOne.loop(0);
    }
  }
}




