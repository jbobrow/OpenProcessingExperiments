
class Gun { 
  float x,y,dir,vel;
  int i, delayFrames, channel;
  LineState[] lines;
  LineState lastTail;
  
  Gun(float xpos, float ypos, int channels) {
    println("Constructing...");
    i = 0;
    x = xpos;
    y = ypos;
    lines = new LineState[channels];
    delayFrames = 0;
    channel = 0;
    println("Constructed!");
  }
  
  void update() {
    println("updating!");
    
    if (lastTail != null) {
      lastTail.drawLine();
    }
    
    for (i = 0; i < lines.length; i++) {
      if (lines[i] != null) {
        lines[i].drawLine();
      }
    }
    
    if (delayFrames > 0) {
     delayFrames--; 
    }else {
      vel = random(10)+5;    
      dir1= random(72)*5; 
      if (channel >= lines.length) {
       lastTail = lines[channel%lines.length].getTail(); 
      }
      lines[channel%lines.length] = new LineState(x,y,dir1,vel);
      if (channel%2 == 0) { lines[channel%lines.length].swap(); }
      lines[channel%lines.length].tail(25); 
      channel++;
      delayFrames = 120;
    }
    
  }
}

