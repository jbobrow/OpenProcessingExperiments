
class AvgBar {
  
  int x, y, count;
  String word;

  AvgBar(int tx, int ty, String ts, int tc) {
    x = tx;
    y = ty+100;
    word = ts;
    count = tc;
  }

  void display() {
    noStroke();
    

  
  if(mousePressed){
    
  fill(nc2,60);
  rect(100,y,count/8,15); 
      if(mouseY > y && mouseY < y+20) {
  textAlign(CENTER);
  textFont(numbers);
  fill(nc2,190);
  text(count/120+1,(count/8)+101,89);
  stroke(1);
  fill(255);
  line((count/8)+100,y+14,(count/8)+100,92);
  

  }
    

  }
  }
  
}


