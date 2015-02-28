
class Picture {
  int w, h;
  float space, i;
  
  void make(){
    rect(0,0, width,height);
    w = width;
    h = height;
    
    if(key == ' ') {
      i = 0;
      translate(0,0);
    }
    
    stroke(200);
    
    for( int x = 0; x < w; x+=1+space) {
      rotate(i);
      line(x,0,x,h);
      rotate(i);
      line(x,0,x,h);
      rotate(i);
      line(x,0,w,x);
      
    }
    noStroke();
    space = mouseX/4;
    
  }

}


