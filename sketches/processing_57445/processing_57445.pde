
/*
 * ----------------------------------
 *  Button Class for Processing 2.0
 * ----------------------------------
 *
 * this is a simple button class. The following shows 
 * you how to use it in a minimalistic way.
 *
 * DEPENDENCIES:
 *   N/A
 *
 * Created:  March, 16 2012
 * Author:   Alejandro Dirgan
 * Version:  1.2
 *
 * License:  GPLv3
 *   (http://www.fsf.org/licensing/)
 *
 * Follow Us
 *    adirgan.blogspot.com
 *    twitter: @ydirgan
 *    https://www.facebook.com/groups/mmiiccrrooss/
 *    https://plus.google.com/b/111940495387297822358/
 *
 * DISCLAIMER **
 * THIS SOFTWARE IS PROVIDED TO YOU "AS IS," AND WE MAKE NO EXPRESS OR IMPLIED WARRANTIES WHATSOEVER 
 * WITH RESPECT TO ITS FUNCTIONALITY, OPERABILITY, OR USE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED 
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR INFRINGEMENT. WE EXPRESSLY 
 * DISCLAIM ANY LIABILITY WHATSOEVER FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR SPECIAL 
 * DAMAGES, INCLUDING, WITHOUT LIMITATION, LOST REVENUES, LOST PROFITS, LOSSES RESULTING FROM BUSINESS 
 * INTERRUPTION OR LOSS OF DATA, REGARDLESS OF THE FORM OF ACTION OR LEGAL THEORY UNDER WHICH THE LIABILITY 
 * MAY BE ASSERTED, EVEN IF ADVISED OF THE POSSIBILITY OR LIKELIHOOD OF SUCH DAMAGES.
*/


/*
 this is a simple button class. The following shows you how to use it in a minimalistic way.
 
 ADbutton button1;
 boolean pressed=false;
 
 void setup()
 {
  size(290,120);
  smooth();
  
  button1 = new ADbutton(80, 40, 150, 30, 7, "Press Me");

 }
 void buttonRun()
 {
   if (pressed)
     button1.setLabel("Press Me");
   else
     button1.setLabel("unPress Me");
     
   pressed=!pressed;  
   
 }
 void draw()
 {
  background(#04583F);
  if (button1.update())
     buttonRun();
 }
*/
 


class ADbutton
{
  int lightColorButton = #F2F2F2;
  int darkColorButton = #505050;
  int innerRectButton = #B7B7B7;
  int innerRectButtonLight = #C6C6C6;
  
  int fontColorEnabled=255;
  int fontColorDisabled=#969696;
  
  
  int fontSize = 18;

  boolean visible=true;
  boolean enabled=true;
   
  //actions
  final int mouseNotOver=0;
  final int mouseOver=1;
  final int mouseClick=2;

  boolean mouseButtonPressed=false;
  
  String buttonLabel;
  int buttonX,buttonY,buttonW,buttonH,buttonR,buttonAx,buttonAy,buttonHr;
  
  float startTime;
  boolean didEnter;
  boolean firstTime=true;
  int buttonHelpTime=1500;
  
  int buttonHelpSize=12;
  color buttonHelpColor=0;
  String buttonHelpText="";
  boolean buttonHelp=false;
  
  boolean debug=false;
  
  // contructor (x,y) (width,Height), radius, label
  ADbutton(int x, int y, int w, int h, int r, String label) 
  {
    buttonX=x;
    buttonY=y;
    buttonW=w;
    buttonH=h;
    buttonR=r;
    buttonAx=buttonX+buttonW-1;
    buttonAy=buttonY+buttonH-1;
    buttonHr=buttonR/2;
    buttonLabel=label;

  }
  
  //internal method
  void display(int action) {

   if (visible) {
    noStroke();
    rectMode(CORNER);

    //Inner rectangle
    switch(action) {
      case mouseNotOver: 
        fill(innerRectButton);
         break;
      case mouseOver: 
        if (enabled)
          fill(innerRectButtonLight);
         else   
           fill(innerRectButton);
        break;
      case mouseClick: 
        fill(innerRectButtonLight);
        break;

    }

    pushMatrix();
    translate(0,0);

    rect(buttonX, buttonY, buttonW, buttonH);

    textAlign(CENTER);
    textSize(fontSize);

    switch(action) {
      case mouseNotOver: 

        fill(#939393);
        text(buttonLabel,buttonX+buttonW/2+1,buttonY+buttonH/2+11-5+1);    
        
        if (enabled)
           fill(fontColorEnabled);
        else
           fill(fontColorDisabled);   
        text(buttonLabel,buttonX+buttonW/2,buttonY+buttonH/2+11-5);    
        fill(lightColorButton);
        break;
        
      case mouseOver: 
      
        fill(#939393);
        text(buttonLabel,buttonX+buttonW/2+1,buttonY+buttonH/2+11-5+1);    

        if (enabled)
          fill(fontColorEnabled);
        else
          fill(fontColorDisabled);
        text(buttonLabel,buttonX+buttonW/2,buttonY+buttonH/2+11-5);
        fill(lightColorButton);
        break;
        
      case mouseClick: 
      
        fill(#939393);
        text(buttonLabel,buttonX+buttonW/2+3+1,buttonY+buttonH/2+11-2+1);    
      
        if (enabled)
          fill(fontColorEnabled);
        else
          fill(fontColorDisabled);
        text(buttonLabel,buttonX+buttonW/2+3,buttonY+buttonH/2+11-2);  
        fill(darkColorButton);
        break;  
     }

     //corner up-left
    arc(buttonX, buttonY, buttonR, buttonR, radians(180.0), radians(270.0));
    arc(buttonAx, buttonY, buttonR, buttonR, radians(270.0), radians(315.0));
    arc(buttonX, buttonAy, buttonR,buttonR, radians(135.0), radians(180.0));
 
    rect(buttonX, buttonY-buttonHr, buttonW, buttonHr);
    rect(buttonX-buttonHr, buttonY, buttonHr, buttonH);

    switch(action) {
      case mouseNotOver: 
        fill(darkColorButton);
        break;
      case mouseOver: 
        fill(darkColorButton);
        break;
      case mouseClick: 
        fill(lightColorButton);
        break;
    }
 
    //corner down-right
    arc(buttonAx, buttonAy, buttonR,buttonR, radians(0.0), radians(90.0));
    arc(buttonAx, buttonY, buttonR,buttonR, radians(315.0), radians(360.0));
    arc(buttonX, buttonAy, buttonR,buttonR, radians(90.0), radians(135.0));
 
    rect(buttonX, buttonY+buttonH, buttonW, buttonHr);
    rect(buttonX+buttonW,buttonY,buttonHr, buttonH);

    popMatrix();
    
    }
   }  
///////////////////////////////////////////////////////  
   void setHelpOn(String helpText)
   {
     buttonHelp=true;
     buttonHelpText=helpText;
   }
///////////////////////////////////////////////////////  
   void setHelpTextOff()
   {
     buttonHelp=false;
   }
///////////////////////////////////////////////////////  
   void showHelp()
   {
     textSize(buttonHelpSize);
     textAlign(LEFT);

//buttonHelpRectangle

     if (mouseY<(buttonY+(buttonH/2)))
     {
       fill(#FFFFA7);     
       strokeWeight(1);  
       stroke(0);
       if (mouseX>(buttonX+(buttonW/2)))
       {
         rect(mouseX-5,mouseY-buttonH/2-25,textWidth(buttonHelpText)+8,20);
         fill(buttonHelpColor);
         text(buttonHelpText, mouseX, mouseY-buttonH/2-10);
       }
       else
       {
         rect(mouseX-textWidth(buttonHelpText)-5,mouseY-buttonH/2-25,textWidth(buttonHelpText)+8,20);
         fill(buttonHelpColor);
         text(buttonHelpText, mouseX-textWidth(buttonHelpText), mouseY-buttonH/2-10);

       }
     }
     else  
     {
       fill(#FFFFA7);   
       strokeWeight(1);  
       stroke(0);
       if (mouseX<(buttonX+(buttonW/2)))
       {
         rect(mouseX-textWidth(buttonHelpText)-5,mouseY+buttonH/2,textWidth(buttonHelpText)+8,20);
         fill(buttonHelpColor);
         text(buttonHelpText, mouseX-textWidth(buttonHelpText), mouseY+buttonH/2+15);       }
       else
       {
         rect(mouseX-5,mouseY+buttonH/2,textWidth(buttonHelpText)+8,20);
         fill(buttonHelpColor);
         text(buttonHelpText, mouseX, mouseY+buttonH/2+15);
       }
     }
   }
///////////////////////////////////////////////////////  
   void updatePosition()
   {
     
     buttonX=buttonX+mouseX-pmouseX;
     buttonY=buttonY+mouseY-pmouseY;
     buttonAx=buttonX+buttonW-1;
     buttonAy=buttonY+buttonH-1;
    

   }
///////////////////////////////////////////////////////  
   void updatePosition(int deltaX, int deltaY)
   {
     
     buttonX=(buttonX+deltaX);
     buttonY=(buttonY+deltaY);
     buttonAx=buttonX+buttonW-1;
     buttonAy=buttonY+buttonH-1;     
     
   }
///////////////////////////////////////////////////////  
  
   // this function is used to display de button and check if it was pressed. 
   // Returns a boolean (true|false)
   // This function has to be executed in the draw() function to evaluate
   // wether the button has been pressed and for graphical refressing purposes
   
   // If debug=true we can move the button using CTRL+LEFT mouse button. The
   // configuration information will me printed at the output window
   boolean update()
   {
     
     if (!visible)
        return false;
             
     if ((mouseX > buttonX-buttonR/2 && mouseX < buttonX+buttonW+buttonR/2) && (mouseY > buttonY-buttonR/2 && mouseY < buttonY+buttonH+buttonR/2))
     {
       didEnter=true;
       if ((mousePressed && mouseButton==LEFT))
       {
         
         if (keyPressed && debug==true)
         {
          if (keyCode==CONTROL)
          { 
            updatePosition();
            display(mouseOver);
          }
          if (keyCode==SHIFT)
          { 
            printGeometry();
            display(mouseOver);
          }
         }   
         else   
         {
           if (enabled)
             display(mouseClick);
           else
             display(mouseNotOver);
           
           if (mouseButtonPressed==false)
           {
              if (enabled)
              {
                 mouseButtonPressed=true;
                 return true;
              }
              else
                 return false;
           }
         }
       }
       else 
       { 
         display(mouseOver);
         mouseButtonPressed=false;
       }
     }
     else
     {
        didEnter=false;
        firstTime=true;
        display(mouseNotOver);
     }

     if (didEnter)
     {
       if (firstTime) 
       { 
         startTime=millis();
       }
       firstTime=false;
       
       if ((millis()-startTime)>buttonHelpTime && buttonHelp)
       {
         showHelp();
       }
     }

     return false; 
   }  

   
   
///////////////////////////////////////////////////////  
   // Allows to hide the button
   void hide()
   {
     visible=false;
   }  
///////////////////////////////////////////////////////  
   // Allows to unhide the button
   void unhide()
   {
     visible=true;
   }
///////////////////////////////////////////////////////  
   // Allows to change the label of the button
   void setLabel(String label)
   {
     buttonLabel=label;
   }
///////////////////////////////////////////////////////  
   // Allows to obtain the current label of the button
   String getLabel()
   {
     return buttonLabel;
   }
///////////////////////////////////////////////////////  
   // Allows to change the font size (in points)
   void setFontSize(int fs)
   {
     fontSize=fs;
   }
///////////////////////////////////////////////////////  
   // Allows to get the font size (in points)
   int getFontSize(int fs)
   {
     return fontSize;
   }
///////////////////////////////////////////////////////  
   // Allows to enable the button
   void enable()
   {
     enabled=true;
   }
///////////////////////////////////////////////////////  
   // Allows to disable the button. When a button is disabled it is visible but it can't be pressed
   void disable()
   {
     enabled=false;
   }
///////////////////////////////////////////////////////  
   // returns if the button is enabled or disabled
   boolean status()
   {
     return enabled;
   }
///////////////////////////////////////////////////////  
   //Allows to change the color of the button in rgb format (use #hexadecimal)
   void setColor(int rgbHexColor)
   {
     innerRectButton=rgbHexColor;
     innerRectButtonLight=rgbHexColor+#0F0F0F;
   }
///////////////////////////////////////////////////////  
   void setDefaultColor()
   {
     innerRectButton=#B7B7B7;
     innerRectButtonLight=innerRectButton+#0F0F0F;
   }
///////////////////////////////////////////////////////  
  void setDebugOn()
  {
    debug=true;
  }
///////////////////////////////////////////////////////  
  void setDebugOff()
  {
    debug=false;
  }
///////////////////////////////////////////////////////  
  void printGeometry()
  {
    println("button = new ADbutton("+buttonX+", "+buttonY+", "+buttonW+", "+buttonH+", "+buttonR+", \""+buttonLabel+"\");");

  }
  

   
}



