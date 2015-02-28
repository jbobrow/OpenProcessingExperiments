
  int count = 10;
  
  int ballSize = 80;
 
  
  float[][] ball = new float[count][5];
  int sel = 0;
  
  boolean dragging=false;
  void mouseDragged(){
    dragging=true;
  }
  void mouseReleased(){
    dragging=false;
    
    }
  void setup(){
    
    frameRate(10);
    size(700,400);
    for(int j=0;j< count;j++){
      ball[j][0]=random(width); // X 
      ball[j][1]=random(height); // Y
      ball[j][2]=random(ballSize); // Radius        
      ball[j][3]=random(-1,1); // X Speed
      ball[j][4]=random(-1,1); // Y Speed    
    }
  }

  
  void draw(){
    background(0);
    for (int j=0;j< count;j++){
    noStroke();
    float radi=ball[j][2];
    float diam=radi/2;
    
    if( dist(ball[j][0],ball[j][1],mouseX,mouseY) < radi ){
    fill(255);
   
    sel=1;
    
    if (dragging){
      
      ball[j][0]=mouseX;
      ball[j][1]=mouseY;
      }
    } else {
      
      fill(255,255,0);
      
      sel=0;
      
    }
    
    ellipse(ball[j][0],ball[j][1],radi,radi);
    
    ball[j][0]+=ball[j][3];
    ball[j][1]+=ball[j][4];
    //filter(BLUR);
    }
  }

