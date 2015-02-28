
int prevSec;
int millisRolloverTime;
 
void setup(){
  size(600,600);
  millisRolloverTime = 0;
}
 
void draw(){
  background(#DAD8A7);
  fill(0);
 
  // Fetch the current time
  int H = hour();
  int M = minute();
  int S = second();
 
  // Reckon the current millisecond, 
  // particularly if the second has rolled over.
  // Note that this is more correct than using millis()00;
  if (prevSec != S){
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;
  
  color hColor = #99B898;
  color mColor = #E84A5F;
  color sColor = #2A363B;
  
   int hGap = width/24;
 for (int k=0; k<24; k++){//hours
   float top = map(H, 0,24, 0,width-k*hGap);
   strokeWeight(6);
   stroke(hColor);
   line(top,0, 12+k*hGap,height);
 }
   int gap = height/60;
   for (int j=0; j<60; j++){//minutes
    strokeWeight(2);
    stroke(mColor);
    float RH = map(M, 0,59, 0,height-j*gap);
    line(0,RH, width,5+j*gap);
  }
 
  for (int i=0; i<60; i++){//seconds
    float LH = map(S, 0,59, 0,height-i*gap);
    strokeWeight(1);
    stroke(sColor);
    line(0,5+i*gap, width,LH);
  
  }
  


}
