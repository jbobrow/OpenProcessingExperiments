


void buildpat(int x, int y, int w, int h){
  
  noStroke();
  
}

class SpRect { 
 float myX, myY, myW, myH, inc, prevLocX, prevLocY;
  SpRect (int x, int y, int w, int h) {
  myX = x;
  myY = y;
  myW = w;
  myH = h;  

  } 
  void buildrect(){
    constructit(5);
    
  }
  void constructit(int armLen){
    rectMode(CENTER);
  noStroke();
    fill(random(255),random(255),random(255),random(155,255));
    rect(myX,myY,myW,myH);
    for(int dir=1; dir<=4; dir++)
    {
      prevLocX = myX;
      prevLocY = myY;
      for(int j=1; j<armLen+1; j++)
        arm(j,dir);
    }
  }
  void arm(int offset,int direction){
    rectMode(CENTER);
    float thisHeight;
    float thisWidth;
    
    
    fill(random(255),random(255),random(255),random(255));
    thisWidth = myW/(2*offset);
    thisHeight = myH/(2*offset);
        
    switch(direction){
      case 1:
      println(myW/(2*offset+1));
        rect(prevLocX-(myW/2),prevLocY-(myH/2),thisWidth,thisHeight);
        prevLocX = prevLocX-(thisWidth/2);
        prevLocY = prevLocY-(thisHeight/2);
        break;
        
      case 2:
        rect(prevLocX+(myW/2),prevLocY-(myH/2),thisWidth,thisHeight);
        prevLocX = prevLocX+(thisWidth/2);
        prevLocY = prevLocY-(thisHeight/2);
        break;
        
      case 3:
        rect(prevLocX+(myW/2),prevLocY+(myH/2),thisWidth,thisHeight);
        prevLocX = prevLocX+(thisWidth/2);
        prevLocY = prevLocY+(thisHeight/2);
        break;
        
      case 4:
        rect(prevLocX-(myW/2),prevLocY+(myH/2),thisWidth,thisHeight);
        prevLocX = prevLocX-(thisWidth/2);
        prevLocY = prevLocY+(thisHeight/2);
        break;
        
    }
    
  }
}

