
int [] myY = { 0, 35, 70, 105, 140, 175, 200, 235, 270, 305, 340, 375, 405, 440 };
int[] myX = {0, 200, 393};
void setup() {
  size(400,400);

}

void draw() {
  fill(random(360), random(360), random(360),50);
  rect(0,0,width,height);
  stroke(random(177),random(100),random(100));
  for( int i = 0; i < myY.length; i++){
    
    rect(0, myY[i], 7, 7);
    rect(0, myY[i], 7, 7);
    rect(0, myY[i], 7, 7);
    rect(0, myY[i], 7, 7);
    
     rect(20, myY[i], 7, 7);
    rect(20, myY[i], 7, 7);
    rect(20, myY[i], 7, 7);
    rect(20, myY[i], 7, 7);
    
     rect(40, myY[i], 7, 7);
    rect(40, myY[i], 7, 7);
    rect(40, myY[i], 7, 7);
    rect(40, myY[i], 7, 7);
    
     rect(60, myY[i], 7, 7);
    rect(60, myY[i], 7, 7);
    rect(60, myY[i], 7, 7);
    rect(60, myY[i], 7, 7);
    
     rect(80, myY[i], 7, 7);
    rect(80, myY[i], 7, 7);
    rect(80, myY[i], 7, 7);
    rect(80, myY[i], 7, 7);
    
     rect(100, myY[i], 7, 7);
    rect(100, myY[i], 7, 7);
    rect(100, myY[i], 7, 7);
    rect(100, myY[i], 7, 7);
    
     rect(120, myY[i], 7, 7);
    rect(120, myY[i], 7, 7);
    rect(120, myY[i], 7, 7);
    rect(120, myY[i], 7, 7);
    
     rect(140, myY[i], 7, 7);
    rect(140, myY[i], 7, 7);
    rect(140, myY[i], 7, 7);
    rect(140, myY[i], 7, 7);
    
     rect(160, myY[i], 7, 7);
    rect(160, myY[i], 7, 7);
    rect(160, myY[i], 7, 7);
    rect(160, myY[i], 7, 7);
    
     rect(180, myY[i], 7, 7);
    rect(180, myY[i], 7, 7);
    rect(180, myY[i], 7, 7);
    rect(180, myY[i], 7, 7);
    
     rect(200, myY[i], 7, 7);
    rect(200, myY[i], 7, 7);
    rect(200, myY[i], 7, 7);
    rect(200, myY[i], 7, 7);
    
     rect(220, myY[i], 7, 7);
    rect(220, myY[i], 7, 7);
    rect(220, myY[i], 7, 7);
    rect(220, myY[i], 7, 7);
    
     rect(240, myY[i], 7, 7);
    rect(240, myY[i], 7, 7);
    rect(240, myY[i], 7, 7);
    rect(240, myY[i], 7, 7);
    
     rect(260, myY[i], 7, 7);
    rect(260, myY[i], 7, 7);
    rect(260, myY[i], 7, 7);
    rect(260, myY[i], 7, 7);
    
     rect(280, myY[i], 7, 7);
    rect(280, myY[i], 7, 7);
    rect(280, myY[i], 7, 7);
    rect(280, myY[i], 7, 7);
    
    rect(300, myY[i], 7, 7);
    rect(300, myY[i], 7, 7);
    rect(300, myY[i], 7, 7);
    rect(300, myY[i], 7, 7);
    
    rect(320, myY[i], 7, 7);
    rect(320, myY[i], 7, 7);
    rect(320, myY[i], 7, 7);
    rect(320, myY[i], 7, 7);
    
    rect(340, myY[i], 7, 7);
    rect(340, myY[i], 7, 7);
    rect(340, myY[i], 7, 7);
    rect(340, myY[i], 7, 7);
    
    rect(360, myY[i], 7, 7);
    rect(360, myY[i], 7, 7);
    rect(360, myY[i], 7, 7);
    rect(360, myY[i], 7, 7);
    
    rect(380, myY[i], 7, 7);
    rect(380, myY[i], 7, 7);
    rect(380, myY[i], 7, 7);
    rect(380, myY[i], 7, 7);
    
    rect(400, myY[i], 7, 7);
    rect(400, myY[i], 7, 7);
    rect(400, myY[i], 7, 7);
    rect(400, myY[i], 7, 7);
    
    myY[i]+=5;
    myY[i]%=height;

   
  }
  
}




