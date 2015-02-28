


// Class Object Delcarations
region1 r1 = new region1(); 
region2 r2 = new region2();
region3 r3 = new region3();
// *** *** *** *** *** ***

void setup()
{ 
  size(1000,500); // Must be divisable by 5
    background(0);
  centerGuideLines(127,255,0);
  r1.refresh();
  r2.initialize(); // Initializes Constant Values

}




void draw()
{

  
//Region 1 Examples
  r1.highAlert= 5.0;
  r1.lowAlert= 3.2;
  r1.graphSpeed=1;
float inpt = random(3.300,3.330); // Tester
  r1.input(inpt);
  
String formatted_Inpt = String.format("%.2f", inpt);
  r1.textContent(formatted_Inpt + " v");


// Region 2 Examples
  r2.lowAlert= 100;
  r2.highAlert = 500;
  r2.graphSpeed= 1.5;
  
float barInput =random(3, 3.25);
float barInput1 =random(4.9, 5);
  r2.createBar(0,barInput,5,2,0); 
    r2.createBar(1,barInput,5,2,0); 
      r2.createBar(3,barInput,5,2,0); 
        r2.createBar(5,barInput1,5,2,0); 
          r2.createBar(6,barInput1,5,2,0); 
  
  r2.headingText = "       TEST";
  
  barClick(r2.barClicked);// MUST be referenced in Draw
 

// Region 3 Examples
 r3.boolBrick(0, false,"test 123");
 r3.boolBrick(1, true,"test 123");
 r3.boolBrick(2, true,"TestSwitch");
 r3.boolBrick(5, true,"TestSwitch");
 r3.boolBrick(6, false,"TestSwitch");
 r3.boolBrick(9, true,"TestSwitch");



// *** Leave, MUST COME LAST IN LOOP *** *** *** *** *** ***
centerGuideLines(127,255,0); // RGB, 
}




void mouseClicked(){
  barClickedHandling(); // MUST by in mouseClicked for barClick Functionality 
}
  
  



 









// REGION Singular Functions

// Do NOT CHANGE, calculates if the mouse is on a Bar in Region 2
void barClickedHandling(){

  if (r2.Bar0_Bool = true && mouseX > r2.bar0_X &&  mouseX < (r2.bar0_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 0;
     barClick(BarNum);
      }
  
  if (r2.Bar1_Bool = true && mouseX > r2.bar1_X &&  mouseX < (r2.bar1_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)){
     int BarNum = 1;
     barClick(BarNum);
      }
  if (r2.Bar2_Bool = true && mouseX > r2.bar2_X &&  mouseX < (r2.bar2_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 2;
     barClick(BarNum);
      }
  if (r2.Bar3_Bool = true && mouseX > r2.bar3_X &&  mouseX < (r2.bar3_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 3;
     barClick(BarNum);
      }
  if (r2.Bar4_Bool = true && mouseX > r2.bar4_X &&  mouseX < (r2.bar4_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 4;
     barClick(BarNum);
      }
  if (r2.Bar5_Bool = true && mouseX > r2.bar5_X &&  mouseX < (r2.bar5_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 5;
     barClick(BarNum);
      }
  if (r2.Bar6_Bool = true && mouseX > r2.bar6_X &&  mouseX < (r2.bar6_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 6;
     barClick(BarNum);
      }
  if (r2.Bar7_Bool = true && mouseX > r2.bar7_X &&  mouseX < (r2.bar7_X + r2.rectWidth) && mouseY > r2.barY && mouseY < (r2.barY +r2.rectLength)) {
     int BarNum = 7;
     barClick(BarNum);
      }
}






void barClick(int barNum){
  boolean reset = false;
    if (r2.barClicked != barNum){
      r2.details_graphRefresh();
      reset = true;
        }
  
    r2.barClicked = barNum;
  float input= 0;
    if (barNum == 0){input = r2.bar0_input;}
    if (barNum == 1){input = r2.bar1_input;}
    if (barNum == 2){input = r2.bar2_input;}
    if (barNum == 3){input = r2.bar3_input;}
    if (barNum == 4){input = r2.bar4_input;}
    if (barNum == 5){input = r2.bar5_input;}
    if (barNum == 6){input = r2.bar6_input;}
    if (barNum == 7){input = r2.bar7_input;}
  
  r2.details_graphInput(input,barNum,reset);
}



String regionTextLengthCheck(String input)
{  
  String modString = input;
  float myRatio = (width/2)* .12;

  if (input.length() > myRatio )
  {    
  if (myRatio != 60) { println("Error: [Function regionTextLengthCheck] Adjust Region String Length Default for Width");}
  
 String [] returnArr = match(input,".{80}"); // function returns Array  
  return returnArr[0] + "...";
  }

  else { return input;}

}


void centerGuideLines(float red, float green, float blue){
    stroke(red,green,blue); //Green
    strokeWeight(2);
    line(width/2,0,width/2,height); //   Vertical 
     line(0,height/2,width/2,height/2); //  Horizontal
    //line(0,height/2,width,height/2); //  Horizontal
}




 String display_decPlace(float F, int dd){
   String modString = "";
    if (dd == 0){modString = String.format("%.0f", F);}
    if (dd == 1){modString = String.format("%.1f", F);}
    if (dd == 2){modString = String.format("%.2f", F);}
    if (dd == 3){modString = String.format("%.3f", F);}
    if (dd == 4){modString = String.format("%.4f", F);}
    if (dd == 5){modString = String.format("%.5f", F);}
   return modString;
  }
  
//END REGION  


// # REGION ****** ****** ****** REGION CLASSES ****** ****** ****** ******

public class region1 {
  float highAlert= 5.5;
  float lowAlert= 0;
  float graphSpeed= .25;
  float rXval_1;
  
  void input(float i){ //must be a value 0-5 for voltage
  // Reset if @ Right side
    if (rXval_1 == width/2 - (height/100)){
        rXval_1 = 0;
        refresh();
      }
      
      // "Fading Tail"
    fill(0,2); // Transparent Rectangle
    rect(0,0,width/2,height/2);
  
    drawGraphLines();
    stroke(255);
    
    // Color Changes for Alert Levels
    if (i <= lowAlert || i >= highAlert  ){
    stroke(255,0,0);
    }
    
    
    float interval= (height/2)/6; //   SAME as GuideLines algorithm :: Factor for converting Voltage on graph ( IE 4.5 to say 200 pixels for Y) )
    ellipse(rXval_1, (height/2) -(i*interval), 1,1);//height/100, height/100); // height/100 = 5 on Development size
    rXval_1 = rXval_1 + graphSpeed;//1;
    
  }
  
  
  void drawGraphLines(){ // SEPERATE so it can be called on in Input and Refresh
  
    float interval= (height/2)/6; //
    float i = height/2;
    int loopCnt = 0;
   strokeWeight(1);
    float baseLine = (height/2) -20;
    
        while (i > 0){
            stroke(100); //grey
           line(0,i,width/2,i);
           i = i -interval; }
  }  
     
 
  
   // WORKS!
  void refresh(){
  
    fill(0);
    rect(0,0,width/2,height/2);
    stroke(127,255,0); //Green
   
      //Sets guideline Bars Region 1
    drawGraphLines();
    }
  
  

  void textContent(String sInput){ 
    //BLACK BAR BEHIND TEXT
    noStroke();
    fill(0);
    rect(3,3,width/2,15);
    fill(255);
    sInput = regionTextLengthCheck(sInput); //Returns a modified string, trimmed to length
    text(sInput,5,13); 
    }
  
  
}





public class region2 {
   String InputString; // For Display
   String TotalString;
   // ******************* 
   
   int barClicked= 0;
    
   float rectInterval;
   float rectY_start;
   float rectLength;
   float rectWidth;  // +20 to account for width of rect
   float startingX;   
   
   // *** For selection and results in  Region 4
   boolean Bar0_Bool= false;
   boolean Bar1_Bool= false;
   boolean Bar2_Bool= false;
   boolean Bar3_Bool= false;
   boolean Bar4_Bool= false;
   boolean Bar5_Bool= false;
   boolean Bar6_Bool= false;
   boolean Bar7_Bool= false;
  
  
  // startingX  + (rectWidth * BarNumber) + (rectInterval * BarNumber), rectY_start,rectWidth,rectLength);
  
//****** BAR X,Ys for Clicking etc. region 4 access
   float bar0_X =  0.0;
   float bar1_X =  0.0;
   float bar2_X =  0.0;
   float bar3_X =  0.0;
   float bar4_X =  0.0;
   float bar5_X =  0.0;
   float bar6_X =  0.0;
   float bar7_X =  0.0;
   float barY = 0.0;
   
// ******
   
//****** BAR MaxVal ******
   float bar0MaxVal =  0.0;
   float bar1MaxVal =  0.0;
   float bar2MaxVal =  0.0;
   float bar3MaxVal =  0.0;
   float bar4MaxVal =  0.0;
   float bar5MaxVal =  0.0;
   float bar6MaxVal =  0.0;
   float bar7MaxVal =  0.0;
// ******   
   
   
 
//**input ** Need a variable that region 4 can reference
  float bar0_input=0.0;
  float bar1_input=0.0;
  float bar2_input=0.0;
  float bar3_input=0.0;
  float bar4_input=0.0;
  float bar5_input=0.0;
  float bar6_input=0.0;
  float bar7_input=0.0;
// **** **** ****   


void populateInputVals(float f, int barNum){
  
  if (barNum ==0){bar0_input=f;}
    if (barNum ==1){bar1_input=f;}
      if (barNum ==2){bar2_input=f;}
        if (barNum ==3){bar3_input=f;}
          if (barNum ==4){bar4_input=f;}
            if (barNum ==5){bar5_input=f;}
              if (barNum ==6){bar6_input=f;}
                if (barNum ==7){bar7_input=f;}
  }
   
    
    
void setMaxVal(int barNum, float max){

    if(barNum == 0){bar0MaxVal= max;}
      if(barNum == 1){bar1MaxVal= max;}
        if(barNum == 2){bar2MaxVal= max;}
          if(barNum == 3){bar3MaxVal= max;}
            if(barNum == 4){bar4MaxVal= max;}
              if(barNum == 5){bar5MaxVal= max;}
                if(barNum == 6){bar6MaxVal= max;}
                  if(barNum == 7){bar7MaxVal= max;}
  }
  
  
  
  
  
   //Alarm Values for Bars 
    float lowAlert = -1;
    float highAlert = -1;
    String headingText = "        SENSOR READINGS";
    
void createBar(int BarNumber, float i, float maxVal,int inputDecplace, int maxDecPlace){ 
  
   
   setBarBools(BarNumber);
   populateInputVals(i,BarNumber);
   setMaxVal(BarNumber,maxVal);
  
   // REFRESH BACKGROUND RECTANGLE
     fill(0);//255,0,0);
     noStroke();
     rect((startingX   + (rectWidth * BarNumber) + (rectInterval * BarNumber) ) -10 ,rectY_start -19,rectWidth *3,rectLength *1.20); //32
   // *** *** ***
    
   // WHITE Rectangle
     stroke(255);
     fill(255);
         // Sets Alarm Values if Not user Defined, or User Error ( -1)
         if (lowAlert == -1 || highAlert== -1){
             lowAlert = 0;
             highAlert = maxVal;
           }
     
         if ( i > highAlert || i < lowAlert){
               stroke(255,0,0);
               fill(255,0,0);
           }
     rect(startingX  + (rectWidth * BarNumber) + (rectInterval * BarNumber), rectY_start,rectWidth,rectLength);
   //*** *** ***
    
   //Reveal Rectangle
      float ratio = rectLength/maxVal;
      float inputPixel= i*ratio;
      stroke(0);
      fill(100);
      rect(startingX  + (rectWidth * BarNumber) + (rectInterval * BarNumber), rectY_start,rectWidth, rectLength-inputPixel);
   //*** *** ***
      
   // TEXT
     fill(255);
     InputString = display_decPlace(i,inputDecplace); 
     TotalString = display_decPlace(maxVal,maxDecPlace);
     
     textHeadingHandling(headingText);
     text(TotalString, startingX  + (rectWidth * BarNumber) + (rectInterval * BarNumber) - 5,rectY_start -8 ); // Max Value
     text(InputString, startingX  + (rectWidth * BarNumber) + (rectInterval * BarNumber) - 5,rectY_start + rectLength + 12); // input
   // *** *** ***
   
   } // #end CreateBar
  
  
 void setBarBools(int BarNum){
    
    if (BarNum == 0){Bar0_Bool= true;}
    if (BarNum == 1){Bar1_Bool= true;}
    if (BarNum == 2){Bar2_Bool= true;}
    if (BarNum == 3){Bar3_Bool= true;}
    if (BarNum == 4){Bar4_Bool= true;}
    if (BarNum == 5){Bar5_Bool= true;}
    if (BarNum == 6){Bar6_Bool= true;}
    if (BarNum == 7){Bar7_Bool= true;}
    }
  
  
  void initialize(){
    // # Constants
      rectInterval = 40;
      rectY_start =(height/2) *.15 ;
      rectLength = height *.35;
      rectWidth = 20;  // +20 to account for width of rect
      startingX = (width /2)+ rectInterval;   
      
      //fill(0);
      //noStroke();
      rect(width/2,0,width/2,height/2);
    // *** *** *** 
    
    
    //**** CLICKABLE BARS 
     bar0_X = startingX  ;
     bar1_X = startingX  + (rectWidth * 1) + (rectInterval * 1);
     bar2_X = startingX  + (rectWidth * 2) + (rectInterval * 2);
     bar3_X = startingX  + (rectWidth * 3) + (rectInterval * 3);
     bar4_X = startingX  + (rectWidth * 4) + (rectInterval * 4);
     bar5_X = startingX  + (rectWidth * 5) + (rectInterval * 5);
     bar6_X = startingX  + (rectWidth * 6) + (rectInterval * 6);
     bar7_X = startingX  + (rectWidth * 7) + (rectInterval * 7);
     barY = rectY_start;
    // *******
    }
  
 // works
  void textHeadingHandling(String sInput){ 
    //BLACK BAR BEHIND TEXT
      noStroke();
      fill(0);
    rect((width/2) -3,3,(width/2) -3,15);
      fill(255);
    sInput = regionTextLengthCheck(sInput); //Returns a modified string, trimmed to length
    text(sInput,(width/2) +5,13);
    }
    
    
    
   /// DETAILS AKA Region 4
  //****** ****** ******* *******
    
   float graphXval;
   float graphSpeed= .8;
 
   String text1="";
   String text2="";
   String text3="";
   String text4="";
   String text5="";
   String text6="";
   String text7="";
   String text8="";
   String text9="";
   String text10="";
  
  
  
 void details_txtField(){
 
   fill(0);//red
   rect(width/2,height *.75,width/2,height/4);
 
   float centerVert = width/2;
   float margin =centerVert *.04;
   float regionMidLine = height*.75;
 
 
   fill(255);
   text(text1, centerVert + margin,regionMidLine +margin);
 
   text(text2, centerVert + margin,regionMidLine +(margin*2) );
   text(text3, centerVert + margin,regionMidLine +(margin*3) );
   text(text4, centerVert + margin,regionMidLine +(margin*4) );
   text(text5, centerVert + margin,regionMidLine +(margin*5) );
  
   text(text6, centerVert + margin + ((width/2) *.5),regionMidLine +margin);
   text(text7, centerVert + margin + ((width/2) *.5),regionMidLine +(margin*2) );
   text(text8, centerVert + margin + ((width/2) *.5),regionMidLine +(margin*3) );
   text(text9, centerVert + margin + ((width/2) *.5),regionMidLine +(margin*4) );
   text(text10, centerVert + margin + ((width/2) *.5),regionMidLine +(margin*5) );
   
 }
 


float maxValueCalc(int barNum){
  if( barNum == 0) {  return  bar0MaxVal;  }
    if( barNum == 1) {  return  bar1MaxVal;  }
      if( barNum == 2) {  return  bar2MaxVal;  }
        if( barNum == 3) {  return  bar3MaxVal;  }
          if( barNum == 4) {  return  bar4MaxVal;  }
            if( barNum == 5) {  return  bar5MaxVal;  }
              if( barNum == 6) {  return  bar6MaxVal;  }
                if( barNum == 7) {  return  bar7MaxVal;  }
                
  return 0.0; // must return on all paths
  }


void details_graphInput(float input,int barNum, boolean reset){
    stroke(100);
    line(width/2,height/2,width/2,height/2);
    noStroke();
     
     //fill(105,153,249); // light blue
      fill(105);
    rect(width/2,(height/2) -20,width/2,15); 
      fill(255);
     
     String formatted_Inpt = String.format("%.2f", input);
     float maxVal= maxValueCalc(barNum);
     
     
     
     text("BAR " + barNum + "  INPUT: " + formatted_Inpt + "    MAX " +   maxVal ,(width/2) +5,(height/2) -8);
     //text("Bar " + barNum + "  Input: "+formatted_Inpt + "    Max " +   maxVal ,(width/2) +5,(height/2) +15);
     
     // text("",(width/2) + 100,(height/2) +15);
     

   if (graphXval < width/2 || reset == true){
       graphXval = width/2;
     }

   if (graphXval >= width){
        graphXval = width/2;
        details_graphRefresh();
     }
 
 

 
  float interval =(height/2) / maxVal;
  float midVertLine = width/2;
  float midHorizonline= height/2;
    stroke(255);
    strokeWeight(2);
    fill(150);
    
    stroke(0,255,0);// Fade
    line(graphXval, height - (interval *input), graphXval, height);
    
    //ellipse(graphXval, height - (interval *input), 2,2); // Adds Substance to Graph Line, for Smaller Line Uncomment Point Instead
   // point(graphXval, height - (interval *input));

  
 
  
  //details_gridLines();
    fill(0,0,0,2);// Fade
    noStroke();
    rect(width/2,height/2,width/2,height/2); // Refresh
  graphXval = graphXval + graphSpeed;
 }
  
  
  
 void details_graphRefresh(){
      fill(0,0,0);//black
     noStroke();
     rect(width/2,(height/2) -2,width/2,(height/2)+2);
      stroke(100);
     line(width/2,height/2,width/2,height/2);
    //details_gridLines();
   }
  
  
  
  void details_gridLines(){

    float midHorizonline= height/2;
    float interval= (height/2)/12;
    float yVal = midHorizonline + interval;
      stroke(255);
      strokeWeight(1);
  
    int ii = 1;
    while (ii < 6){
      yVal = (height *.75) - (interval*ii);
      line(width/2,yVal,width,yVal);
      ii = ii +1;
    }
  
  }
  
  

  void details_refreshTotal(){
    fill(0,0,0);
    rect(width/2,height/2,width/2,height/2);
  }
  
  /// *********
    
      
    
}











public class region3 {

 
void boolBrick(int brickNo, boolean condition, String textContent){
     stroke(255);
     strokeWeight(2);
     noFill();
   float xStart = .02 *width;
   float xWidth= .05 * width;
   float yLength = .05 *height;
   float backingRectY= .08 * height;
    
    if (brickNo < 5) {
      // -- Refresh
          float horizonLine = height/2;
           noStroke();
           fill(0);
         rect(0, horizonLine + xStart + ( (yLength *1.5) *brickNo) -5,width/4,  backingRectY);
         // -- ******
         
           fill(0);
           stroke(255);
         rect(xStart, horizonLine + xStart + ( (yLength *1.5) *brickNo), xWidth, yLength);
           fill(255);
         text(textContent, xStart + xWidth + 5, horizonLine + xStart + ( (yLength *1.5) *brickNo) + (.025 * height)); // (.025 * height) { offset }
         
            if (condition == true){
                  fill(255);
                  stroke(0);
                rect(xStart, horizonLine + xStart + ( (yLength *1.5) *brickNo), xWidth, yLength);
                } 
        }
    
    
      if (brickNo > 4) {
           brickNo = brickNo -5; // -- Deals multiplication issue
           
           // -- Refresh
             noStroke();
             fill(0);
           float horizonLine = height/2;
           rect(width/4, (horizonLine + xStart + ( (yLength *1.5) *brickNo)) -5, width/4, backingRectY);
           // -- ******
             fill(0);
             stroke(255);
           rect((width/4) +xStart, horizonLine + xStart + ( (yLength *1.5) *brickNo), xWidth, yLength);
           
              fill(255);
            text(textContent, (width/4) +xStart +xWidth +5, horizonLine + xStart + ( (yLength *1.5) *brickNo) + (.025 * height) );
          
               if (condition == true){
                fill(255);
                stroke(0);
                rect((width/4) +xStart, horizonLine + xStart + ( (yLength *1.5) *brickNo), xWidth, yLength);
                }
        }
  }
  
  
  void refresh(){
    fill(255,0,0);
    rect(0,height/2,width/2,height/2);
    }


}



// # END REGION


