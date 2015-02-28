
import java.awt.*;
import java.awt.event.KeyEvent;
import java.io.File;

PImage sourceImg,targetImg,resultImgLAB,resultImgRGB;
float[][] srcRGB,tarRGB,sR,sG,sB,tR,tG,tB,sL,sM,sS,tL,tM,tS,sLogL,sLogM,sLogS,tLogL,tLogM,tLogS;
float[][] sLL,sAA,sBB,tLL,tAA,tBB,sLMean,sAMean,sBMean,sRMean,sGMean,sBBMean;
float[] finalL,finalA,finalB;
float meanSL,meanSA,meanSB,meanTL,meanTA,meanTB,meanSR,meanSG,meanSBB,meanTR,meanTG,meanTBB;
int tWid,tHei,sWid,sHei,loc,srcLen,tarLen;
String filename,dir;

void setup()
{
        FileDialog filedialog = new FileDialog(frame, "Choose a target image");
    filedialog.setVisible(true);
    filename = filedialog.getFile();
    dir = filedialog.getDirectory();
    targetImg = loadImage(dir+File.separator+filename);
        tWid=targetImg.width;
    tHei=targetImg.height;
    FileDialog filedialog2 = new FileDialog(frame, "Choose a source image");
    filedialog2.setVisible(true);
    filename = filedialog2.getFile();
    dir = filedialog2.getDirectory();
    sourceImg = loadImage(dir+File.separator+filename);
    sWid=sourceImg.width;
        sHei=sourceImg.height;
        srcLen=sourceImg.pixels.length;
        tarLen=targetImg.pixels.length;
        finalL = new float[srcLen];
        finalA = new float[srcLen];
        finalB = new float[srcLen];
    srcRGB = new float[sWid][sHei];
        sR = new float[sWid][sHei];
        sG = new float[sWid][sHei];
        sB = new float[sWid][sHei];
        sL = new float[sWid][sHei];
        sM = new float[sWid][sHei];
        sS = new float[sWid][sHei];
        sLogL = new float[sWid][sHei];
        sLogM = new float[sWid][sHei];
        sLogS = new float[sWid][sHei];
        sLL = new float[sWid][sHei];
        sAA = new float[sWid][sHei];
        sBB = new float[sWid][sHei];
        sLMean = new float[sWid][sHei];
        sAMean = new float[sWid][sHei];
        sBMean = new float[sWid][sHei];
        sRMean = new float[sWid][sHei];
        sGMean = new float[sWid][sHei];
        sBBMean = new float[sWid][sHei];
        tarRGB = new float[tWid][tHei];
        tR = new float[tWid][tHei];
        tG = new float[tWid][tHei];
        tB = new float[tWid][tHei];
        tL = new float[tWid][tHei];
        tM = new float[tWid][tHei];
        tS = new float[tWid][tHei];
        tLogL = new float[tWid][tHei];
        tLogM = new float[tWid][tHei];
        tLogS = new float[tWid][tHei];
        tLL = new float[tWid][tHei];
        tAA = new float[tWid][tHei];
        tBB = new float[tWid][tHei];
        resultImgLAB = createImage(sWid,sHei,RGB);
        resultImgRGB = createImage(sWid,sHei,RGB);
    size(max(tWid,sWid)+max(tWid,sWid),max(tHei,sHei)+sHei);
        image(targetImg,0,0);
    image(sourceImg,tWid,0);
        noLoop(); 
}

void draw()
{
    targetImg.loadPixels();
    calTarRGB();
    calMean(0);
    sourceImg.loadPixels();
    calSrcRGB();
    calMean(1);
    for (int y=0;y<sHei;y++)
    {
      for(int x=0;x<sWid;x++)
        calMeanMinusPoint(x,y,1);
    }    
    stdDevAndUpdateLAB();
    calMean(2);
    calMean(3);
    for (int y=0;y<sHei;y++)
    {
      for(int x=0;x<sWid;x++)
        calMeanMinusPoint(x,y,2);
    }    
    stdDevAndUpdateRGB();
}

void calSrcRGB()
{
  // Calculation RGB of source image
  //System.out.println("Start finding RGB of source image!");
  for (int y=0;y<sHei;y++)
  {
    for (int x=0;x<sWid;x++)
    {
      loc = x + y*sWid;
      sR[x][y] = red(sourceImg.pixels[loc]);
          sG[x][y] = green (sourceImg.pixels[loc]);
      sB[x][y] = blue (sourceImg.pixels[loc]);
      srcRGB[x][y]=sR[x][y]+sG[x][y]+sB[x][y];
          //print(srcRGB[x][y]+" loc="+loc+"  ");
          RGB2LMS(sR[x][y],sG[x][y],sB[x][y],x,y,1);
          //print("("+sL[x][y]+","+sM[x][y]+","+sS[x][y]+" ("+loc+"))  ");
          linear2Log(sL[x][y],sM[x][y],sS[x][y],x,y,1);
          //print("("+sLogL[x][y]+","+sLogM[x][y]+","+sLogS[x][y]+" ("+loc+"))  ");
          LMS2LAB(sLogL[x][y],sLogM[x][y],sLogS[x][y],x,y,1);
          //print("("+sLL[x][y]+","+sAA[x][y]+","+sBB[x][y]+" ("+loc+"))  ");
    }// end for x (RGB)
    //println();
  }// end for y (RGB)   
}

void calTarRGB()
{
  // Calculation RGB of target image
  //System.out.println("Start finding RGB of target image!");
  for (int y=0;y<tHei;y++)
  {
    for (int x=0;x<tWid;x++)
    {
      loc = x + y*tWid;
      tR[x][y] = red (targetImg.pixels[loc]);
          tG[x][y] = green (targetImg.pixels[loc]);
      tB[x][y] = blue (targetImg.pixels[loc]);
      tarRGB[x][y]=tR[x][y]+tG[x][y]+tB[x][y];
          //print(tarRGB[x][y]+" loc="+loc+"  ");
          RGB2LMS(tR[x][y],tG[x][y],tB[x][y],x,y,0);
          //print("("+tL[x][y]+","+tM[x][y]+","+tS[x][y]+" ("+loc+"))  ");
          linear2Log(tL[x][y],tM[x][y],tS[x][y],x,y,0);
          //print("("+tLogL[x][y]+","+tLogM[x][y]+","+tLogS[x][y]+" ("+loc+"))  ");
          LMS2LAB(tLogL[x][y],tLogM[x][y],tLogS[x][y],x,y,0);
          //print("("+tLL[x][y]+","+tAA[x][y]+","+tBB[x][y]+" ("+loc+"))  ");
    }// end for x (RGB)
    //println();
  }// end for y (RGB)     
}

void RGB2LMS(float r, float g, float b,int x,int y,int type)
{
  //println("rgb to lms");
  float l=0,m=0,s=0;
  l = (0.3811 * r) + (0.5783 * g) + (0.0402 * b);
  m = (0.1967 * r) + (0.7244 * g) + (0.0782 * b);
  s = (0.0241 * r) + (0.1288 * g) + (0.8444 * b);
  if (type==1)
  {
    sL[x][y]=l;
    sM[x][y]=m;
    sS[x][y]=s;
  }
  else
  {
    tL[x][y]=l;
    tM[x][y]=m;
    tS[x][y]=s;
  }
}

void linear2Log(float l, float m, float s,int x,int y,int type)
{
  //println("linear to log");
  float tempL=0,tempM=0,tempS=0;
  if (l!=0){tempL=log(abs(l))/log(10);}
  if (m!=0){tempM=log(abs(m))/log(10);}
  if (s!=0){tempS=log(abs(s))/log(10);}
  if (type==1)
  {
    sLogL[x][y]=tempL;
    sLogM[x][y]=tempM;
    sLogS[x][y]=tempS;
  }
  else
  {
    tLogL[x][y]=tempL;
    tLogM[x][y]=tempM;
    tLogS[x][y]=tempS;
  }
}

void LMS2LAB(float l, float m, float s,int x,int y,int type)
{
  //println("LMS to LAB");
  float ll,aa,bb,lll,aaa,bbb;
  ll = ((1 * l) + (1 * m) + (1 * s));
  aa = ((1 * l) + (1 * m) + (-2 * s));
  bb = ((1 * l) + (-1 * m) + (0 * s));
  
  lll = ((1/sqrt(3)) * ll) + (0 * aa) + (0 * bb);
  aaa = (0 * ll) + ((1/sqrt(6)) * aa) + (0 * bb);
  bbb = (0 * ll) + (0 * aa) + ((1/sqrt(2)) * bb);
  if (type==1)
  {
    sLL[x][y]=lll;
    sAA[x][y]=aaa;
    sBB[x][y]=bbb;
  }
  else
  {
    tLL[x][y]=lll;
    tAA[x][y]=aaa;
    tBB[x][y]=bbb;
  }
}
void LAB2logLMS(float ll,float aa, float bb,int x,int y,int type)
{
  //println(ll+","+aa+","+bb+","+type+"("+loc+")");
  //println("LAB to logLMS");
  float tempL,tempA,tempB,tempLL,tempAA,tempBB;
  tempL = (((sqrt(3)/3) * ll) + (0 * aa) + (0 * bb));
  tempA = ((0 * ll) + ((sqrt(6)/6) * aa) + (0 * bb));
  tempB = ((0 * ll) + (0 * aa) + (sqrt(2)/2 * bb));
  //println(tempL+","+tempA+","+tempB+","+type+"("+loc+")");
  tempLL = (1 * tempL) + (1 * tempA) + (1 * tempB);
  tempAA = (1 * tempL) + (1 * tempA) + (-1 * tempB);
  tempBB = (1 * tempL) + (-2 * tempA) + (0 * tempB);
  //println(tempLL+","+tempAA+","+tempBB+","+type+"("+loc+")");
  if (type==1)
  {
    loc = x + y*sWid;
    sLogL[x][y]=tempLL;
    sLogM[x][y]=tempAA;
    sLogS[x][y]=tempBB;
    //println(sLogL[x][y]+","+sLogM[x][y]+","+sLogS[x][y]+"("+loc+")");
  }
  else
  {
    loc = x + y*tWid;
    tLogL[x][y]=tempLL;
    tLogM[x][y]=tempAA;
    tLogS[x][y]=tempBB;
    //println(tLogL[x][y]+","+tLogM[x][y]+","+tLogS[x][y]+"("+loc+")");
  }
}

void log2Linear(float logL,float logM, float logS,int x,int y,int type)
{
  //println("Log to linear");
  float linL, linM, linS;
  linL = pow(10,logL);
  linM = pow(10,logM);
  linS = pow(10,logS);
  if (type==1)
  {
    sL[x][y]=linL;
    sM[x][y]=linM;
    sS[x][y]=linS;
  }
  else
  {
    tL[x][y]=linL;
    tM[x][y]=linM;
    tS[x][y]=linS;
  }  
}

void LMS2RGB(float l, float m, float s,int x,int y,int type)
{
  //println("LMS to RGB");
  float r,g,b;
  r = (4.4679 * l) + (-3.5873 * m) + (0.1193 * s);
  g = (-1.2186 * l) + (2.3809 * m) + (-0.1624 * s);
  b = (0.0497 * l) + (-0.2439 * m) + (1.2045 * s);
  if (type==1)
  {
    sR[x][y]=r;
    sG[x][y]=g;
    sB[x][y]=b;
  }
  else
  {
    tR[x][y]=r;
    tG[x][y]=g;
    tB[x][y]=b;
  }
}

void calMean(int type)
{
  //println("cal mean");
  float sum1=0,sum2=0,sum3=0;
  if (type==1)
  {
    for (int y=0;y<sHei;y++)
    {
      for (int x=0;x<sWid;x++)
      {
        sum1+=sLL[x][y];
        sum2+=sAA[x][y];
        sum3+=sBB[x][y];
      }
    }
    //println(sum1+","+sum2+","+sum3);
    meanSL=sum1/srcLen;
    meanSA=sum2/srcLen;
    meanSB=sum3/srcLen;
    //println("meanSL:"+meanSL+",meanSA:"+meanSA+",meanSB:"+meanSB+" 1");
  }
  else if(type==0)
  {
    for (int y=0;y<tHei;y++)
    {
      for (int x=0;x<tWid;x++)
      {
        sum1+=tLL[x][y];
        sum2+=tAA[x][y];
        sum3+=tBB[x][y];
      }
    }
    //println(sum1+","+sum2+","+sum3);
    meanTL=sum1/tarLen;
    meanTA=sum2/tarLen;
    meanTB=sum3/tarLen;
    //println("meanTL:"+meanTL+",meanTA:"+meanTA+",meanTB:"+meanTB+" 0");
  }
  else if (type==2)
  {
    for (int y=0;y<sHei;y++)
    {
      for (int x=0;x<sWid;x++)
      {
        sum1+=sR[x][y];
        sum2+=sG[x][y];
        sum3+=sB[x][y];
      }
    }
    //println(sum1+","+sum2+","+sum3);
    meanSR=sum1/srcLen;
    meanSG=sum2/srcLen;
    meanSBB=sum3/srcLen;
    //println("meanSR:"+meanSR+",meanSG:"+meanSG+",meanSBB:"+meanSBB+" 2");
  }
  else
  {
    for (int y=0;y<tHei;y++)
    {
      for (int x=0;x<tWid;x++)
      {
        sum1+=tR[x][y];
        sum2+=tG[x][y];
        sum3+=tB[x][y];
      }
    }
    //println(sum1+","+sum2+","+sum3);
    meanTR=sum1/tarLen;
    meanTG=sum2/tarLen;
    meanTBB=sum3/tarLen;
    //println("meanTR:"+meanTR+",meanTG:"+meanTG+",meanTBB:"+meanTBB+" 3");
  }
}

void calMeanMinusPoint(int x,int y,int type)
{
  //println("cal mean minus point L*A*B*&R*G*B*");
  if (type==1)
  {
    loc = x + y*sWid;
    sLMean[x][y] = sLL[x][y]-meanSL;
    //println("sLMean["+x+"]["+y+"]=sLL["+x+"]["+y+"]-meanSL="+sLMean[x][y]+"("+loc+")");
    sAMean[x][y] = sAA[x][y]-meanSA;
    //println("sAMean["+x+"]["+y+"]=sAA["+x+"]["+y+"]-meanSA="+sAMean[x][y]+"("+loc+")");
    sBMean[x][y] = sBB[x][y]-meanSB;
    //println("sBMean["+x+"]["+y+"]=sBB["+x+"]["+y+"]-meanSB="+sBMean[x][y]+"("+loc+")");
    //println(sLMean[x][y]+","+sAMean[x][y]+","+sBMean[x][y]+"("+loc+")  type1");
    //println("sLL[x][y]:"+sLL[x][y]+",sAA[x][y]:"+sAA[x][y]+",sBB[x][y]:"+sBB[x][y]+"("+loc+")  type1");
    //println("sLMean[x][y]:"+sLMean[x][y]+",sAMean[x][y]:"+sAMean[x][y]+",sBMean[x][y]:"+sBMean[x][y]+"("+loc+")  type1");
  }
  if (type==2)
  {
    loc = x + y*sWid;
    sRMean[x][y] = sR[x][y]-meanSR;
    //println("sRMean["+x+"]["+y+"]=sR["+x+"]["+y+"]-meanSR="+sRMean[x][y]+"("+loc+")");
    sGMean[x][y] = sG[x][y]-meanSG;
    //println("sGMean["+x+"]["+y+"]=sG["+x+"]["+y+"]-meanSG="+sGMean[x][y]+"("+loc+")");
    sBBMean[x][y] = sB[x][y]-meanSBB;
    //println("sBBMean["+x+"]["+y+"]=sB["+x+"]["+y+"]-meanSBB="+sBBMean[x][y]+"("+loc+")");
  }
}

void stdDevAndUpdateLAB()
{
  //println("std dev (LAB)");
  float sumSL=0,sumSA=0,sumSB=0,sumTL=0,sumTA=0,sumTB=0;
  for (int y=0;y<tHei;y++)
  {
    for(int x=0;x<tWid;x++)
    {
       sumTL+=pow((tLL[x][y]-meanTL),2);
       sumTA+=pow((tAA[x][y]-meanTA),2);
       sumTB+=pow((tBB[x][y]-meanTB),2);
    }
  }
  for (int y=0;y<sHei;y++)
  {
    for(int x=0;x<sWid;x++)
    {
       sumSL+=pow((sLL[x][y]-meanSL),2);
       sumSA+=pow((sAA[x][y]-meanSA),2);
       sumSB+=pow((sBB[x][y]-meanSB),2);
    }
  }
  //println(sumSL+","+sumSA+","+sumSB+","+sumTL+","+sumTA+","+sumTB);
  for (int y=0;y<sHei;y++)
  {
    for(int x=0;x<sWid;x++)
    {
      loc = x + y*sWid;
      finalL[loc] = ((sqrt(sumTL/(tarLen-1))/sqrt(sumSL/(srcLen-1)))*sLMean[x][y])+meanTL;
      //println(loc+"sqrt("+sumTL+"/"+tarLen+"-1)/sqrt("+sumSL+"/"+srcLen+"-1)*"+sLMean[x][y]+"+"+meanTL+" = "+finalL[loc]);
      //print("sqrt(sumTL/(tarLen-1))/sqrt(sumSL/(srcLen-1))"+sqrt(sumTL/(tarLen-1))/sqrt(sumSL/(srcLen-1)));
      //print("sLMean[x][y]:"+sLMean[x][y]+"meanTL:"+meanTL);
      finalA[loc] = ((sqrt(sumTA/(tarLen-1))/sqrt(sumSA/(srcLen-1)))*sAMean[x][y])+meanTA;
      //println(loc+"sqrt("+sumTA+"/"+tarLen+"-1)/sqrt("+sumSA+"/"+srcLen+"-1)*"+sAMean[x][y]+"+"+meanTA+" = "+finalA[loc]);
      //print("sqrt(sumTA/(tarLen-1))/sqrt(sumSA/(srcLen-1))"+sqrt(sumTA/(tarLen-1))/sqrt(sumSA/(srcLen-1)));
      //print("sAMean[x][y]:"+sAMean[x][y]+"meanTA:"+meanTA);
      finalB[loc] = ((sqrt(sumTB/(tarLen-1))/sqrt(sumSB/(srcLen-1)))*sBMean[x][y])+meanTB;
      //println(loc+"sqrt("+sumTB+"/"+tarLen+"-1)/sqrt("+sumSB+"/"+srcLen+"-1)*"+sBMean[x][y]+"+"+meanTB+" = "+finalB[loc]);
      //println("sqrt(sumTB/(tarLen-1))/sqrt(sumSB/(srcLen-1))"+sqrt(sumTB/(tarLen-1))/sqrt(sumSB/(srcLen-1)));
      //println("sBMean[x][y]:"+sBMean[x][y]+"meanTB:"+meanTB+"("+loc+")");
      //println("L':"+finalL[loc]+",A':"+finalA[loc]+",B':"+finalB[loc]+"("+loc+")  ");
      LAB2logLMS(finalL[loc],finalA[loc],finalB[loc],x,y,1);
      //print(sLogL[x][y]+","+sLogM[x][y]+","+sLogS[x][y]+"("+loc+")  ");
      log2Linear(sLogL[x][y],sLogM[x][y],sLogS[x][y],x,y,1);
      //print(sL[x][y]+","+sM[x][y]+","+sS[x][y]+"("+loc+")  ");
      LMS2RGB(sL[x][y],sM[x][y],sS[x][y],x,y,1);
      //print(sR[x][y]+","+sG[x][y]+","+sB[x][y]+"("+loc+")  ");
      //print((sR[x][y]+sG[x][y]+sB[x][y])+"("+loc+")  ");
      resultImgLAB.pixels[loc]=color(sR[x][y],sG[x][y],sB[x][y]);
      //print(resultImg.pixels[loc]+"("+loc+") ");
    }
    println();
  }
  resultImgLAB.updatePixels();
  size(max(tWid,sWid)+max(tWid,sWid),max(tHei,sHei)+sHei);
  image(resultImgLAB,0,max(tHei,sHei));
}

void stdDevAndUpdateRGB()
{
  //println("std dev (RGB)");
  float sumSR=0,sumSG=0,sumSBB=0,sumTR=0,sumTG=0,sumTBB=0;
  for (int y=0;y<tHei;y++)
  {
    for(int x=0;x<tWid;x++)
    {
       sumTR+=pow((tR[x][y]-meanTR),2);
       sumTG+=pow((tG[x][y]-meanTG),2);
       sumTBB+=pow((tB[x][y]-meanTBB),2);
    }
  }
  for (int y=0;y<sHei;y++)
  {
    for(int x=0;x<sWid;x++)
    {
       sumSR+=pow((sR[x][y]-meanSR),2);
       sumSG+=pow((sG[x][y]-meanSG),2);
       sumSBB+=pow((sB[x][y]-meanSBB),2);
    }
  }
  //println(sumSR+","+sumSG+","+sumSBB+","+sumTR+","+sumTG+","+sumTBB);
  for (int y=0;y<sHei;y++)
  {
    for(int x=0;x<sWid;x++)
    {
      loc = x + y*sWid;
      sR[x][y] = ((sqrt(sumTR/(tarLen-1))/sqrt(sumSR/(srcLen-1)))*sRMean[x][y])+meanTR;
      //println(loc+"sqrt("+sumTL+"/"+tarLen+"-1)/sqrt("+sumSL+"/"+srcLen+"-1)*"+sLMean[x][y]+"+"+meanTL+" = "+sR[x][y]);
      //print("sqrt(sumTL/(tarLen-1))/sqrt(sumSL/(srcLen-1))"+sqrt(sumTL/(tarLen-1))/sqrt(sumSL/(srcLen-1)));
      //print("sLMean[x][y]:"+sLMean[x][y]+"meanTL:"+meanTL);
      sG[x][y] = ((sqrt(sumTG/(tarLen-1))/sqrt(sumSG/(srcLen-1)))*sGMean[x][y])+meanTG;
      //println(loc+"sqrt("+sumTA+"/"+tarLen+"-1)/sqrt("+sumSA+"/"+srcLen+"-1)*"+sAMean[x][y]+"+"+meanTA+" = "+sG[x][y]);
      //print("sqrt(sumTA/(tarLen-1))/sqrt(sumSA/(srcLen-1))"+sqrt(sumTA/(tarLen-1))/sqrt(sumSA/(srcLen-1)));
      //print("sAMean[x][y]:"+sAMean[x][y]+"meanTA:"+meanTA);
      sB[x][y] = ((sqrt(sumTBB/(tarLen-1))/sqrt(sumSBB/(srcLen-1)))*sBBMean[x][y])+meanTBB;
      //println(loc+"sqrt("+sumTBB+"/"+tarLen+"-1)/sqrt("+sumSBB+"/"+srcLen+"-1)*"+sBBMean[x][y]+"+"+meanTBB+" = "+sB[x][y]);
      //print(sR[x][y]+","+sG[x][y]+","+sB[x][y]+"("+loc+")  ");
      resultImgRGB.pixels[loc]=color(sR[x][y],sG[x][y],sB[x][y]);
      //print(resultImgRGB.pixels[loc]+"("+loc+") ");
    }
    //println();
  }
  resultImgRGB.updatePixels();
  size(max(tWid,sWid)+max(tWid,sWid),max(tHei,sHei)+sHei);
  image(resultImgRGB,sWid,max(tHei,sHei));
  //save("result.jpg");
}
