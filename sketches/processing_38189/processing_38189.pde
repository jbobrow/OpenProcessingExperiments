
float[][] b=new float[40][2];
boolean amLooping;
boolean testNoLoopRedraw = true;
void setup() {
   size(600,600); 
   background(0);
}

void draw(){
  b[0][0]=mouseX;
  b[0][1]=mouseY;
  //initial transfer

  for(int i=1;i<40;i++) {
    stroke(255,9);
    line(b[i][0],b[i][1],b[i][0]+=(b[i-1][0]-b[i][0])/i,b[i][1]+=(b[i-1][1]-b[i][1])/i);
  }
  //line point, exchane of line through b using i cooridinate
 //one for loop but many integers 

}


