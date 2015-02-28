
/* this code may damage your brain use at your own risk only
*  kof 2010
*/

float len = 1;
float uhel = 30;
int cnt = 0;

boolean neg = false;
float fw = 1;

void setup() {
  int W = (int)(PI*100);
  size(W*2,W,P2D);
 // len = W*2;
  noFill();
  smooth();
  background(255);
  
}


void draw() {
  
  
  uhel -= (noise(frameCount/(PI*100.0))/(PI*500.0))*fw;
  
  if(abs(uhel%90)<0.1 && cnt>30){
    neg=!neg;
    cnt=0;
  }
  
  
    if(uhel>90||uhel<-90){
      fw*=-1;
    }
  
  cnt++;
  
  
  if(neg){
  stroke(255,map(abs(uhel),0,90,120,20));
  
    background(0);
  }else{
  stroke(0,map(abs(uhel),0,90,120,20));
  
    background(255);
  }
  pushMatrix();
  
  
  translate(width/2,height/2);
  
  len = 1;
  for(int i = 0;i<10000;i++){

    //background(255);
  
  translate(len,0);
  rotate(radians(uhel));  
  
  line(0,0,len,0);
  
  
  
  len += len/1000.0;
  
  }
  
  popMatrix();
  
  
}


