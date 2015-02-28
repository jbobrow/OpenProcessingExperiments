
class Beat{
  float sizeMax;
  int x;
  int y;
  int count;
  int arrayPos;
  float freq;
  
  Beat(float Size, int i){
    sizeMax = Size/10;
    if(sizeMax < 20)
      sizeMax = 20;
    
    x = mouseX;
    y = mouseY;
    
    arrayPos = i;
    
    count = 1;
    freq = map(sizeMax, 0, 500, 1000, 60);
  }
  
  
  void display(){
    //resets when the circle gets too large
    if(count > sizeMax){
      count = 1;
      sine.setFreq(freq);
      
      if(out.isMuted() == true){
        out.unmute();
      }
      
      sound = true;
      time = 0;
    }    
    
    
    fill(0, 230*(count/sizeMax)); 
    ellipse(x, y, count, count);
     
    count++;
          
  }
  
}


