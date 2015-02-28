
///////////////////////////////////////////
// and if you could play with the stars? //
//        by Marcos Frankowicz           //
//            19/02/2010                 //
///////////////////////////////////////////

/*based on Dynamic Acceleration tutorial by Daniel Shiffman*/
/* Marcos Frankowicz */
/* 17/02/2010 */
/*if the frameRate is to slow you cam change the "num" variable*/
/*press mouse to "release" the particles from central force*/

int num = 2000;
float t;
Coisa[] c = new Coisa[num];
PVector[] cLoc = new PVector[num];
PVector[] cVel = new PVector[num];
PVector[] cAcc = new PVector[num];
PVector[] cCor = new PVector[num];
PVector[] initialLocation = new PVector[num];
float[] strokeW = new float[num];

void setup(){
  size(480,320,P2D);
  smooth();

  background(0,20,40);
  cursor(HAND);
  for(int i = 0; i<num; i++){
  // //
  cLoc[i] = new PVector(random(width),random(height));
  cVel[i] = new PVector(0.0, 0.0);
  cAcc[i] = new PVector(0.0,0.0);
  cCor[i] = new PVector(random(0,140),random(100,200),random(100,250));

  strokeW[i] = random(1,2);
  
  c[i] = new Coisa(cLoc[i],cVel[i],cAcc[i],cCor[i],strokeW[i]);

  }
 
   for(int j = 0; j<num; j++){
    initialLocation[j] = new PVector();
    initialLocation[j] = cLoc[j].get();
  }
}

void draw(){

//effects//
 filter(BLUR,1);
 filter(ERODE);
 filter(DILATE);
/////////////////

//background///
 noStroke();
 fill(0,20,40,10);
 rect(0,0,width,height);
////////////////

//particles interaction//
  for(int i = 0; i<num; i++){
    c[i].go();
    PVector m = new PVector();
    float Pdistance = dist(c[i].getLoc().x,c[i].getLoc().y,pmouseX,pmouseY);
   if(Pdistance < 50){
    m.set(mouseX,mouseY,0);
    PVector diff = PVector.sub(m,c[i].getLoc());
    diff.normalize();
    float f = 50.0;
     if(Pdistance < 25){
       f = 10.0;
     }
    diff.div(f);
    c[i].setAcc(diff);
    
   }else{
     
    PVector iL = new PVector();
    iL.set(initialLocation[i]);
    PVector diff2 = PVector.sub(iL,c[i].getLoc());
    diff2.normalize();
    float f2 = 5.2;
    diff2.div(f2);
    c[i].setVel(diff2);
    
   }
  }
///////////////////////

}


