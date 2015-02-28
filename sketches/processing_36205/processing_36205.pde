
int amo = 1300;

int[] xpos3 = new int[amo];
int[] ypos3 = new int[amo];
float[] csize3 = new float[amo];

void setup(){
 //-----------2nd square--------------
  size (700,400);  
  background (0);
 noStroke();
  
  int i3 = 0;
  int x3 = 0;
  int y3 = 0;

  while (i3 < amo) {
    if(x3 >= 700) {
      x3 = 0;
      y3 = y3 + 15;
    }  
    
    xpos3[i3] = 0 + x3;
    ypos3[i3] = y3;
    csize3[i3] = 15;
    
    x3 = x3 + 15;
    i3 = i3 + 1;
  }
}



 void draw() {
 background(0); 

  fill(255,255,255,50); //--------------2nd square-----------------
   //Draws the graphic
  int j3 = 0;
  while (j3 < amo){
    ellipse(xpos3[j3],ypos3[j3], csize3[j3], csize3[j3]);
    j3 = j3 + 1;
  }
  
  //Checks size
  int i3 = 0;
  while (i3 < amo){
    
    float distance = dist(xpos3[i3], ypos3[i3], mouseX, mouseY);
    
      if(distance < csize3[i3]+100) {
      if(csize3[i3] <= 15) {
        csize3[i3] = csize3[i3] + 20;
        
        
      }  }  
//    
//    if(distance < csize3[i3]){
//      if(csize3[i3] <= 15){
//        csize3[i3] = csize3[i3] + 40;
//      }}
//      if(distance < csize3[i3]*2){
//      if(csize3[i3] <= 15){
//        csize3[i3] = csize3[i3] + 20;
//      }} 
     
    if(distance > csize3[i3] + 100){
      if(csize3[i3] > 15) {
        csize3[i3] = csize3[i3]*0.98;
      }}
    i3 = i3 + 1;
  }}

