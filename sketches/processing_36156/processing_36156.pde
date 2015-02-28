
  int count = 3000;
  
  int maxSize = 80;
  int minSize = 10;
  
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
      ball[j][0]=random(width); 
      ball[j][1]=random(height); 
      ball[j][2]=random(minSize,maxSize);         
      ball[j][3]=random(-1,1); 
      ball[j][4]=random(-1,1);   
    }
  }

  
  void draw(){
    background(0);
    for (int j=0;j< count;j++){
    noStroke();
    float radi=ball[j][2];
    float diam=radi/2;
    
    if( dist(ball[j][0],ball[j][1],mouseX,mouseY) < radi ){
    fill(255,5);
   
    sel=1;
    
    if (dragging){
      
      ball[j][0]=mouseX;
      ball[j][1]=mouseY;
      }
    } else {
      
      fill(16,105,203,5);
      
      sel=0;
      
    }
    
    ellipse(ball[j][0],ball[j][1],radi,radi);
    
    ball[j][0]+=ball[j][3];
    ball[j][1]+=ball[j][4];
    //filter(BLUR);
    }
  }

