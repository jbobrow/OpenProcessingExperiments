
inflatableEllipse pupilOne;
inflatableEllipse irisOne;

inflatableEllipse pupilTwo;
inflatableEllipse irisTwo;

int margin;
int smileMinSize;
//smile bez pts
int bezX1;
int bezX2;
int bezY1;
int bezY2;
int bezOx;
int bezOy;
int bezEx;
int bezEy;

void setup(){
  size(640,480);
  margin = 10;
  background(111,160,191);
  pupilOne = new inflatableEllipse(140,120,200,200);
  irisOne = new inflatableEllipse(140,120,100,100);
  
  pupilTwo = new inflatableEllipse(500,120,200,200);
  irisTwo = new inflatableEllipse(500,120,100,100);
  
//draw smile
   bezX1=175; // makes mouth swing.
   bezY1=275;
   
   bezX2=475; 
   bezY2=275; //stretches, ut also distorts
   
   bezOx = 150; //left length
   bezOy = 275;
   
   bezEx = 500; //right length
   bezEy = 275;
   
   smileMinSize = 275;
}

void draw(){
  //fill(0);
    stroke( random(255), random(255), random(255), random(255)); 
  pupilOne.checkEllipse();
  pupilOne.drawIE();
 
  pupilTwo.checkEllipse();
  pupilTwo.drawIE();
  

    stroke( random(255), random(255), random(255), random(255)); 
  irisOne.checkEllipse();
  irisOne.drawIE();
  irisOne.moveIris();
   
  irisTwo.checkEllipse();
  irisTwo.drawIE();
  irisTwo.moveIris();

  drawSmile();
}

void drawSmile(){
     strokeWeight(int(random(1,7)));
     bezier(bezOx, bezOy, bezX1, bezY1, bezX2, bezY2, bezEx, bezEy);

}

class inflatableEllipse{
int dX;
int dY;
int dW;
int dH;
int shake;
//adjusted vars for inflation
float aH;
float aW;
int aX;
int aY;
//confines
float maxSize;
boolean unHinged;

  inflatableEllipse(int eX, int eY, int eW, int eH){ 
   dX = eX;
   dY = eY;
   dW = eW;
   dH = eH;
    
   aW = eW;
   aH = eH;
   aX = dX;
   aY = dY;
   shake = 0;
   unHinged = false;
   maxSize = 1.4;
   ellipse(dX,dY,dW,dH);
  }
  
  void drawIE(){
   ellipse(aX,aY,aW,aH); 
  }
  
  void checkEllipse(){
    if(mouseX > dX - aW / 2 && mouseX < dX + aW / 2){
      if(mouseY > dY - aH / 2 && mouseY < dY + aH / 2){
        aW++; aH++;
  //      bezY1+=2; UNCOMMENT to get a nice smile. teehee.
  //      bezY2+=2;
      }
    }
    else{aW--; aH--; bezY1 --; bezY2--;}
    
    
    if(aW < dW){aW = dW;}
    if(aH < dH){aH = dH;}
    if(aW > dW * maxSize){aW = dW * maxSize;}
    if(aH > dH * maxSize){aH = dH * maxSize;}
    if(bezY1 < smileMinSize){bezY1 = smileMinSize;}
    if(bezY2 < smileMinSize){bezY2 = smileMinSize;}
  }
  
  void moveIris(){
    if(mouseX > aX){
      aX++;
    }
    if(mouseX < aX){
      aX--;
    }
    if(mouseY > aY){
      aY++; 
    }
    if(mouseY < aY){
      aY--;
    }
    if(!unHinged){
      if(aX > dX + dW / 2){
        aX = dX + dW /2; 
      }
      if(aX < dX - dW /2){
       aX = dX - dW / 2; 
      }
      
      if(aY > dY + dH / 2){
        aY = dY + dH /2; 
      }
      
      if(aY < dY - dY /2){
       aY = dY - dY / 2; 
      }
    }   
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN){
      unHinged = true;
      background(155);
    }
  } 
}
}



