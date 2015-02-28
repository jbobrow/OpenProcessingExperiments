
import processing.opengl.*;
PImage img,img2;

PFont font, font2,font3;

Table stateData;
int ySize;
int wide=1000;
int high=800;
int iW=0;
int showX,showY;
//visSettings
int backgroundColor=255;
boolean imageOn=false;
//spiderSettings
int generations, genes;
int pgonRadius=125;
int pgonCenterX=wide/2+pgonRadius+120;
int pgonCenterY=floor(high/3.6);
float[] maxP, minP, maxParam, xP, yP, barX, barY, tVal1, tVal2,tBare;
int pop=-1;

//Plot graph settings
int lengthY=floor(wide/8*1.7);
int lengthX=floor(lengthY*1.61803398875);
int originX=floor(wide/2+60);
int originY=floor(high/2+high/2.35);
int xGene=0;
int yGene=1;
int radGene;
int xRef=xGene;
int yRef=yGene;
int radRef;
int radSlide=8;
int radSlide2;
int xLoc1=0+radSlide;
int yLoc1=0;
int xLoc2=lengthX-radSlide;
int yLoc2=0;
int xLoc3=0;
int yLoc3=0-radSlide;
int xLoc4=0;
int yLoc4=0-lengthY+radSlide;
float xRangeLB, xRangeUB, yRangeLB, yRangeUB;
boolean bool1, bool3, bool4, dragger;
boolean released=true;
boolean[] hover2, hover3, locker, locker2, hover4, locker3;
int xRect[], xRect2[], trackX1[], trackX2[], maxNegX[], maxPosX[];
float val0[], val1[];
int lengthiness;
boolean bool2=false;
boolean hover=false;
boolean hoverGene=false;
boolean[] fix,fixA;
int[] tester;
float rad;
int barQ;
boolean any=false;
int fSize;
//Plot graph settings
boolean boldA=false;
//SLIDERS
int fontSize=10;
int fitnessMin, fitnessMax;
float[] min, max;
int xyMargin,orX,orY,weight;
int radius=50;
int barMargin=25;
int barWidth=380;
int barWindowHeight=100;
float fitnessLevel;
float fitnessLevelUB;

boolean[] hov=new boolean [2];
boolean[] locked=new boolean[2];
int[] radDrag=new int [2];      
int[] radBase=new int [2];
int rank;
float[] radSort;

int hop;
int[] yStep;
boolean ranker;
int extras;


void setup() {
  background(backgroundColor);
  size(1000, 800);
  smooth();

  //////////////////////////////essential genes
  font=loadFont("BentonSans-Bold-48.vlw");
  font2=loadFont("BentonSans-Light-48.vlw");
  font3=loadFont("BentonSans-Regular-48.vlw");
  textFont(font);

  stateData = new Table("galapagos.tsv");
  generations = stateData.getRowCount()-1;
  genes = stateData.getInt(0, 0);
  //////////////////////////////essential genes

  //Plot graph settings
  radGene=genes;
  radRef=radGene;

  /////////////////SPIDER//////////////////////////////////////////////////////
  ////SETUP MAX AND MIN OF EACH GENE///////////////////////////////////////////
  min=new float[genes+1];
  max=new float[genes+1];
  maxP=new float[genes+1];
  minP=new float[genes+1];
  yStep=new int[genes+1];
  xP=new float[genes*generations];
  radSort=new float[generations];
  tester=new int[generations];
  fix=new boolean[generations];
  fixA=new boolean[generations];

  yP=new float[genes*generations];
  maxParam=new float[generations];
  barX=new float[generations];
  barY=new float[generations];
  tBare=new float[generations];
  tVal1=new float[generations];
  tVal2=new float[generations];
  for (int t=1;t<=genes+1;t++) {
    for (int u=1;u<=generations;u++) {
      maxParam[u-1]=(stateData.getFloat(u, t));
      maxP[t-1]=max(maxParam);
      minP[t-1]=min(maxParam);
    }
  }
  ////SETUP MAX AND MIN OF EACH GENE///////////////////////////////////////////
  /////////////////SPIDER//////////////////////////////////////////////////////


  //////////////////////////////SLIDERS//////////////////////////////////////////////////////////////////
  xRect=new int[genes+1];
  xRect2=new int[genes+1];
  val0=new float[genes+1];
  val1=new float[genes+1];
  trackX1=new int[genes+1];
  trackX2=new int[genes+1];
  maxNegX=new int[genes+1];
  maxPosX=new int[genes+1];
  hover2=new boolean[genes+1];
  hover3=new boolean[genes+1];
  hover4=new boolean[genes+1];
  locker=new boolean[genes+1];
  locker2=new boolean[genes+1];
  locker3=new boolean[genes+1];
  for (int i=1;i<genes+2;i++) {
    xRect[i-1]=barMargin;
    xRect2[i-1]=barMargin+barWidth;
    hover2[i-1]=false;
    hover3[i-1]=false;
    locker[i-1]=false;
    locker2[i-1]=false;
    hover4[i-1]=false;
    locker3[i-1]=false;
  }
  int sliderSize=(barWindowHeight-barMargin*2)/(genes+1);
  int fitnessHighValue=220;
  int fitnessLowValue=0;

  ///////range slider stuff
  int sliderMargin=10;
  //////////////////////////////SLIDERS//////////////////////////////////////////////////////////////////
    img = loadImage("lmnts-logowhite.png");
    img2 = loadImage("8.jpg");
}///CLOSEOUT VOID SETUP///////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  
  boolean sing=true;
  boolean select=false;
  extras=0;
  for(int i=0;i<generations;i++){
    if(fix[i]==true||fixA[i]==true){
      extras++;}}
int[] extraList;
extraList=new int[extras];
extras=0;
for(int i=0;i<generations;i++){
  if(fix[i]==true||fixA[i]==true){
    extraList[extras]=i;
    extras++;}}
fill(0);

  any=false;
  background(backgroundColor);
  strokeWeight(4);
  fill(0);
  textSize(50);
  textAlign(RIGHT, TOP);

  noStroke();
  strokeWeight(0);
  stroke(0);
  line(wide/2-35,35,wide/2-35,high-35);

//  rect(wide/10-40,120,130,45);
//  int xIn=wide/10+90;
//  int yIn=120;
//  int rectW=140;
//  int rectH=45;
//  extras=2;
//  int rectHS=0;
//  int last=0;
//  int extraMargin=min(5,100*1/extras);
//  if(extras>1){
//  rectHS=(rectW-extraMargin*(extras))/extras;
//  for(int i=0;i<extras;i++){
//    noStroke();
//    rect(xIn-(extraMargin+rectHS)*i,yIn,-rectHS,rectH);
//    if(i==extras-1){last=-(extraMargin+rectHS)*i-rectHS;}}
//  }
//  stroke(0);
//  strokeWeight(2);
//  noFill();
//  rect(xIn+4,yIn-4,last-8,rectH+8);
  //update newsliders
  int trans=10;
  int transY=185;
  translate(trans,transY);
  for (int i=1;i<genes+2;i++) {
    ySize=min(fontSize, floor(barWindowHeight/genes));
    hop=35;
    yStep[i-1]=hop+barMargin+(hop+(ySize+barMargin))*(i-1);
    maxNegX[i-1]=-xRect[i-1]+barMargin;
    maxPosX[i-1]=barMargin+barWidth-xRect2[i-1];
    fill(0, 10);
    noStroke();
    rect(barMargin, yStep[i-1], barWidth, ySize);
    if(i==1){
      for(int j=0;j<2;j++){
      int barRat=5;
      int xR=barMargin+barWidth-barWidth/2;
      int varY=(yStep[i-1]+ySize)*genes+(yStep[i-1]+ySize)*(j+2)-ySize;
      rect(barMargin,varY,barWidth,ySize);
      if(mouseX<barMargin+xR+radDrag[j]+trans&&mouseX>barMargin+trans&&mouseY>varY+transY&&mouseY<varY+transY+ySize||locked[j]==true){
        fill(0,150); hov[j]=true;}else{fill(0,50);hov[j]=false;}
      if(hov[0]==true&&hov[1]==false){
        if(mousePressed){
          radDrag[0]=mouseX-trans-radBase[0];locked[0]=true;}else{radBase[0]=mouseX-trans-radDrag[0];locked[0]=false;}
      }
      if(hov[1]==true&&hov[0]==false){
        if(mousePressed){
          ranker=true;
          radDrag[1]=mouseX-trans-radBase[1];locked[1]=true;}else{radBase[1]=mouseX-trans-radDrag[1];locked[1]=false;}
      }
      radDrag[j]=min(max(15-xR,radDrag[j]),barWidth-xR);
      rect(barMargin,varY,xR+radDrag[j],ySize); 
      
      radius=floor(min(max(15,float(xR)+float(radDrag[0])),float(barWidth))/float(barWidth)*100);
      textAlign(LEFT,BOTTOM);
      fill(0);
      textFont(font2);
      textSize(fontSize*1.55);
      barQ=barMargin+ySize;
      if(j==0){
      text("graph radius",barQ+ySize,high-barMargin*barRat-transY-ySize);
      }
      if(j==1){
        text("radius rank",barQ+ySize,high-barMargin*barRat-transY+yStep[i-1]);
        textSize(fontSize);
        fill(0);
        textAlign(RIGHT,TOP);
        rank=floor(map(min(max(15,float(xR)+float(radDrag[1])),float(barWidth))/float(barWidth)*100,3,100,min(100,generations),1));
        text(rank,barMargin+xR+radDrag[1]-3,varY);
        noStroke();
        for(int q=1;q<generations+1;q++){
        if(fixA[q-1]==true){
        fill(50);
        ellipse(barMargin,varY+ySize/2,15,15);
        stroke(255);
        strokeWeight(2);
        point(barMargin,varY+ySize/2);
        noStroke();
        }
        }
      }
      fill(0,10);
    }
    }
    
    
    textFont(font);

    
    
    if (mouseX>trans+trackX2[i-1]+xRect[i-1]+ySize&&mouseX<trans+trackX2[i-1]+xRect2[i-1]-ySize&&mouseY>transY+yStep[i-1]&&mouseY<transY+yStep[i-1]+ySize&&released==true) {
      hover4[i-1]=true;
    }
    else {
      hover4[i-1]=false;
    }
    if (mousePressed&&hover4[i-1]==true&&released==true) {
      locker3[i-1]=true;
      released=false;
    } 
    if (released==true) {
      locker3[i-1]=false;
    }
    if (locker3[i-1]==true) {
      trackX2[i-1]=min(max(maxNegX[i-1], mouseX-trans-trackX1[i-1]), maxPosX[i-1]);
    }
    else {
      trackX1[i-1]=mouseX-trans-trackX2[i-1];
    }
    if (mouseX>trans+trackX2[i-1]+xRect[i-1]&&mouseX<trans+trackX2[i-1]+xRect[i-1]+ySize&&mouseY>transY+yStep[i-1]&&mouseY<transY+yStep[i-1]+ySize&&released==true) {
      hover2[i-1]=true;
      ;
    }
    else {
      hover2[i-1]=false;
    }
    if (mousePressed&&hover2[i-1]==true&&released==true) {
      locker[i-1]=true;
      released=false;
    } 
    if (released==true) {
      locker[i-1]=false;
    }
    if (locker[i-1]==true) {
      xRect[i-1]=mouseX-trans-trackX2[i-1];
    }
    if (mouseX>trans+trackX2[i-1]+xRect2[i-1]-ySize&&mouseX<trans+trackX2[i-1]+xRect2[i-1]&&mouseY>transY+yStep[i-1]&&mouseY<transY+yStep[i-1]+ySize&&released==true) {
      hover3[i-1]=true;
    }
    else {
      hover3[i-1]=false;
    }
    if (mousePressed&&hover3[i-1]==true&&released==true) {
      locker2[i-1]=true;
      released=false;
    } 
    if (released==true) {
      locker2[i-1]=false;
    }
    if (locker2[i-1]==true) {
      xRect2[i-1]=mouseX-trans-trackX2[i-1];
      if (xRect2[i-1]<xRect[i-1]+ySize*2) {
        xRect2[i-1]=xRect[i-1]+ySize*2;
      }
    }
    xRect[i-1]=min(min(max(xRect[i-1], barMargin-trackX2[i-1]), barMargin+barWidth-ySize*2-trackX2[i-1]), xRect2[i-1]-ySize*2);
    xRect2[i-1]=max(max(min(barMargin+barWidth-trackX2[i-1], xRect2[i-1]), barMargin+ySize*2-trackX2[i-1]), xRect[i-1]+ySize*2);

    translate(trackX2[i-1], 0);
    if (hover2[i-1]==true||locker[i-1]==true) {            
      fill(0);
    }
    else {
      fill(0, 100);
    }
    rect(xRect[i-1], yStep[i-1], ySize, ySize);
    if (hover3[i-1]==true||locker2[i-1]==true) {
      fill(0);
    }
    else {
      fill(0, 100);
    }
    rect(xRect2[i-1]-ySize, yStep[i-1], ySize, ySize);

    if (hover4[i-1]==true||locker3[i-1]==true) {
      fill(0);
    }
    else {
      fill(0, 30);
    }
    rect(xRect[i-1]+ySize, yStep[i-1]+ySize/2-1, xRect2[i-1]-ySize*2-xRect[i-1], 2);
    fill(0, 10);
    translate(-trackX2[i-1], 0);

    fill(0);
    textSize(fontSize);
    int tOffsetX=6;
    int tOffsetY=3;
    val0[i-1]=(float(xRect[i-1])+float(trackX2[i-1])-float(barMargin))/(float(barWidth)-float(barMargin))*(maxP[i-1]-minP[i-1])+minP[i-1];
    val1[i-1]=((float(xRect2[i-1])+float(trackX2[i-1])-float(barMargin)*2)/(float(barWidth)-float(barMargin))*(maxP[i-1]-minP[i-1])+minP[i-1]);
    textAlign(LEFT, TOP);

    if (maxP[i-1]<30) {
      text(nf(val0[i-1], 0, 2), xRect[i-1]+ySize+trackX2[i-1]+tOffsetX, yStep[i-1]+ySize*1.5-1-tOffsetY);
    }
    else {
      text(nfc(int(val0[i-1])), xRect[i-1]+ySize+trackX2[i-1]+tOffsetX, yStep[i-1]+ySize*1.5-1-tOffsetY);
    }
    textAlign(RIGHT, TOP);
    if (maxP[i-1]<30) {
      text(nf(val1[i-1], 0, 2), xRect2[i-1]-ySize+trackX2[i-1]-tOffsetX, yStep[i-1]+ySize*1.5-1-tOffsetY);
    }
    else {
      text(nfc(int(val1[i-1])), xRect2[i-1]-ySize+trackX2[i-1]-tOffsetX, yStep[i-1]+ySize*1.5-1-tOffsetY);
    }
  }
translate(-trans,-transY);
///////////////////range sliders end

  /////////////////SPIDER//////////////////////////////////////////////////////
  /////////////////////////GENERATE BASE POLYGON LINES AND TEXT/////////////////////////
  for (int i=0; i<genes; i++) {
    stroke(0);
    weight=10;
    textFont(font2);
    strokeWeight(weight/3);
    textSize(fontSize*1.1);
    float angle = i*((2*PI)/genes);
    float x=pgonCenterX+cos(angle)*pgonRadius;
    float y=pgonCenterY+sin(angle)*pgonRadius;
    line(pgonCenterX, pgonCenterY, x, y);
    translate(pgonCenterX, pgonCenterY);
    float angle2 = i*((2*PI)/genes);
    rotate(angle2);
    int textOnLine=pgonRadius+pgonRadius/20;
    if (angle2>PI/2&&angle2<3*PI/2) { //just to rotate text
      translate(textOnLine, 0);
      rotate(PI);
      translate(-textOnLine, 0);
      textAlign(RIGHT, CENTER);
    }
    else {
      textAlign(LEFT,CENTER);
    }
    text(stateData.getString(0, i+1), textOnLine, -1.5);
    if (angle2>PI/2&&angle2<3*PI/2) {//just to rotate text
      translate(textOnLine, 0);
      rotate(PI);
      translate(-textOnLine, 0);
    }
    rotate(angle2*-1);
    translate(-pgonCenterX, -pgonCenterY);
    textAlign(LEFT,CENTER);
    ///plot graph text/////////////////////////////////////////////////////////
    translate(originX, originY);
    xyMargin=120;
    orX=floor(-xyMargin/.95);
    orY=floor(-lengthY-120);
    /////////////////////////adding fitness (convoluted)///////////////////////////////
    fill(0);
    stroke(0);

    ////////adding points to zoom in
    if (dist(mouseX, mouseY, originX+xLoc1, originY+yLoc1)<radSlide) {
      radSlide2=12;
      bool1=true;
    }
    else {
      radSlide2=radSlide;
      bool1=false;
    }
    strokeWeight(radSlide2);
    point(xLoc1, yLoc1);
    if (dist(mouseX, mouseY, originX+xLoc2, originY+yLoc2)<radSlide) {
      radSlide2=12;
      bool2=true;
    }
    else {
      radSlide2=radSlide;
      bool2=false;
    }
    strokeWeight(radSlide2);      
    point(xLoc2, yLoc2);  

    if (dist(mouseX, mouseY, originX+xLoc3, originY+yLoc3)<radSlide) {
      radSlide2=12;
      bool3=true;
    }
    else {
      radSlide2=radSlide;
      bool3=false;
    }
    strokeWeight(radSlide2);
    point(xLoc3, yLoc3);
    if (dist(mouseX, mouseY, originX+xLoc4, originY+yLoc4)<radSlide) {
      radSlide2=12;
      bool4=true;
    }
    else {
      radSlide2=radSlide;
      bool4=false;
    }
    strokeWeight(radSlide2);      
    point(xLoc4, yLoc4);    
    xRangeLB=abs(float(xLoc1-radSlide)/float(lengthX-radSlide)); 
    xRangeUB=abs(float(xLoc2)/float(lengthX-radSlide)); 
    yRangeLB=abs(float(yLoc3+radSlide)/float(lengthY-radSlide)); 
    yRangeUB=abs(float(yLoc4)/float(lengthY-radSlide)); 

    ////////adding points to zoom in      
    noStroke();
    if (i==0) {
      if (mouseX>originX+orX+lengthX/2 && mouseX<originX+orX+lengthX/2+xyMargin && mouseY<originY+orY+weight*(-1)+weight*3+weight/2 && mouseY>originY+orY+weight*(-1)+weight*3-weight/2) {
        fill(100);
        textSize(20);
        xRef=genes;
        yRef=yGene;
        radRef=radGene;
        any=true;
      }
      else {
        textSize(10);
        fill(200);
      }
      if (xGene==genes) {
        fill(0);
        textSize(20);
      }
      text("fitness", orX+lengthX/2, orY+weight*2);
      if (mouseX>originX+orX+lengthX/2+xyMargin && mouseX<originX+orX+lengthX/2+xyMargin*2 && mouseY<originY+orY+weight*(-1)+weight*3+weight/2 && mouseY>originY+orY+weight*(-1)+weight*3-weight/2) {
        fill(100);
        textSize(20);
        any=true;
        yRef=genes;
        xRef=xGene;
        radRef=radGene;
        
      }
      else {
        textSize(10);
        fill(200);
      }
      if (yGene==genes) {
        fill(0);
        textSize(15);
      } 
      text("fitness", orX+lengthX/2+xyMargin, orY+weight*2);
      if (mouseX>originX+orX+lengthX/2+xyMargin*2 && mouseX<originX+orX+lengthX/2+xyMargin*3 && mouseY<originY+orY+weight*(-1)+weight*3+weight/2 && mouseY>originY+orY+weight*(-1)+weight*3-weight/2) {
        fill(100);
        textSize(20);
        any=true;
        radRef=genes;
        xRef=xGene;
        yRef=yGene;
      }
      else {
        textSize(10);
        fill(200);
      }
      if (radGene==genes) {
        fill(0);
        textSize(15);
      } 
      text("fitness", orX+lengthX/2+xyMargin*2+weight*genes/2, orY+weight*2);

      /////////////////////////adding fitness (convoluted)////////////////////////////////


      fill(0);
      textSize(weight*genes);
      textAlign(RIGHT, CENTER);   
      text("X", orX+lengthX/2-weight, orY+weight*genes/2+weight*2);
      text("Y", orX+lengthX/2-weight+xyMargin, orY+weight*genes/2+weight*2);
      fill(0, 100);
      noStroke();
      ellipse(orX+lengthX/2-weight+xyMargin*2, orY+weight*genes/2+weight*2, weight*genes, weight*genes);
      strokeWeight(2);
      stroke(0);
      point(orX+lengthX/2-weight+xyMargin*2, orY+weight*genes/2+weight*2);
      noStroke();
      fill(0);
    }
    textAlign(LEFT, CENTER);

    if (mouseX>originX+orX+lengthX/2 && mouseX<originX+orX+lengthX/2+xyMargin && mouseY<originY+orY+weight*(i)+weight*3+weight/2 && mouseY>originY+orY+weight*(i)+weight*3-weight/2) {
      fill(100);
      textSize(20);
      any=true;
      xRef=i;
      yRef=yGene;
      radRef=radGene;
    }
    else {
      textSize(10);
      fill(200);
    } 
    if (xGene==i) {
      fill(0);
      textSize(15);
    }     
    text(stateData.getString(0, i+1).toLowerCase(), orX+lengthX/2, orY+i*(weight)+weight*3);
    if (mouseX>originX+orX+lengthX/2+xyMargin && mouseX<originX+orX+lengthX/2+xyMargin*2 && mouseY<originY+orY+weight*(i)+weight*3+weight/2 && mouseY>originY+orY+weight*(i)+weight*3-weight/2) {
      fill(100);
      textSize(20);
      any=true;
      yRef=i;
      xRef=xGene;
      radRef=radGene;
    }
    else {
      textSize(10);
      fill(200);
    }   
    if (yGene==i) {
      fill(0);
      textSize(15);
    }  
    text(stateData.getString(0, i+1).toLowerCase(), orX+lengthX/2+xyMargin, orY+i*(weight)+weight*3);
    if (mouseX>originX+orX+lengthX/2+xyMargin*2 && mouseX<originX+orX+lengthX/2+xyMargin*3 && mouseY<originY+orY+weight*(i)+weight*3+weight/2 && mouseY>originY+orY+weight*(i)+weight*3-weight/2) {
      fill(100);
      textSize(20);
      any=true;
      radRef=i;
      xRef=xGene;
      yRef=yGene;
    }
    else {
      textSize(10);
      fill(200);
    }   
    if (radGene==i) {
      fill(0);
      textSize(15);
    } 
    text(stateData.getString(0, i+1).toLowerCase(), orX+lengthX/2+xyMargin*2+weight*genes/2, orY+i*(weight)+weight*3);

    fill(0);

    if (i==0) {
      textSize(15);
      textAlign(CENTER, CENTER);  
      text(stateData.getString(0, xGene+1).toLowerCase(), lengthX/2, weight*2.25);
    }
    if (i==0) {
      rotate(-PI/2);
      text(stateData.getString(0, yGene+1).toLowerCase(), lengthY/2, -weight*2.25);
      rotate(PI/2);
    }
    translate(-originX, -originY);
    ///plot graph text//////////////////////////////////////////////////////////
  }  
  /////////////////////////GENERATE BASE POLYGON LINES AND TEXT/////////////////////////
  //////////////GENERATE FITNESS LINES/////////////////////////////////////////
  ////rad rank play
    radSort=reverse(sort(tBare));
  for (int j=1;j<=generations;j++) {
    tester[j-1]=0;
    for (int k=0; k<genes+1; k++) {
      stroke(0);
      strokeCap(SQUARE);
      float t = map(stateData.getFloat(j, k+1), minP[k], maxP[k], 0, 1);
      float tX=map(t, xRangeLB, xRangeUB, 0, 1);
      float tY=map(t, yRangeLB, yRangeUB, 0, 1);
      ///////segment for bar graph/////////////////////////////////////////////////
      strokeWeight(1);
      stroke(0);
      line(originX, originY, originX+lengthX, originY);
      line(originX, originY, originX, originY-lengthY);
      int tOffset=15;
      if (k==xGene) {
        barX[j-1]=originX+lengthX*tX;
        textAlign(CENTER, CENTER);
        textSize(12);
        if(j==1){
        text(nf((maxP[k]-minP[k])*xRangeUB+minP[k], 0, 2), originX+lengthX, yLoc2+originY+tOffset);
        text(nf((maxP[k]-minP[k])*xRangeLB+minP[k], 0, 2), originX, yLoc1+originY+tOffset);
      }}
      if (k==radGene) {
        tVal1[j-1]=map(stateData.getFloat(j, k+1), 0, maxP[k], 0, 1);  //get fitness level at this interval
        tBare[j-1]=stateData.getFloat(j, k+1);  //get fitness level at this interval
      }
      if (k==yGene) {
        barY[j-1]=originY-lengthY*tY;
        textAlign(RIGHT, CENTER);
        textSize(12);
        if(j==1){
        text(nf((maxP[k]-minP[k])*yRangeUB+minP[k], 0, 2), xLoc4+originX-tOffset, originY-lengthY);
        text(nf((maxP[k]-minP[k])*yRangeLB+minP[k], 0, 2), xLoc3+originX-tOffset, originY);
      }}
      ///////segment for bar graph/////////////////////////////////////////////////

      strokeCap(SQUARE);
      float angle = k*((2*PI)/genes);
      float x=cos(angle)*pgonRadius;
      float y=sin(angle)*pgonRadius;
      xP[j*(genes-1)+k]=pgonCenterX+x*t;
      yP[j*(genes-1)+k]=pgonCenterY+y*t;

      int drawer=0;
      for (int m=1; m<=genes+1; m++) {
        if (stateData.getFloat(j, m)<val1[m-1]&&stateData.getFloat(j, m)>val0[m-1]) {/////slider queue
          drawer++;
        }
      }

      if (drawer>=genes+1) {
        if (j==pop&&mouseX>originX&&mouseX<originX+lengthX&&mouseY<originY&&mouseY>originY-lengthY || fix[j-1]==true|| fixA[j-1]==true) {
          strokeWeight(5);
        }
        else {
          strokeWeight(0);
        }
        if (k!=0&&k<genes) { ///just gets rid of the first line coming from 0,0//
          line(xP[j*(genes-1)+k-1], yP[j*(genes-1)+k-1], xP[j*(genes-1)+k], yP[j*(genes-1)+k]);
        }
        if (k==genes-1) {
          line(xP[j*(genes-1)+k], yP[j*(genes-1)+k], xP[j*(genes-1)+k-genes+1], yP[j*(genes-1)+k-genes+1]);
        }
      }
      strokeCap(ROUND);
      rad=(tVal1[j-1]*radius);
      strokeWeight(2);
      stroke(0);
      strokeWeight(1);
      fill(0, 50);
      if (barX[j-1]<originX||barX[j-1]>originX+lengthX||barY[j-1]>originY||barY[j-1]<originY-lengthY) {
        fill(0, 10);
        stroke(70);
        hover=true;
      }
      else {
        hover=false;
      }

      ///texts
      textFont(font2);
      textSize(fontSize*1.55);
      textAlign(LEFT,BOTTOM);//////////genometext
      if(j==1){
        fill(0);
      text(stateData.getString(0, k+1).toLowerCase(), barQ+ySize*2, yStep[k]+transY);}
      if(locked[1]==true||fixA[j-1]==true){
        if(tBare[j-1]==radSort[rank]){
        pop=j;
        tester[j-1]=1;
        fill(0);
        fixA[j-1]=true;
        
          fill(0);
        text(stateData.getString(0, k+1).toLowerCase()+": "+stateData.getString(j, k+1).toLowerCase(), barQ+ySize*2, yStep[k]+transY);}
      
      else if(tBare[j-1]!=radSort[rank]){fixA[j-1]=false;}
      }
      else if (dist(mouseX, mouseY, barX[j-1], barY[j-1])<rad/4||fix[j-1]==true) {
        pop=j;
        tester[j-1]=1;
        if (hover==false) {
          fill(0);
          stroke(0);
        }
        else {
          fill(0, 70);
          stroke(0,30);
        }
      
         text(stateData.getString(0, k+1).toLowerCase()+": "+stateData.getString(j, k+1).toLowerCase(), barQ+ySize*2, yStep[k]+transY);}
      
      else {
        tester[j-1]=0;
      }
      textFont(font2);

      if (drawer>=genes+1&&k==0) {
        strokeWeight(1.5);
        point(barX[j-1], barY[j-1]);
        noStroke();

        ellipse(barX[j-1], barY[j-1], rad/2, rad/2);
        noStroke();
        fill(0);
      }
    
  }

//  if(fix[j-1]==true||fixA[j-1]==true&&sing==true){
  }
if(extras>1){
  select=true;}else{select=false;}
  /////////////////GENERATE FITNESS LINES//////////////////////////////////////

  /////////////////SPIDER///////////////////////////////////////////////////////////////

  /////////////////PLOT GRAPH///////////////////////////////////////////////////////////
println(boldA);  

if(boldA==true){
  fill(255,200);
  noStroke();
  rect(0,0,wide,high);
fill(0,220);

rect(0,200,wide,high-200);
image(img2, 12, 210);
imageOn=true;
}
image(img, wide/10-40, 60);


textFont(font2);
fSize=floor(fontSize*2.5);
textSize(fSize);

fill(0);
showX=200;
showY=140;
boolean popup=false;
if(mouseX>showX&&mouseX<showX+200&&mouseY>showY-fSize&&mouseY<showY){
textFont(font3);textSize(fSize);

if(extras==0){textFont(font2);textSize(fSize);if(imageOn==false){text("make selection first.",200,140+fSize*2.4);}textFont(font3);textSize(fSize);}}
for(int b=0;b<generations;b++){
if((fix[b]==true||fixA[b]==true||boldA==true)&&popup==false){
text("show image",showX,showY);
textFont(font2);
textSize(fSize);
if(mouseX>showX&&mouseX<showX+200&&mouseY>showY-fSize+fSize*1.2&&mouseY<showY+fSize*1.2){
text("not available online.",200,140+fSize*2.4);textFont(font3);textSize(fSize);}
text("reinstate genome",200,140+fSize*1.2);
textFont(font);
sing=false;
popup=true;}}

  
}///CLOSEOUT VOID DRAW///////////////////////////////////////////////////////////////////////////////////////////

void mouseClicked() {
  if(hov[1]==false&&any==false){
    for(int h=0;h<generations;h++){
    fixA[h]=false;}}
    
    if(mouseX>showX&&mouseX<showX+200&&mouseY>showY-fSize&&mouseY<showY&&extras>0){
      boldA=true;}else{boldA=false;}    
  if(any==true){
  xGene=xRef;
  yGene=yRef;
  radGene=radRef;}
  
  if(boldA==false){imageOn=false;}
  
  for (int i=0;i<generations;i++) {
    if (tester[i]>0&&dist(mouseX, mouseY, barX[i], barY[i])<rad/4) {
      int total=0;
      fix[i]=true;
      total++;
    }
    else if(any==false){
      fix[i]=false;
    }
  } 
}
void mouseReleased() {
  released=true;
  ranker=false;
}
void mouseDragged() {
  dragger=true;
  if (bool1==true&&bool2==false) {
    xLoc1=max(radSlide, min(mouseX-originX, xLoc2-radSlide2));
    yLoc1=0;
  }
  if (bool2==true&&bool1==false) {
    xLoc2=min(lengthX-radSlide, max(mouseX-originX, xLoc1+radSlide2));
    yLoc2=0;
  }
  if (bool3==true&&bool4==false) {
    xLoc3=0;
    yLoc3=min(-radSlide, max(mouseY-originY, yLoc4+radSlide2));
  }
  if (bool4==true&&bool3==false) {
    xLoc4=0;
    yLoc4=max(-lengthY+radSlide, min(mouseY-originY, yLoc3-radSlide2));
  }
}


