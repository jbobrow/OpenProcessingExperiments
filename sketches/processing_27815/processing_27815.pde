
class Lines {
  
  float x, y;
  
//  boolean down = false;
  
  float esize = 0;
  
  AudioPlayer audio;
  
  Lines(float x, float y, String name) {
    moveTo(x, y);
    audio = minim.loadFile(name);
  }
  
  void moveTo(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void lineTo(Lines other) {
    strokeWeight(2);
    stroke(#FF0000);
    line(other.x, other.y, x, y);
  }
  
  void draw() {
    for(int i = 0; i <= 500; i += 20){
      strokeWeight(2);
      stroke(random(185,255),random(95,100));
      line(i, 0, x, y);
      line(i, height, x, y);
    }
   if (audio.isPlaying()) {

      esize += 1;
      strokeWeight(1);
      stroke(#FF0000);
      noFill();
      
      if (esize < 90) {
      ellipse(x, y, esize,esize);
      }
      else{
        esize=0;
      }
    }
   }
 

  
  void play() {
    audio.loop();
  }
  
}

