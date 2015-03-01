
String[] options = {"Cry","Eat my feelings","Sleeps not that important", "Cry more", "Try to make check list", "....again"}; 
boolean[] results;
ADCheck radioButton;
int radio;


PFont output; 

void setup()
{
  size(500,400);
  smooth();
  output = createFont("Arial",24,true);  

  radioButton = new ADCheck(111, 67, options, "radioButton"); 
  radioButton.setDebugOn();
  radioButton.setBoxFillColor(#F7ECD4);  

  results = new boolean[radioButton.length()];

}

void draw()
{
 background(#FFFFFF);

  radioButton.update();
  results=radioButton.getValues();
  
  textFont(output,24);   
  text(options[radioButton.getLastPicked()], (width-textWidth(options[radioButton.getLastPicked()]))/2, height-20);


}



class ADCheck
{
  
  color externalBoxColor=#000000;
  color externalFillBoxColor=#FFFFFF;
  color internalBoxColor=#000000;
  color internalFillBoxColor=#000000;
  
  boolean fillExternalBox=false;
  
  PFont rText;
  color textColor=#000000;
  color textShadowColor=#7E7E7E;
  boolean textShadow=false;
  int textPoints=14;
  
  int xTextOffset=10;
  int yTextSpacing=14;
  
  int boxSide=14;
  float borderLineWidth=0.5;
 
  float boxLineWidth=0.2;
  boolean boxFilled=false;
  color boxLineColor=#000000;
  color boxFillColor=#F4F5D7;
  boolean boxVisible=true;
  
  int boxXMargin=5;
  int boxYMargin=5;
    
  
  String[] radioText;
  boolean[] radioChoose; 
  
  int over=0;
  int nC;
  
  int rX, rY;
  
  float maxTextWidth=0;
  
  String radioLabel;
  
  boolean debug=false;
  
  boolean pressOnlyOnce=true;
  int deb=0;

  int bX, bY, bW, bH;

  
  
  ADCheck(int x, int y, String[] op, String id)
  {
    rX=x;
    rY=y;
    radioText=op;
    
    nC=op.length;
    radioChoose = new boolean[nC];
        
    rText = createFont("Arial",16,true);      
    textFont(rText,textPoints);   
    textAlign(LEFT);
    
    for (int i=0; i<nC; i++) 
    {
      if (textWidth(radioText[i]) > maxTextWidth) maxTextWidth=textWidth(radioText[i]);
      radioChoose[i]=false;
    }
    
    radioChoose[over]=true;
    
    radioLabel=id;
    calculateBox();
    
  }
  
  void calculateBox()
  {
 
    bX=rX-boxXMargin;
    bY=rY-boxYMargin;
    bW=boxSide*2+xTextOffset+(int )maxTextWidth;
    bH=radioText.length*boxSide + (radioText.length-1)*yTextSpacing + boxYMargin*2;
  }  
  
  
  void setValue(int n)
  {
    if (n<0) n=0;
    if (n>nC) n=nC;
    
   radioChoose[n]=!radioChoose[n];  
   over=n; 
  }
  
  void deBounce(int n)
  {
    if (pressOnlyOnce) 
      return;
    else
      
    if (deb++ > n) 
    {
      deb=0;
      pressOnlyOnce=true;
    }
    
  }  
  
  
  boolean mouseOver()
  {
    boolean result=false; 
    
    if (debug)
      if ((mouseX>=bX) && (mouseX<=bX+bW) && (mouseY>=bY) && (mouseY<=bY+bH))
      {
        if (mousePressed && mouseButton==LEFT && keyPressed)
        {
          if (keyCode==CONTROL)
          {
            rX=rX+(int )((float )(mouseX-pmouseX)*1);
            rY=rY+(int )((float )(mouseY-pmouseY)*1);
            calculateBox();
          }
          if (keyCode==SHIFT && pressOnlyOnce) 
          {
            printGeometry();
            pressOnlyOnce=false;
          }
          deBounce(5);
          
        }
      }
      
    for (int i=0; i<nC; i++)
    {
      if ((mouseX>=(rX)) && (mouseX<=(rX+boxSide)) && (mouseY>=(rY+i*(yTextSpacing+boxSide))) && (mouseY<=(rY+i*(yTextSpacing+boxSide)+boxSide)))
      {
        result=true;
        
        if (mousePressed && mouseButton==LEFT && pressOnlyOnce)
        {
          over=i;
          setValue(over);
          pressOnlyOnce=false;
        }
        deBounce(5);
        i=nC;
      }
      else
      {
        result=false;
      }
    } 
    return result;
  }
  
  void drawExternalBox()
  {
    if (!boxVisible) return;
    if (boxFilled)
      fill(boxFillColor);
    else
      noFill();
    strokeWeight(boxLineWidth);
    stroke(boxLineColor);
    
    rect(bX, bY, bW, bH);

  }  
  
  void drawBoxes()
  {
    strokeWeight(borderLineWidth);
    for (int i=0; i<nC; i++)
    {
      if (!fillExternalBox) 
        noFill();
      else
        fill(externalFillBoxColor);  
      stroke(externalBoxColor);  
      rect(rX, rY+(i*(yTextSpacing+boxSide)), boxSide, boxSide);

      //if (i==4) println((i*yTextSpacing));

      fill(internalFillBoxColor);
      stroke(internalBoxColor);  

      if (radioChoose[i])
      {
        line(rX+boxSide,rY+i*(yTextSpacing+boxSide),rX,rY+i*(yTextSpacing+boxSide)+boxSide);
        line(rX,rY+i*(yTextSpacing+boxSide),rX+boxSide,rY+i*(yTextSpacing+boxSide)+boxSide);
      }
    }
    mouseOver();
   
  }
  
  void drawText()
  {
    float yOffset=rY+(boxSide+textPoints)/2;
    float xOffset=rX+boxSide+xTextOffset;
    stroke(textColor);
    textFont(rText,textPoints);   
    textAlign(LEFT);

    for (int i=0; i<nC; i++)
    {
      if (textShadow)
      {
        stroke(textShadowColor);
        text(radioText[i], xOffset+1, yOffset+(i*(yTextSpacing+boxSide)+1));
        stroke(textColor);
      }
      text(radioText[i], xOffset, yOffset+(i*(yTextSpacing+boxSide)));
    }
    
  }  
  
  
  int update()
  {
    drawExternalBox();
    drawBoxes();
    drawText();
    
    return over;
  }

  
  int getLastPicked()
  {
    return over;
  }
  
  boolean getValue(int n)
  {
    if (n<0) n=0;
    if (n>nC) n=nC;

    return radioChoose[n];  
  }
  
  int length()
  {
    return radioChoose.length;  
  } 
  
  boolean[] getValues()
  {
    return radioChoose;  
  } 
  void setDebugOn()
  {
    debug=true;
  }
  
  void setDebugOff()
  {
    debug=false;
  }
  void printGeometry()
  {
    println("radio = new ADradio("+rX+", "+rY+", arrayOfOptions"+", \""+radioLabel+"\");");

  }

  void setexternalBoxColor(color c)
  {
    externalBoxColor=c;
  }

  void setexternalFillBoxColor(color c)
  {
    externalFillBoxColor=c;
  }

  void setinternalBoxColorr(color c)
  {
    externalFillBoxColor=c;
  }
 
  void setinternalFillBoxColor(color c)
  {
    externalFillBoxColor=c;
  }

  void setTextColor(color c)
  {
    textColor=c;
  }
  
  void setTextShadowColor(color c)
  {
    textShadowColor=c;
  }
 
  void setShadowOn()
  {
    textShadow=true;
  }
  
  void setShadowOff()
  {
    textShadow=false;
  }

  void setTextSize(int s)
  {
    textPoints=s;
  }

  void setXTextOffset(int s)
  {
    xTextOffset=s;
  }
 
  void setYTexSpacing(int s)
  {
    yTextSpacing=s;
  }
 
  void setboxSide(int s)
  {
    boxSide=s;
  }

  void setBoxLineWidth(int s)
  {
    boxLineWidth=s;
  }
 
  void setBoxLineColor(color c)
  {
    boxLineColor=c;
  }
  
  void setBoxFillColor(color c)
  {
    boxFillColor=c;
    setBoxFilledOn();
  }
 
  void setBoxFilledOn()
  {
    boxFilled=true;
  }
 
  void setBoxFilledOff()
  {
    boxFilled=false;
  }
 
  void setBoxVisibleOn()
  {
    boxVisible=true;
  }

  void setBoxVisibleOff()
  {
    boxVisible=false;
  }
 
  void setLabel(String l)
  {
    radioLabel=l;
  }

}





