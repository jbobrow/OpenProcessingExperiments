
color[][] palette3 = {
  { #02738C, #1F3C57, #142426, #9CD97E, #024059 },
  { #3BA7BF, #427283, #4F5951, #52751A, #025949 },
  { #3390A5, #F5D6B8, #8C8579, #22470B, #02734A },
  { #3BB2BF, #C0997F, #F2EADF, #171C04 , #038C4C},
  { #D7EFF2, #90372B, #BFB3A8, #382507 , #F29C50} };

  color[][] palette2 = {          //
  { #0E2827, #235466, #0E2827, #142426, #90372B },
  { #142D31, #3F85A1, #142D31, #4F5951, #364742 },
  { #385245, #619FB8, #385245, #8C8579, #8C6D46 },
  { #4E7352, #89D0E0, #4E7352, #F2EADF, #F0AD44},
  { #739270, #F2F2F2, #739270, #BFB3A8, #F0AD44} };
  
    color[][] palette = {
  { #02738C, #294008, #142426, #E8D504, #FCEF91 },
  { #3BA7BF, #618C03, #4F5951, #FAFF79, #F2A25C },
  { #3390A5, #4F7302, #8C8579, #FFD928, #F28B50 },
  { #3BB2BF, #405908, #F2EADF, #E8AF14 , #A64826},
  { #D7EFF2, #ADBF21, #BFB3A8, #FFCA6C , #523429} };
  
/////////////////////////////////////////////////////////////////////////////////////  
  
int m = 1 ;
int n = 20 ; // Standard Deviation of Gaussian Random //

import java.util.* ;


Random generator ;

 
void setup(){
  noStroke();
  background(255);
  frameRate(20);
  size(1280,720);
  smooth();  
  generator = new Random();

}


void draw(){
  
  int lampCount = n;
  float[] num = new float[lampCount];
  float dev = constrain(mouseX, 5, 45);
   dev = mouseX /40 ;


  int x = (width/lampCount) ; 
  
      for(int i=0;i < lampCount ;i++){
        num[i] = (float) generator.nextGaussian(); 
        num[i] = num[i] * dev ;
        num[i] = num[i] + mouseY ;
  }
  
  
  // Draws The Shape in Each Vertex //
  beginShape(TRIANGLE_STRIP);
  for(int i=0;i < lampCount ;i++){
  
      fill(palette[int(random(palette.length))][m]);
      vertex(x,num[i]);
      x += width/lampCount ;
  }
  endShape();

}




/// USER Interactivity ///

void mousePressed() {
    if (mouseButton == LEFT) {
    n+= 20 ;
  } else if (mouseButton == RIGHT) {
  
    if (n == 20){
     n = 40 ; 
    }
      n-= 20;
  }
}


void keyPressed() {

  if (key=='s') {
    save("alless.jpg") ;
    println("Image Saved !");
  }
  if (key=='5') {
    m = 0;

  }

  if (key=='1') {
    m = 1;

  }

  if (key=='2') {
    m = 2;

  }

  if (key=='3') {
    m = 3;

  }
    
      if (key=='4') {
    m = 4;

  }
        if (key=='q') {
    palette = palette2;

  }
          if (key=='w') {
    palette = palette3;

  }
   
  
}
