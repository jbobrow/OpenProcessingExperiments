
class Ripple {
  
  float[] rippleSize;
  float[] rippleSize2;
  float[] rippleSize3;
  float[] rippleSize4;
  float[] rippleColor;
  
  float gradientIncriment;
  
  Ripple(){
    rippleSize = new float[100];
    rippleSize2 = new float[100];
    rippleSize3 = new float[100];
    rippleSize4 = new float[100];
    rippleColor = new float[100];
    gradientIncriment = 255/rippleColor.length;
  }
  
 void setupRipple(){
   for(int i = 0; i < rippleColor.length; i++){
     if(i < rippleColor.length/2){
       rippleColor[i] = i+gradientIncriment;
     }
     if(i >= rippleColor.length/2){
       rippleColor[i] = rippleColor[i-1] - gradientIncriment;
     }
   }
   for(int i = 0; i < rippleSize.length; i++){
     rippleSize[i] = i;
     rippleSize2[i] = i-70;
     rippleSize3[i] = i-120;
     rippleSize4[i] = i-150;
   }
 }
 
 void drawRipple(float rippleX, float rippleY){
   for(int i = 0; i < rippleSize.length; i++){
     stroke(62, 159, 221, rippleColor[i]);
     ellipse(rippleX, rippleY, rippleSize[i], rippleSize[i]);
     if(rippleSize2[i] > 0){
       ellipse(rippleX, rippleY, rippleSize2[i], rippleSize2[i]);   
     }
     if(rippleSize3[i] > 0){
       ellipse(rippleX, rippleY, rippleSize3[i], rippleSize3[i]);   
     }
     if(rippleSize4[i] > 0){
       ellipse(rippleX, rippleY, rippleSize4[i], rippleSize4[i]);   
     }
     if(rippleSize[i] > 200){
       rippleDim();
     }
   }
 }
 
 void moveRipple(){
   for(int i = 0; i < rippleSize.length; i++){
     rippleSize[i] += 6;
     rippleSize2[i] += 5;
     rippleSize3[i] += 4;
     rippleSize4[i] += 3;
   }
 }
 
 void rippleDim(){
   for(int i = 0; i < rippleColor.length; i++){
     rippleColor[i] -= .005;
   }
 }
  
  
  
  
 
}

