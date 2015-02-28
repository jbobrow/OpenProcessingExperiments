

class CircleData
{
  color data1=color(0,100,255);
  color data2=color(255,0,100);
  //grahpic variables
  float[] dataArray1, dataArray2, dayArray;
  float maxData1,minData1,maxData2,minData2;
  float maxValue,minValue,aveValue,toleranceValue;
  float startRadius=50;
  float radiusChange=.25;
  float posx,posy,posx2,posy2;
  int centerX,centerY;
  float speed=0.1;
  float time=0;
  int lastIndex=-1;
  int mode=0;
  int totalMode=2;
  float offsetDegree;
  
  //text variables
  PFont font, dataFont;
  String title,dataName,dataName2;
  
  CircleData(float[] _dataArray1, float[] _dataArray2, float[] _dayArray)
  {
    toleranceValue=startRadius*0.8;
    dataArray1=_dataArray1;
    dataArray2=_dataArray2;
    dayArray=_dayArray;
    maxData1=FindArrayMaxAndMin(dataArray1,true);
    minData1=FindArrayMaxAndMin(dataArray1,false);
    maxData2=FindArrayMaxAndMin(dataArray2,true);
    minData2=FindArrayMaxAndMin(dataArray2,false);
    
    maxValue=FindMaxAndMin(maxData1,maxData2,true);
    minValue=FindMaxAndMin(minData1,minData2,false);
    aveValue=(maxValue+minValue)/2;
    
    offsetDegree=270-dayArray[0];
    
    //trace index1;
  }
  
  public void SetTitle(String _title)
  {
    font=createFont("Helvetica", 24, true); 
    title=_title;
    textFont(font);
    
  }
  
  public void setData(String _dataName,String _dataName2)
  {
    dataFont=createFont("Helvetica", 16, true);   
    dataName=_dataName;
    dataName2=_dataName2;
    textFont(font);
  }

  void Text()
  {
    textAlign(CENTER);
    fill(255);
    textSize(24);
    text(title,centerX,centerY-140);
    
    textSize(16);
    fill(data1);
    text(dataName,centerX-40,centerY-120);
    fill(data2);
    text(dataName2,centerX+40,centerY-120);
  }
  
  public void SetPosition(int x, int y)
  {
    float adjustRad,adjustRad2;
    adjustRad=AdjustValue(dataArray1[0])+startRadius;
    adjustRad2=AdjustValue(dataArray2[0])+startRadius;
    
    centerX=x;
    centerY=y;
    posx=centerX+adjustRad*cos(ConvertToRadian(dayArray[0]+offsetDegree));
    posy=centerY+adjustRad*sin(ConvertToRadian(dayArray[0]+offsetDegree));
    
    posx2=centerX+adjustRad2*cos(ConvertToRadian(dayArray[0]+offsetDegree));
    posy2=centerY+adjustRad2*sin(ConvertToRadian(dayArray[0]+offsetDegree));
    
    startRadius+=radiusChange;
  }
  
  public void DisplayData()
  {
    int index1,index2;
    float nextX,nextY;
    float interp;
    time+=speed;
    index1=(int)time;
    index2=index1+1;
    
    if(index2 < dayArray.length)
    {
      float adjustRad,adjustRad2;
      float degree;
      interp= time-(int)time;  
      
      
      degree=dayArray[index1]+interp*(dayArray[index2]-dayArray[index1]);
      adjustRad=startRadius+AdjustValue(dataArray1[index1]+interp*(dataArray1[index2]-dataArray1[index1])); //data1
      adjustRad2=startRadius+AdjustValue(dataArray2[index1]+interp*(dataArray2[index2]-dataArray2[index1])); //data2
      
      if(index1 != lastIndex)
      {
        lastIndex=index1;
        DrawLine();
        if(index1%10 ==0)
        {
          fill(250);
          textSize(9);
          text(int(dayArray[index1])+"day",centerX+(adjustRad+20)*cos(ConvertToRadian(degree+offsetDegree)),centerY+(adjustRad+20)*sin(ConvertToRadian(degree+offsetDegree)));
        }
      }
      
      
      strokeWeight(1);
      nextX=centerX+adjustRad*cos(ConvertToRadian(degree+offsetDegree));
      nextY=centerY+adjustRad*sin(ConvertToRadian(degree+offsetDegree));
      stroke(data1);
      line(posx,posy,nextX,nextY);
      posx=nextX;
      posy=nextY;
      
      
      nextX=centerX+adjustRad2*cos(ConvertToRadian(degree+offsetDegree));
      nextY=centerY+adjustRad2*sin(ConvertToRadian(degree+offsetDegree));
      stroke(data2);
      line(posx2,posy2,nextX,nextY);
      posx2=nextX;
      posy2=nextY;
      
      if(mode==1)
      {
        strokeWeight(3);
        stroke(0,100,255,70);
        line(centerX,centerY,posx,posy);
        stroke(255,0,100,70);
        line(centerX,centerY,posx2,posy2);
      }
      startRadius+=radiusChange;
    }
    else if(index2 == dayArray.length)
    {
      DrawLine();
      
      
      float adjustRad,adjustRad2;
      float degree;
      
      interp= time-(int)time;  
      degree=dayArray[index1-1]+interp*(dayArray[index2-1]-dayArray[index1-1]);
      adjustRad=startRadius+AdjustValue(dataArray1[index1-1]+interp*(dataArray1[index2-1]-dataArray1[index1-1])); //data1
      adjustRad2=startRadius+AdjustValue(dataArray2[index1-1]+interp*(dataArray2[index2-1]-dataArray2[index1-1])); //data2
      fill(255);
      textSize(12);
      text(int(dayArray[index2-1])+"day",centerX+(adjustRad+15)*cos(ConvertToRadian(degree+offsetDegree-3)),centerY+(adjustRad+15)*sin(ConvertToRadian(degree+offsetDegree-3)));
      
      time++;
    }
    
  }
  
  public void ChangeMode()
  {
    mode++;
    mode=mode%totalMode;
  }
  
  public void reset()
  {
    float adjustRad,adjustRad2;
    startRadius=50;
    radiusChange=.25;
    speed=0.1;
    time=0;
    lastIndex=-1;    
    
    adjustRad=AdjustValue(dataArray1[0])+startRadius;
    adjustRad2=AdjustValue(dataArray2[0])+startRadius;
    
    posx=centerX+adjustRad*cos(ConvertToRadian(dayArray[0]+offsetDegree));
    posy=centerY+adjustRad*sin(ConvertToRadian(dayArray[0]+offsetDegree));
    
    posx2=centerX+adjustRad2*cos(ConvertToRadian(dayArray[0]+offsetDegree));
    posy2=centerY+adjustRad2*sin(ConvertToRadian(dayArray[0]+offsetDegree));
    
    Text();
  }
  
  float AdjustValue(float val)
  {
    float temp;
    temp=toleranceValue*(val-minValue)/(maxValue-minValue);
    temp=temp-toleranceValue/2;
    return temp;
  }
  
  //find the max and min value in this array.
  float FindArrayMaxAndMin(float[] data, boolean maximun)
  {
    float maxData,minData;
    maxData=data[0];
    minData=data[0];
    for(int i=0; i<data.length;i++)
    {
      float value=data[i];
      if(value>=maxData && maximun) maxData=value;
      if(value<=minData && !maximun) minData=value;
    }
    
    if(maximun) return maxData;
    else return minData;
  }
  
  float FindMaxAndMin(float a, float b, boolean maximun)
  {
    if(a>=b) 
    {
      if(maximun) return a;
      else return b;
    }
    else //a<b
    {
      if(maximun) return b;
      else return a;
    }
  }
  
  float ConvertToRadian(float degree)
  {
    float radian;
    radian=degree*PI/180;
    return radian;
  }
  
  void DrawLine()
  {
   // println(mode);
    switch(mode)
    {
      case 0:
        strokeWeight(1);
        stroke(255,255,255,50);
        if(dist(centerX,centerY,posx,posy)>dist(centerX,centerY,posx2,posy2)) line(centerX,centerY,posx,posy);
        else line(centerX,centerY,posx2,posy2);
        break;
        
      case 1:
        break;
    }
    
    
  }
}


