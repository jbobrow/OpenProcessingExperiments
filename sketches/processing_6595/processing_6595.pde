
class DimAxis{
  String[] labels;
  PFont font;
  int nbValues;
  AxisStyle style;
  
  DimAxis(String[] myLabels) {
    labels = myLabels;
    nbValues = labels.length;
    font = createFont("Frutiger",10,true);
    style= new AxisStyle();
  }


  DimAxis(String[] myLabels, String fontName, float fontSize) {
    labels = myLabels;
    nbValues = labels.length;
    font = createFont(fontName,fontSize,true);
    style= new AxisStyle();
  }
}

class ValAxis{
  float minVal, maxVal, step;
  boolean hasTitle = false;
  String title;
  PFont font;
  AxisStyle style;
  
  ValAxis(float myMax, float myStep) {
    minVal = 0;
    maxVal = myMax;
    step = myStep;
    font = createFont("Verdana",9,true);
    style= new AxisStyle(false);
  }

  ValAxis(float myMax, float myStep, String fontName, float fontSize) {
    minVal = 0;
    maxVal = myMax;
    step = myStep;
    font = createFont(fontName,fontSize,true);
    style= new AxisStyle(false);
  }

  ValAxis(float myMin, float myMax, float myStep) {
    minVal = myMin;
    maxVal = myMax;
    step = myStep;
    font = createFont("verdana",9,true);
    style= new AxisStyle(false);
  }

  ValAxis(float myMin, float myMax, float myStep, String fontName, float fontSize) {
    minVal = myMin;
    maxVal = myMax;
    step = myStep;
    font = createFont(fontName,fontSize,true);
    style= new AxisStyle(false);
  }

  ValAxis(float[][] myValues) {
    float seriesMin, seriesMax, absMax;
    seriesMin=myValues[0][0];
    seriesMax=myValues[0][0];
    for(int i=0;i<myValues.length;i++){
      seriesMin=min(seriesMin, min(myValues[i]));
      seriesMax=max(seriesMax, max(myValues[i]));
    }
    
    absMax = max(abs(seriesMin), abs(seriesMax));

    if(seriesMin>=0) {
      minVal=0;
      maxVal=pow(10,ceil(log(seriesMax)/log(10)));
      if (seriesMax<.5*maxVal) {
        maxVal=.5*maxVal;
      }
      if (seriesMax<.4*maxVal) {
        maxVal=.4*maxVal;
      }
    } 
    else {
      maxVal=pow(10,ceil(log(absMax)/log(10)));
      if (absMax<.5*maxVal) {
        maxVal=.5*maxVal;
      }
      if (absMax<.4*maxVal) {
        maxVal=.4*maxVal;
      }
      minVal = -maxVal;
    }
    step = maxVal/4;
    font = createFont("Verdana",9,true);
    style= new AxisStyle(false);
  }
  ValAxis(float[][] myValues, String fontName, float fontSize) {
       float seriesMin, seriesMax, absMax;
    seriesMin=myValues[0][0];
    seriesMax=myValues[0][0];
    for(int i=0;i<myValues.length;i++){
      seriesMin=min(seriesMin, min(myValues[i]));
      seriesMax=max(seriesMax, max(myValues[i]));
    }
    
    absMax = max(abs(seriesMin), abs(seriesMax));

    if(seriesMin>=0) {
      minVal=0;
      maxVal=pow(10,ceil(log(seriesMax)/log(10)));
      if (seriesMax<.5*maxVal) {
        maxVal=.5*maxVal;
      }
      if (seriesMax<.4*maxVal) {
        maxVal=.4*maxVal;
      }
    } 
    else {
      maxVal=pow(10,ceil(log(absMax)/log(10)));
      if (absMax<.5*maxVal) {
        maxVal=.5*maxVal;
      }
      if (absMax<.4*maxVal) {
        maxVal=.4*maxVal;
      }
      minVal = -maxVal;
    }
    step = maxVal/4;
    font = createFont(fontName,fontSize,true);
    style= new AxisStyle(false);
  }
  int rounding(){
    if (int(step)==step) {
      return 0;
    }
    else if (int(10*step)==10*step) {
      return 1;
    }
    else {
      return 2;
    }
  }
}



