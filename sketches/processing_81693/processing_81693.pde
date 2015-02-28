
int k = 3; //size factor 35<max<40
float massStep;
int stop;
int br = 201;
int bg = 201;
int bb = 190;
float f = 0.1;
float tR = 0.55;
float lR = 0.5;
float pR = 0.4;
int i=0;
float diaRatio = 1.8;
float massRatio = 80;
float burntotRatio = 0.3;
PVector[] millPosArray;
PVector[] trashPosArray;
PVector[] recyPosArray;
PVector[] forestPosArray;
PVector[] consPosArray;
PVector[] proposalPosArray;
PVector[] landPosArray;
PVector[] burnPosArray;
PVector[] parkPosArray;
float recyy;
float trashy;
PVector forestPos;
PVector millPos;
PVector consPos;
PVector trashPos;
float landx;
PVector recyPos;
PVector proposalPos;
PVector parkPos;
PVector burnPos;
PVector landPos;
float[] trashMass = new float[71];
float[] recyMass = new float[71];
float[] forestMass = new float[71]; 
float[] consMass = new float[71]; 
float[] landMass = new float[71]; 
float[] burnMass = new float[71]; 
float[] landtotMass = new float[71]; 
float[] burntotMass = new float[71];
float[] parkMass = new float[71];
float[] proposalMass = {0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,10,60,100,210,280,360, 420};
float[] millMass = {180,185,189,195,200, 280,300,300,400,480, 520,580,660,730,730, 800,920,1000,1100,1300, 1300,1370,1600,1750,1350, 1500,1540,1600,1780,1800, 1700,1740,1800,1900,2050, 2100,2220,2400,2650,2810, 2880,2820,2750,2830,2970, 3180,2736,2700,2950,3180, 3170,3160,3140,3120,3115, 3110,3130,3060,2630,2740, 2660,2660,2660,2660,2660, 2660,2660,2660,2660,2660, 2660};
float[] woodconsMass = {60,61,62,63,64, 65,66,67,68,69, 70,71,72,73,74, 75,80,85,90,95, 105,103,101,100,99, 97,99,102,105,108, 112,110,106,102,97, 93,95,98,102,107, 113,114,110,110,110, 112,112,110,92,99, 100,91,89,88,90, 86,87,83,85,87, 90,95,100,100,100, 100,100,100,100,100, 100};
float[] woodstockMass = {1620,1630,1650,1660,1670, 1680,1700,1720,1730,1730, 1740,1750,1770,1780,1785, 1790,1800,1850,1900,1950, 2000,2050,2060,2080,2090, 2120,2150,2200,2275,2350, 2400,2450,2550,2650,2750, 2875,2880,2950,2950,3000, 3150,3200,3250,3300,3350, 3450,3550,3650,3750,3850, 3950,4000,4050,4100,4200, 4250,4320,4400,4450,4120, 4220,4220,4220,4220,4220, 4220,4220,4220,4220,4220, 4220};
float[] wastetotMass = {300,300,300,300,300, 500,550,600,650,700, 800,850,900,1200,1500, 1600,1700,1800,2000,2500, 3800,4000,4200,4300,4100, 4200,4100,4150,4300,4450, 4400,4250,4400,4250,4300, 4300,4450,4650,4800,5000, 5044,5077,5020,5030,5054, 5069,5115,5120,5160,5145, 5240,5240,5200,5200,5200, 5160,5160,5160,5160,5160, 5160,5160,5160,5160,5160, 5160,5160,5160,5160,5160, 5160};
// unit: 10 000 tons?

void setup(){
  size(900,726);
  //size(327*k,242*k);
  smooth();
  strokeCap(SQUARE);
  background(br,bg,bb);
  textFont(createFont("Lucida Sans Unicode",32));
  frameRate(10);
  massStep = k*5;
  recyy = 60*k;
  trashy = 140*k;
  forestPos = new PVector(50*k, 155*k);
  millPos = new PVector(125*k, trashy);
  consPos = new PVector(175*k,recyy+25*k);
  trashPos = new PVector(260*k, trashy);
  landx = 280*k;
  
  for(int q=0; q<71; q++){
    forestMass[q] =  tR*millMass[q];
    consMass[q] =  millMass[q];
    trashMass[q] = tR*millMass[q];
    recyMass[q] =  (1-tR)*millMass[q];
    landMass[q] = tR*lR*millMass[q];
    burnMass[q] = tR*(1-lR)*millMass[q];
    burntotMass[q] = wastetotMass[q]*burntotRatio;
    landtotMass[q] = wastetotMass[q]*(1-burntotRatio);
    parkMass[q] = proposalMass[q]*pR;
  }//close loop q
}//close setup


void draw(){
  
 if(frameCount<70){
   i=frameCount-1;
 }else{
    i=70;
  }//close if-else
   
  smooth();
  noStroke();
  fill(br,bg,bb,80);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
  float forestT = k*forestMass[i]/massRatio;
  float millT = k*millMass[i]/massRatio;
  float consT = k*consMass[i]/massRatio;
  float trashT = k*trashMass[i]/massRatio;
  float recyT = k*recyMass[i]/massRatio;
  float landT = k*landMass[i]/massRatio;
  float burnT = k*burnMass[i]/massRatio;
  float woodstockT = k*woodstockMass[i]*25/massRatio;
  float woodconsT = k*woodconsMass[i]*25/massRatio;
  float landtotT = k*landtotMass[i]*25/massRatio;
  float burntotT = k*burntotMass[i]*25/massRatio;
  float proposalT = k*proposalMass[i]/massRatio;
  float parkT = k*parkMass[i]/massRatio;
  
  float forestD = k*diaRatio*sqrt(forestT/k);
  float consD = k*diaRatio*sqrt(consT/k);
  float landD = k*diaRatio*sqrt(landT/k);
  float burnD = k*diaRatio*sqrt(burnT/k);
  float woodstockD = k*diaRatio*sqrt(woodstockT/k);
  float woodconsD = k*diaRatio*sqrt(woodconsT/k);
  float landtotD = k*diaRatio*sqrt(landtotT/k);
  float burntotD = k*diaRatio*sqrt(burntotT/k);
  float proposalD = k*diaRatio*sqrt(proposalT/k);
  float parkD = k*diaRatio*sqrt(parkT/k);
  
  PVector landPos = new PVector(landx, trashy-trashT/2-landtotD/3);
  /////// move adjust
  float xpos;
  float ypos;
  float ang;
  
  float moveAlong = landtotD/2-landD/2+k;
  float movePerp = landD/2;

  PVector BPos = new PVector(landPos.x,landPos.y-landD/2);  
  PVector CPos = new PVector(trashPos.x,trashPos.y-trashT/2);
  CPos.sub(BPos);
  
  if(CPos.x != 0){
    ang = atan(-CPos.y/-CPos.x); 
  }else{
    ang = -PI/2;
  }
  xpos =landPos.x+moveAlong*cos(ang);

  if((xpos+landtotD/2)>(width)){
    PVector aposx = new PVector(-(xpos+landtotD/2-width),0);
    landPos.add(aposx);
  }
  
  moveAlong = woodstockD/2-forestD/2+k;
  movePerp = forestD/2;

  PVector CPos1 = new PVector(forestPos.x,forestPos.y-forestD/2);  
  PVector BPos1 = new PVector(millPos.x,millPos.y-millT/2);
  CPos1.sub(BPos1);
  
  if(CPos1.x != 0){
    ang = atan(-CPos1.y/-CPos1.x); 
  }else{
    ang = -PI/2;
  }
  ypos = forestPos.y-movePerp-moveAlong*sin(ang);
  xpos = forestPos.x-moveAlong*cos(ang);

  if((ypos+woodstockD/2)>190*k){
    PVector aposy1 = new PVector(0,-(ypos+woodstockD/2-190*k));
    forestPos.add(aposy1);
  }
  if((xpos-woodstockD/2)<k){
    PVector aposx1 = new PVector(woodstockD/2+k-xpos,0);
    forestPos.add(aposx1);
  }
  
  burnPos = new PVector(landPos.x, 140*k+burntotD/2-trashT/2);
  trashPos = new PVector(0.5*landPos.x+0.5*consPos.x, trashy);
  recyPos = new PVector(millPos.x-30*k, recyy);
  proposalPos = new PVector(recyPos.x-45*k, 0.8*recyy+0.2*millPos.y);
  parkPos = new PVector(proposalPos.x-10*k, proposalPos.y);

 ///////burnpos etc
  
  Pond woodstockPond = new Pond(millT, forestPos, millPos, "Forest stock", forestD, woodstockD, woodstockT);  //Pond woodconsPond = new Pond(woodconsT, forestT, millT, forestPos, millPos, woodconsCol, "forest"); 
  Pond landtotPond = new Pond(trashT, landPos, trashPos, "Landfill", landD, landtotD, landtotT); 
  Pond burntotPond = new Pond(trashT, burnPos, trashPos, "Combusted waste", burnD, burntotD, burntotT);
  fill(0);
  forestPosArray = PointMass(forestPos, forestD);
  consPosArray  = PointMass(consPos, consD);
  landPosArray  =  PointMass(landPos, landD);
  burnPosArray =  PointMass(burnPos, burnD);
  proposalPosArray =  PointMass(proposalPos, proposalD);
  fill(50,155,50);
  parkPosArray =  PointMass(parkPos, parkD);
  
  millPosArray = DivideMass(millPos, millT);
  trashPosArray = DivideMass(trashPos, trashT);
  recyPosArray = DivideMass(recyPos, recyT);

  Txt millt = new Txt(millPos,"PAPER PRODUCTION",millT,millPosArray);
  Txt trasht = new Txt(trashPos,"TRASH",trashT,trashPosArray);
  Txt recyt = new Txt(recyPos,"RECYCLED PAPER",recyT,recyPosArray);

  PVector[] millShuffle = millPosArray;
  PVector[] trashShuffle = trashPosArray;
  PVector[] recyShuffle = recyPosArray;
  
//  Collections.shuffle(Arrays.asList(millShuffle));  
//  Collections.shuffle(Arrays.asList(recyShuffle));  
//  Collections.shuffle(Arrays.asList(trashShuffle));
  
  int LF = int(0.5+(forestT)/massStep);
  int LR = int(0.5+(recyT-proposalT)/massStep);
  int LP = int(0.5+(proposalT-parkT)/massStep);
  int LM = int(0.5+millT/massStep);

  PVector[] millShuffleF = new PVector[LF];
  PVector[] millShuffleR = new PVector[LR];
  PVector[] millShuffleP = new PVector[LP];

  if(LM>0){
    for(int n=0; n<LF; n++){
      millShuffleF[n]=millShuffle[n];
    }//close loop n
    for(int m=0; m<LR; m++){
      millShuffleR[m]=millShuffle[LM-LR+m];
    }//cloose loop m
    if(LP>0){
      for(int p=0; p<LP; p++){
        millShuffleP[p]=millShuffle[p];
      }//close loop p
    }
  }
  int LL = int(0.5+(landT)/massStep);
  int LB = int(0.5+(burnT)/massStep);
  int LT = int(0.5+trashT/massStep); 
  PVector[] trashShuffleL = new PVector[LL];
  PVector[] trashShuffleB = new PVector[LB];

  if(LT>0){
    if(LL>0){
      for(int n=0; n<LL; n++){
        trashShuffleL[n]=trashShuffle[n];
      }//close loop n
    }//close if
    if(LB>0){
      for(int m=0; m<LB; m++){
        trashShuffleB[m]=trashShuffle[LT-LB+m];
      }//cloose loop m
    }// close if
  }//clos if

  if(LM>0){
    for(int n=0; n<LF; n++){
      millShuffleF[n]=millShuffle[n];
    }//close loop n
    for(int m=0; m<LR; m++){
      millShuffleR[m]=millShuffle[LM-LR+m];
    }//cloose loop m
    if(LP>0){
      for(int p=0; p<LP; p++){
        millShuffleP[p]=millShuffle[p];
      }//close loop p
    }
  }
  
  Connect connect_forest_mill = new  Connect(forestPosArray, millShuffleF, forestD, 1);  
  Connect connect_cons_mill = new  Connect(consPosArray, millShuffle, consD, -1);  
  Connect connect_cons_trash = new  Connect(consPosArray, trashShuffle, consD, 1);  
  Connect connect_cons_recy = new  Connect(consPosArray, recyShuffle, consD, 1); 
  Connect connect_proposal_recy = new  Connect(proposalPosArray, recyShuffle, proposalD, -1);   
  Connect connect_proposal_mill = new  Connect(proposalPosArray, millShuffleP, proposalD, 1);   
  Connect connect_land_trash = new  Connect(landPosArray, trashShuffle, landD, -1);  
  Connect connect_burn_trash = new  Connect(burnPosArray, trashShuffle, burnD, -1);  
  Connect connect_recy_mill = new  Connect(recyShuffle, millShuffleR,recyT, 1);  
  Connect connect_proposal_park = new  Connect(proposalPosArray, parkPosArray,proposalT, 1);  

 fill(0);
 Splash splash_forest = new  Splash(forestPos, forestPosArray, millShuffleF, millPos, forestD, millT);
 Splash splash_cons_recy = new  Splash(consPos, consPosArray, recyShuffle, recyPos, consD, recyT);
 Splash splash_cons_trash = new  Splash(consPos, consPosArray, trashShuffle, trashPos, consD, trashT);
 Splash splash_proposal_mill = new  Splash(proposalPos, proposalPosArray,millShuffle, millPos, proposalD, millT);
 Splash splash_proposal_park = new  Splash(proposalPos, proposalPosArray, parkPosArray, parkPos, proposalD, parkD);
  
 fill(br,bg,bb);
  TxtC cons = new TxtC(consPos,"PAPER CONSUMPTION",consT,consD, color(0));
  TxtC landt = new TxtC(landPos,"LANDFILL WASTE",landT,landD,color(0));
  TxtC burnt = new TxtC(burnPos,"COMBUSTED WASTE",burnT,burnD,color(0));
  TxtC forestt = new TxtC(forestPos,"WOOD",forestT,forestD,color(0));

  TxtE consE = new TxtE(consPos,"PAPER CONSUMPTION",consT,consD);
  TxtE proposaltE = new TxtE(proposalPos,"STURCTURE PROPOSAL",proposalT,proposalD);
  TxtE parktE = new TxtE(parkPos,"PAPER PARK PROPOSAL",parkT,parkD);
  float[] Pop = {84,85,86,87,88, 90,90,91,92,92, 93,94,96,97,98, 99,100,101,101,103, 104,106,107,108,110, 112,113,114,115,116, 117,118,118,119,120, 121,121,122,123,123, 124,124,124,125,125, 125,126,126,127,127, 127,127,128,128,128, 128,128,128,128,128, 127,127,127,127,127, 126,126,126,125,125, 124};
  timeLine tl = new timeLine(i, Pop);     
 
   //if((frameCount-1)%10==0 && frameCount<72){
   //int yr = 1950+i;
   //save("paperdiagram"+yr+".jpg");
   //}
}//close draw



class Connect{
  Connect(PVector[] pos, PVector[] shuffle, float D, int LR){
  
    
    noFill();
    
    int stop = shuffle.length;
    if(pos.length<shuffle.length){
      stop = pos.length; 
    }

    for(int n=0; n<stop; n++){ 
      stroke(0);
      strokeWeight(0.05*k);
      line(pos[n].x,pos[n].y, shuffle[n].x, shuffle[n].y);
 
      PVector dir;    
      PVector dir2;
      PVector dir3;
      PVector dir4;

      dir = shuffle[n].get();
      dir.sub(pos[n]);
      float L = dir.mag();
      dir.normalize();
      dir2 = dir.get();
      dir3 = new PVector(dir.y, -dir.x);
      dir3.mult(k);
      float R = random(3*k,L-3*k);
      dir.mult(R);
      dir.add(pos[n]);
      dir2.mult(R-1.5*k*LR);
      dir2.add(pos[n]);
      dir4=dir2.get();
      dir4.sub(dir3);
      dir3.add(dir2);
      strokeWeight(0.2*k);
      line(dir.x,dir.y,dir3.x,dir3.y);
      line(dir.x,dir.y,dir4.x,dir4.y);

     }//close loop n
  }
}


class Connect_1_1{
  Connect_1_1(PVector[] shuffle1, PVector[] shuffle2){
  
    stroke(0);
    strokeWeight(0.05*k);
    noFill();
   
    int stop = shuffle1.length;
    if(shuffle1.length>shuffle2.length){
      stop = shuffle2.length;
    }
 
    for(int n=0; n<stop; n++){  
      line(shuffle1[n].x,shuffle1[n].y, shuffle2[n].x, shuffle2[n].y);      
    }//close loop n
  }
}


PVector[] DivideMass(PVector pos, float T) {
  
  PVector[] Pos;
  int e = int(T/massStep+0.5);
  
  stroke(0);
  strokeWeight(k);
  line(pos.x,pos.y, pos.x,pos.y-massStep*e);

  if(e>0){
    Pos = new PVector[e+1];
    for(int j=0; j<e+1; j++){
      PVector tpos = new PVector(pos.x,pos.y-massStep*j);
      Pos[j] = tpos.get();
      
      stroke(br,bg,bb);
      strokeWeight(0.2*k);
      line(pos.x-k*0.6,pos.y-massStep*j, pos.x+k*0.6,pos.y-massStep*j);
    }//close loop
   }else if(T>0){
    Pos = new PVector[1];
    Pos[0] = pos;
  }else{
    Pos = new PVector[0];
  }//close else

  return Pos;
}
    
    


PVector[] PointMass(PVector pos, float D){

  float randRatio = 0.33;
  
  noStroke();
  strokeWeight(k*0.1);
  ellipse(pos.x,pos.y-D/2,D,D);
  
  
  PVector[] Pos;
  int e = int(D/massStep+0.5);
  
  if(e>0){
  
    Pos = new PVector[e+1];
  
    for(int j=0; j<e+1; j++){
      PVector tpos = new PVector(pos.x+random(-D*randRatio,D*randRatio),pos.y-D/2+random(-D*randRatio,D*randRatio));
      Pos[j] = tpos.get();
    }//close loop
  
  }else if(D>0){
    Pos = new PVector[1];
    Pos[0] = pos;
  }else{
    Pos = new PVector[0];
  }//close else

  return Pos;
  
}
    

class Pond{
  Pond(float previousT, PVector Pos, PVector PPos, String nmn, float sourceDia, float dia, float T){
 
  fill(255);
  noStroke();
  float xpos;
  float ypos;
  float ang;
  
  float moveAlong = dia/2-sourceDia/2+k;
  float movePerp = sourceDia/2;


  PVector BPos = new PVector(Pos.x,Pos.y-sourceDia/2);  
  PVector CPos = new PVector(PPos.x,PPos.y-previousT/2);
  CPos.sub(BPos);
  
  if(CPos.x != 0){
    ang = atan(-CPos.y/-CPos.x); 
  }else{
    ang = -PI/2;
  }
  
if(Pos.x<PPos.x){
  xpos =Pos.x-moveAlong*cos(ang);
  ypos = Pos.y-movePerp-moveAlong*sin(ang);

}else{
  xpos =Pos.x+moveAlong*cos(ang);
  ypos = Pos.y-movePerp+moveAlong*sin(ang);


}

  ellipse(xpos,ypos, dia,dia); //green forest thing
  
   textSize(dia/10);
  
  
   float tw3 = textWidth(nmn);
   fill(255);
   noStroke();
   rectMode(CENTER);
 
   fill(br/2,bg/2,bb/2);
   textAlign(CENTER,CENTER);
   text(nmn,xpos,ypos-dia/20);
   
   if(dia/10>3*k){
   textSize(3*k);
   }
   
   float S = int(T*massRatio/100);
   String quant = nf(S,0,-1);
   text(quant,xpos,ypos+dia/20+k);
  }
}



PVector[] SortPVectorArray(PVector[] pos){

  PVector[] SPos = new PVector[pos.length];
  float[] yArray = new float[pos.length];
  float[] SyArray = new float[pos.length];

  
  for(int i=0; i<pos.length; i++){
    yArray[i]=pos[i].y;  
  }//close loop i
  
  SyArray = sort(yArray);
  SyArray = reverse(SyArray);
  
  for(int j=0; j<pos.length; j++){
    for(int k=0; k<pos.length; k++){
      if(SyArray[j]==pos[k].y){
        SPos[j]=pos[k];
        break;
      }//close if          
    }//close loop k
  }//close loop j
  return SPos;
}

class Splash{
  Splash(PVector CPos, PVector[] CCPos, PVector[] DPos, PVector DBPos, float D, float T){
  
    noStroke();
    float M =2.00*k+0.60*D;
    float E = 1;
   
    
    PVector TPos = new PVector(0,-D/2);
    TPos.add(CPos);

    PVector DMPos = new PVector(0,-T/2);
    DMPos.add(DBPos);
    DMPos.sub(TPos);
    DMPos.normalize();
    
    PVector SPos = new PVector(-DMPos.y, DMPos.x);
    SPos.mult(D/2);
    SPos.add(TPos);
    
    PVector EPos = new PVector(DMPos.y, -DMPos.x);
    EPos.mult(D/2);
    EPos.add(TPos);
    
    PVector StPos = new PVector(DMPos.x, DMPos.y);
    StPos.mult(D/2);
    StPos.add(SPos);
    
    PVector EnPos = new PVector(DMPos.x, DMPos.y);
    EnPos.mult(D/2);
    EnPos.add(EPos);
    
    if(CPos.y > DBPos.y){
      PVector Pos1 = new PVector(SPos.x, SPos.y);
      PVector Pos2 = new PVector(StPos.x, StPos.y);
      SPos = EPos.get();
      StPos = EnPos.get();
      EPos = Pos1.get();
      EnPos = Pos2.get();
    }
    
    
    int stop = DPos.length;
    if(CCPos.length<DPos.length){
      stop = CCPos.length; 
    }

    for(int n=0; n<stop; n++){  
        
       PVector dir = DPos[n].get();
       dir.sub(CCPos[n]);
       dir.normalize();
       dir.mult(E);
       PVector dirEnd = dir.get();
       dirEnd.mult(M);
       dir.add(CCPos[n]);
       dirEnd.add(CCPos[n]);
       
       beginShape();
       vertex(SPos.x, SPos.y);
       bezierVertex(StPos.x, StPos.y,   dir.x,dir.y,   dirEnd.x, dirEnd.y);
       bezierVertex(dir.x, dir.y,  EnPos.x, EnPos.y,   EPos.x, EPos.y);
       endShape();
    
    }//close loop n
    
  }//close class1
}//close class2

//class SplashLine{
//  SplashLine(PVector LinePos, PVector[] LinePosArray, PVector[] CirclePos, float step){
    
 //     
//  }
//}
class Txt {
  Txt(PVector pos, String name, float T, PVector[] posArray) {   
    
    noStroke();
    
    float stepT;
    if(posArray.length>0){
      stepT = posArray[posArray.length-1].y;
    }else{
      stepT = 0;
    }


    textAlign(RIGHT,CENTER);
    rectMode(CORNER);
    textSize(3*k);
    pushMatrix();
      translate(pos.x, pos.y+k*3.5);
      rotate(-HALF_PI);
      fill(br,bg,bb);
      float tw1 = textWidth(name);  
      rect(-tw1,-5,tw1+2,11);
      fill(0);
      text(name,0,0);
    popMatrix();
   
    textAlign(CENTER,CENTER);
    textSize(3*k);
    float S = int(T*massRatio/100);
    String quant = nf(S,0,-1);
    rectMode(CENTER);
    float tw2 = textWidth(quant);
    fill(br,bg,bb);
    rect(pos.x,stepT-2.5*k,tw2,3*k);
    fill(br/3,bg/3,bb/3);
    text(quant,pos.x,stepT-2.5*k);
   }
}



class TxtC {
  TxtC(PVector pos, String name, float T, float D, color rectcol) {   
    
    if(D>0){
    if(3*k>0.80*D){
      textSize(0.80*D); 
    }else{
      textSize(3*k);
    }
    textAlign(CENTER,CENTER);
    float S = int(T*massRatio/100);
    String quant = nf(S,0,-1);
    rectMode(CENTER);
    float tw2 = textWidth(quant);
    fill(rectcol);
    rect(pos.x,pos.y-D/2,tw2,D/2);
    fill(br,bg,bb);
    text(quant,pos.x,pos.y-D/2);
    
    }
    
   }
}

class TxtE {
  TxtE(PVector pos, String name, float T, float D) {   
    
    if(D>0){
    textAlign(RIGHT,CENTER);
    rectMode(CORNER);
    textSize(3*k);
    pushMatrix();
      translate(pos.x, pos.y+k*3.5);
      rotate(-HALF_PI);
      fill(br,bg,bb);
      float tw1 = textWidth(name);  
      rect(-tw1,-5,tw1+2,11);
      fill(0);
      text(name,0,0);
    popMatrix();
    
    
    }
    
   }
}



class timeLine {
  timeLine(int timeStep, float[] pop){

    float xpos = k; 
    float ypos = 200*k;
    strokeWeight(0.3*k);
    stroke(0);
    
    fill(br,bg,bb);
    noStroke();
    rectMode(CORNER);
    rect(0,ypos-8*k, width,100*k);
    
    fill(0);
    textAlign(LEFT,BOTTOM);
    textSize(8*k);
    text(1950+timeStep,xpos,ypos);
    textAlign(LEFT,BOTTOM);
    fill(br/2,bg/2,bb/2);
    textSize(4*k);
    String population = nf(pop[timeStep],0,0);
    text("Population of Japan: "+population+ " millions",xpos,ypos+6*k);

    for(int i=0; i<25; i++){
      for(int j=0; j<25; j++){
        if((i*25+j)>=pop[timeStep]){
          break;
        }//close if
 
          PVector POS = new PVector(j*3*k+xpos+k,i*5.5*k+ypos+8*k);
          ellipse(POS.x,POS.y, k,k);
          float S=0.6*k;
          noStroke();
          fill(0);
          curveTightness(0);
          beginShape();
            vertex(POS.x,  POS.y+0.6*S);
            vertex(POS.x-1.1*S,  POS.y+0.6*S);
            vertex(POS.x-1.1*S,  POS.y+3.0*S);
            vertex(POS.x-0.7*S,  POS.y+3.0*S);
            vertex(POS.x-0.7*S, POS.y+1.2*S);
            vertex(POS.x-0.6*S, POS.y+1.2*S);
            vertex(POS.x-0.6*S,  POS.y+5.8*S);
            vertex(POS.x-0.1*S,  POS.y+5.8*S);
            vertex(POS.x-0.1*S,  POS.y+3.0*S);
            vertex(POS.x+0.1*S, POS.y+3.0*S);
            vertex(POS.x+0.1*S, POS.y+5.8*S);
            vertex(POS.x+0.6*S, POS.y+5.8*S);
            vertex(POS.x+0.6*S,  POS.y+1.2*S);
            vertex(POS.x+0.7*S,  POS.y+1.2*S);
            vertex(POS.x+0.7*S, POS.y+3.0*S);
            vertex(POS.x+1.1*S, POS.y+3.0*S);
            vertex(POS.x+1.1*S, POS.y+0.6*S);
          endShape(CLOSE);
      }//close loop
        if((i*25+25)>=pop[timeStep]){
          break;
        }
    }
    textAlign(RIGHT);
    fill(0);
    text("(million tons)",width-k,ypos+6*k);

    
  }
}
 
 




