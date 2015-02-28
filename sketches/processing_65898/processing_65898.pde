
class MTBcFILL {
  int mtb;
  int cR;
  int posX;
  int posY;
  
 float c0 = 3.0;
 float sWR = 0.1;
 float sW0 = c0 + 3*sWR;
 float cStep = 10;
 float t = 255;
 float tf = t;
 color sColor = #05FFAE;
  
  MTBcFILL(int tmtb,int tcR,int tposX,int tposY){
    mtb = tmtb;
    cR = tcR;
    posX = tposX;
    posY = tposY;
  ///  tf = t;
   
   // urban metabolism indicators : 
   // colorID and timefading value (COUNT!!!)

    if (mtb == 5){tf = 5; sColor = #F14818;} else   
    if (mtb == 15){tf = 15; sColor = #FF0000;} else
    if (mtb == 50){tf = 50; sColor = #FF00B3;} else
    if (mtb == 100){tf = 100; sColor = #810083;} else
    if (mtb == 150){tf = 150; sColor = #2E3192;}

  }
  
void display (){
noFill();
float sW = sWR;//0.1;
//float t = 255;
stroke (sColor,t); //// transparency fading COUNT !!!  
for (int d = cR; d > c0; d -= cStep) {
strokeWeight (sW);
ellipse(posX, posY, d, d); 
float sWadd = (sW0 - sWR)/((cR - c0)/cStep);
sW = sWadd + sW;
}
t = t - tf/70;    //// temporary t fading option just for display
}

}


