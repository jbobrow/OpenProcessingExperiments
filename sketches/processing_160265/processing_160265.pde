
float widt = 810;
float bullRad = 3*1.41*widt/9;

void setup(){
  size(810,810);
  background(255);
  placeBullseyes();
  makeApertures();
}

void draw(){
}

void drawBullseye(float x, float y, float rad){
  for(int i=0;i<4;i++){
    fill(color(250,100,100));
    noStroke();
    float curR = rad-(i*rad/4);
    ellipse(x,y,curR,curR);
    fill(255);
    ellipse(x,y,curR-rad/8,curR-rad/8);
  }
}

void placeBullseyes(){
  float wN = widt/18;
  if(random(13)<5){//one in top left
    drawBullseye(wN,wN,bullRad);
    if(random(5)<2){//one in middle
      drawBullseye(widt/2,widt/2,bullRad);
      if(random(2)<1){//one in bottom right
        drawBullseye(widt-wN,widt-wN,bullRad);
      }
    }else{//none in middle
      if(random(3)<1){//fourth spot on
        drawBullseye(.723*widt,.723*widt,bullRad);
      }else{
        if(random(2)<1){//bottom right
          drawBullseye(widt-wN,widt-wN,bullRad);
        }
      }
    }
  }else{//none in top left
    if(random(8)<3){//second on
      drawBullseye(.277*widt,.277*widt,bullRad);
      if(random(3)<1){//bottom right
        drawBullseye(widt-wN,widt-wN,bullRad);
      }else{
        if(random(2)<1){//fourth spot
          drawBullseye(.723*widt,.723*widt,bullRad);
        }
      }
    }else{//none in first two
      if(random(5)<2){//middle on
        drawBullseye(widt/2,widt/2,bullRad);
        if(random(2)<1){//last on
          drawBullseye(widt-wN,widt-wN,bullRad);
        }
      }else{//first three off
        if(random(3)<1){//bottom on
          drawBullseye(widt-wN,widt-wN,bullRad);
        }else{//bottom off
          if(random(2)<1){//fourth on
            drawBullseye(.723*widt,.723*widt,bullRad);
          }
        }
      }
    }
  }
}

void makeApertures(){
  noStroke();
  fill(100);
  float hw = widt/2;
  float qw = widt/4;
  rect(hw,0,hw,hw);
  rect(0,hw,hw,hw);
  rect(qw,0,qw,qw);
  rect(3*qw,hw,qw,qw);
  rect(0,qw,qw,qw);
  rect(hw,3*qw,qw,qw);
  for(int i=0;i<5;i++){
    rect(i*2*widt/9,0,widt/9,widt);
    rect(0,i*2*widt/9,widt,widt/9);
  }
}

void mousePressed(){
  background(255);
  placeBullseyes();
  makeApertures();
}


