
class Drawsounds{
  float x;
  float y;
  float speed = 5;
  
  Drawsounds(float x, float y){//constructor
  x = mouseX;
  y = mouseY;
  }
  
  void drawSounds(){
    if(mousePressed){
      sc.instrument(78);
      sc.pan(mouseY);
      sc.playNote(random(30) + 60 - mouseX, random(50) + 70, 0.2);
      sc.playNote(100+60 - mouseY/2, 100 + 70, 0.2);
    }
  }
}



