
class Drawsound{
  float x;
  float y;
  float speed = 7;
  
  Drawsound(float x, float y){//constructor
  x=mouseX;
  y=mouseY;
  }
  
  void drawSound(){
    if(mousePressed){
    sc.instrument(115);
    sc.pan(mouseX);
    sc.playNote(random(40) + 60 - mouseY/2, random(50) + 70, 0.2);
    sc.playNote(100 + 60 - mouseY/2, 100 + 70, 0.2);

}
  }
}

