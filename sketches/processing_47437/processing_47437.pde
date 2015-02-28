
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//---------------------------GLOBAL CONSTANTS-------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//

String S_X_edit = "[0],0,1,2,3,4";
String S_H_edit = "1,[1],1,1,1,-1,-1,0";

color ColorX = color(0x236590, 120);
color ColorH = color(0x23905A, 120);

//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//---------------------------GLOBAL VARIABLES-------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//

color ColorY;
String S_X_save = S_X_edit;
String S_H_save = S_H_edit;

float AllottedSigH;
float AllottedSigW;

float[] X_data;
float[] H_data;
float XH_top;
float XH_bottom;
int ZeroIndex;
int numRects;

Signal Xsig;
Signal Hsig;
Signal X2sig;
Signal H_sig;
Signal Ysig;

PFont F;
PFont Fs;
PFont f0;
PFont f1;
PFont f2;
PFont f3;
char SignalID;


//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------SETUP-------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
void setup() {
  
  background(255);
  smooth();
  size(450, 700);
  
  F = createFont("Dialog",24,true);
  Fs = createFont("Dialog",12,true);
  f0 = createFont("Arial", 8, true);
  f1 = createFont("Arial", 12, true);
  f2 = createFont("Arial", 18, true);
  f3 = createFont("Courier", 10, true);
  
  
  
  AllottedSigH = (height-160)/5.9;
  
  XH_Boot();
}


//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//---------------------------DRAW (iterate)---------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
void draw() {
  

  background(255);
  fill(100);
  stroke(0);
  rect(5,45,width-10,110);
  fill(ColorX);
  rect(10,70,(width/2)-20,80);
  fill(ColorY);
  rect((width/2)+10,70,(width/2)-20,80);
  
  if (SignalID == 'x'){
   fill(ColorX);
   rect(18,110,(width/2) - 50,18);
   fill(0);
   textFont(f0);
   textAlign(LEFT);
   text("Press 'enter' for new signal to take effect",18,104);
  }
  if (SignalID == 'h'){
   fill(ColorH);
   rect((width/2)+18,110,(width/2) - 50,18);
   fill(0);
   textFont(f0);
   textAlign(LEFT);
   text("Press 'enter' for new signal to take effect",(width/2) + 18,104);
  }
  
  
  
  
  fill(0);
  stroke(0);
  textAlign(CENTER);
  textFont(F);
  text("Convolution",width/2,26);
  textFont(Fs);
  text("by: Matt Dzugan",width/2,43);  
  textFont(f1);
  text("Enter x[n]: separated by commas.  Enclose value for x[n=0] in [brackets]",width/2,60);
  textAlign(RIGHT);
  fill(160);
  if(min(Ysig.show)==1) fill(60);
  text("x[n]",width-20,20+180);
  text("h[n]",width-20,20+180+(1.3*AllottedSigH));
  text("x[k] & h[n-k]",width-20,20+180+(2.6*AllottedSigH));
  fill(200);
  if(min(Ysig.show)==1) fill(60);
  text("y[n]",width-20,20+180+(3.9*AllottedSigH));
  textFont(f2);
  textAlign(CENTER);
  fill(0);
  text("Click here to edit x[n]",(width/4),90);
  text("Click here to edit h[n]",(3*width/4),90);
  textAlign(LEFT);
  textFont(f3);
  text(S_X_edit, 25, 120);
  text("x[n]= " + S_X_save, 25, 140);
  text(S_H_edit, (width/2)+25, 120);
  text("h[n]= " + S_H_save, (width/2)+25, 140);
  
  
  float AdjustedMouseX;
  float shiftAmount;
  shiftAmount = round((mouseX - width/2) / (Xsig.SignalWidth/numRects));
  AdjustedMouseX = (width/2) + (shiftAmount) * (Xsig.SignalWidth/numRects);


  Xsig.updateRectangles();
  Xsig.display();

  Hsig.updateRectangles();
  Hsig.display();

  X2sig.updateRectangles();
  X2sig.display();
  
  if ((mouseY>H_sig.Y_top)&&(mouseY<(H_sig.Y_top+H_sig.SignalHeight))){
    H_sig.setX(AdjustedMouseX);
    textFont(f3);
    fill(0);
    text("n="+str(int(shiftAmount)),AdjustedMouseX+20,180 + 2.6*AllottedSigH);
  }
  H_sig.updateRectangles();
  H_sig.display();
  
  Ysig.updateRectangles();
  Ysig.display();
  
  
  float mili = millis();
  if (mili < 4000){
    fill(0,200);
    stroke(0,200);
    rect(40,180+(2.4*AllottedSigH),width-80,1.5*AllottedSigH);
    textAlign(CENTER);
    fill(255);
    textFont(f2);
    text("Shift h[n-k] along axis \n & CLICK to compute y[n]",width/2,180+3*AllottedSigH);
  } else if (mili < 5000){
    stroke(0,(5000-mili) / 5);
    fill(0,(5000-mili) / 5);
    rect(40,180+(2.4*AllottedSigH),width-80,1.5*AllottedSigH);
    fill(0,(200 - (5000 - mili) / 5));
    textAlign(CENTER);
    textFont(f3);
    text("Northwestern University   EECS 222   2012",width/2,height-6);
  } else {
    fill(0,200);
  textAlign(CENTER);  
  textFont(f3);
  text("Northwestern University   EECS 222   2012",width/2,height-6);
  }
  


  /////// When you set the text to be the (new) x,h array data. 
  /////// make sure you reset the computed Y array to be all zero
}


//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//----------------------------- CLASS SIGNAL -------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
class Signal {

  // FIELDS 
  float Y_top;          // y_pos of top
  float X_zero;       // Centered X_pos
  float SignalHeight;   // height
  float SignalWidth;    // width
  float[] Data;          // array of all data
  int ZeroIndex;        // index of n=0
  float S_top;
  float S_bottom;
  Rectangle[] Rectangles;    // array of rectangles

    color C;               // Color of all rectangles' fill
    int[] show;             // wether or not we will show all values right away

  // CONSTRUCTOR
  Signal(float X, float Y, float h, float w, float[] D, int ZI, color c,int[] S) {
    X_zero = X;
    Y_top = Y;
    SignalHeight = h;
    SignalWidth = w;
    Data = D;
    S_top = max(Data);
    S_bottom = min(Data);
    ZeroIndex = ZI;
    show = S;
    Rectangle[] rectangles = new Rectangle[Data.length];
    C = c;  
    
    if ((S_top==0)&&(S_bottom==0)){
      S_top = 1;
      S_bottom = -1;
    }
    
    //Now Consider the indiviual Rectanlges
    float Ry = Y_top+((S_top / (S_top-S_bottom))*SignalHeight);
    float Rw = .8*SignalWidth/Data.length;
    for (int i=0; i<Data.length; i++) {
      float RV = Data[i];
      float Rx = i*(SignalWidth/Data.length) +  (X_zero-(ZeroIndex*SignalWidth/Data.length));
      rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C, show[i]);
    }
    Rectangles = rectangles;
  }

  Signal(float X, float Y, float h, float w, float[] D, float T, float B, int ZI, color c, int[] S) {
    X_zero = X;
    Y_top = Y;
    SignalHeight = h;
    SignalWidth = w;
    Data = D;
    S_top = T;
    S_bottom = B;
    ZeroIndex = ZI;
    show = S;
    Rectangle[] rectangles = new Rectangle[Data.length];
    C = c;  
    
    
    if ((S_top==0)&&(S_bottom==0)){
      S_top = 1;
      S_bottom = -1;
    }
    
    //Now Consider the indiviual Rectanlges
    float Ry = Y_top+((S_top / (S_top-S_bottom))*SignalHeight);
    float Rw = .8*SignalWidth/Data.length;
    for (int i=0; i<Data.length; i++) {
      float RV = Data[i];
      float Rx = i*(SignalWidth/Data.length) +  (X_zero-(ZeroIndex*SignalWidth/Data.length));
      rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C, show[i]);
    }
    Rectangles = rectangles;
  }



  // SETTERS
  void setX(float x) {
    X_zero = x;
  }
  void setData(float[] D) {
    Data = D;

    float Ry = Y_top+((S_top / (S_top-S_bottom))*SignalHeight);
    float Rw = .8*SignalWidth/Data.length;
    for (int i=0; i<Data.length; i++) {
      float RV = Data[i];
      float Rx = i*(SignalWidth/Data.length) + (X_zero-(ZeroIndex*SignalWidth/Data.length));
      Rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C, show[i]);
    }
  }


  // UPDATE RECTANGLES
  void updateRectangles() {
    for (int i=0; i<(Data.length); i++) {
      Rectangles[i].updateValue(Data[i]);
      float newX = i*(SignalWidth/Data.length)  + (X_zero-(ZeroIndex*SignalWidth/Data.length));
      Rectangles[i].updateX(newX);
    }
  }

  // DISPLAY
  void display() {
    stroke(200);
    line(0, Y_top+((S_top / (S_top-S_bottom))*SignalHeight), width, Y_top+((S_top / (S_top-S_bottom))*SignalHeight));
    line(X_zero, Y_top-(.1*SignalHeight), X_zero, Y_top+(1.1*SignalHeight));
    for (int i=0; i<(Data.length); i++) {
      Rectangles[i].display();
    }
  }
}


//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------- CLASS RECTANGLE ------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
class Rectangle {
  float Rwidth;
  float RValue;
  float Yzero;
  float Xcenter;
  color C_fill;
  color C_stroke;
  float SigHeight;
  float S_top;        //min and max values of the signal
  float S_bottom;
  int Show;

  Rectangle(float Rx, float Ry, float Rw, float RV, float SH, float ST, float SB, color C, int Shw) {
    Rwidth = Rw;
    RValue = RV;
    Yzero = Ry;
    Xcenter = Rx;
    C_fill = C;
    C_stroke = color(0);

    SigHeight = SH;
    S_top = ST;
    S_bottom = SB;
    
    Show = Shw;
  }

  // UPDATE VALUE
  void updateValue(float v) {
    RValue = v;
    S_top = max(S_top,v);
    S_bottom = min(S_bottom,v);
  }
  // UPDATE X
  void updateX(float x) {
    Xcenter = x;
  }
  // Allow the data value to be shown
  void setVis() {
    Show = 1;
  }

  // DISPLAY
  void display() {
    fill(C_fill);
    stroke(C_stroke);
    float tall = SigHeight*((RValue) / (S_top-S_bottom));
    rect((Xcenter-(Rwidth/2)), Yzero-max(0, tall), Rwidth, abs(tall));
    fill(0);
    textFont(f3);
    textAlign(CENTER);
    if (Show==1){
    if (float(int(RValue))==RValue) text(str(int(RValue)), Xcenter, Yzero-max(0, tall)-4);
    else text(str(RValue), Xcenter, Yzero-max(0, tall)-4);
    }
  }
}


//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------- OTHER FUNCTIONS ------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
// MOUSE CLICK
void mouseClicked() {
  float hw = width/2;
  rect(10,70,(width/2)-20,80);
  SignalID = ' ';
  if ((mouseX>10)&&(mouseX<hw-10)&&(mouseY>70)&&(mouseY<150)) SignalID = 'x';
  if ((mouseX>hw+10)&&(mouseX<width-10)&&(mouseY>70)&&(mouseY<150)) SignalID = 'h';
  if (mouseY>200){
    S_X_edit = S_X_save;
    S_H_edit = S_H_save;
  }
  
  
  if ((mouseY>180+(2.6*AllottedSigH))&&(mouseY<180+(3.6*AllottedSigH))){
    float shiftAmount;
    shiftAmount = round((mouseX - width/2) / (Xsig.SignalWidth/numRects));
    float Yvalue = 0.0;
    int HZI = H_sig.Data.length - ZeroIndex - 1;
    
    
    for (int i=0; i<numRects; i++){
      int hi = i+(HZI-ZeroIndex)-int(shiftAmount);
      if((hi>=0)&&(hi<numRects)){
        Yvalue += (Xsig.Data[i])*(H_sig.Data[hi]);
      }
    }
    


    float[] DD = Ysig.Data;
    int[] showIndicator = Ysig.show;
    if ((int(shiftAmount)+ZeroIndex >= 0)&&(int(shiftAmount)+ZeroIndex < numRects)){
      DD[int(shiftAmount)+ZeroIndex] = Yvalue;
      showIndicator[int(shiftAmount)+ZeroIndex] = 1;
    }
    Ysig = new Signal(width/2,180+(3.9*AllottedSigH),1.5*AllottedSigH,AllottedSigW,DD,ZeroIndex,ColorY,showIndicator);
    
    
  }
  
}

// KEY PRESS
void keyPressed() {
  // If the return key is pressed, save the String and clear it
  String saved = "";
  String typing = "";

  if (SignalID == 'x') {
    saved = S_X_save;
    typing = S_X_edit;
  } 
  else if (SignalID == 'h') {
    saved = S_H_save;
    typing = S_H_edit;
  }

  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    //typing = "";
  } 
  else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    if (keyCode == BACKSPACE) {
      if (typing.length()>0) {
        typing = typing.substring(0, typing.length() - 1);
      }
    } 
    else
      if (key != CODED) {
        if ((key == '-')||(key == '0')||(key == '1')||(key == '2')||(key == '3')||(key == '4')||(key == '5')||(key == '6')
          ||(key == '7')||(key == '8')||(key == '8')||(key == ',')||(key == '.')||(key == '[')||(key == ']')) {
          typing += key;
        }
      }
  }

  if (SignalID == 'x') {
    S_X_save = saved;
    S_X_edit = typing;
    if (key== '\n') XH_Boot();
  } 
  else if (SignalID == 'h') {
    S_H_save = saved;
    S_H_edit = typing;
    if (key== '\n') XH_Boot();
  }
}


// STRING converts TO an ARRAY of floats
float[][] String2Floats(String S) {
  String[] Q;
  float[] ArrayOut;
  int ZeroIndex = 0;
  Q = splitTokens(S, ",");
  int L = Q.length;
  String E_new = "";
  ArrayOut = new float[L];
  float[][] Output = new float[2][L];

  for (int i=0; i<L; i++) {
    String E = Q[i];
    int L_E = E.length();
    char first = E.charAt(0);
    char last = E.charAt(L_E-1);
    if ((first == '[')&&(last == ']')) {
      ZeroIndex=i;
      E_new = "";
      for (int j=1;j<(L_E-1);j++) {
        E_new = E_new+E.charAt(j);
      }
      ArrayOut[i] = float(E_new);
    } 
    else {
      ArrayOut[i] = float(E);
    }
  }

  Output[0] = ArrayOut;
  Output[1][0] = ZeroIndex;
  return Output;
}

// XH Boot Up
void XH_Boot(){
  
  float[][] S_X = String2Floats(S_X_save);
  float[] X_data_part = S_X[0];
  int X_0_index = int(S_X[1][0]);

  float[][] S_H = String2Floats(S_H_save);
  float[] H_data_part = S_H[0];
  int H_0_index = int(S_H[1][0]);

  int X_left = (-1)*X_0_index;
  int X_right = X_data_part.length + X_left - 1;
  int H_left = (-1)*H_0_index;
  int H_right = H_data_part.length + H_left - 1;

  int A_left = X_left+H_left-1;
  int A_right = X_right+H_right+1;
  int A_length = A_right - A_left + 1;
  numRects = A_length;
  ZeroIndex = H_0_index+(H_left-A_left);

  float[] X_data = new float[A_length];
  float[] H_data = new float[A_length];

  int i_x = A_left-X_left;
  int i_h = A_left-H_left;

  for (int i=0; i<A_length; i++) {

    if ((i_x >= 0)&&(i_x<X_data_part.length)) {
      X_data[i] = X_data_part[i_x];
    } 
    else {
      X_data[i] = 0;
    }
    if ((i_h >= 0)&&(i_h<H_data_part.length)) {
      H_data[i] = H_data_part[i_h];
    } 
    else {
      H_data[i] = 0;
    }
    i_x++;
    i_h++;
  }


  float X_top = max(X_data);
  float X_bottom = min(X_data);
  float H_top = max(H_data);
  float H_bottom = min(H_data);

  XH_top = max(X_top, H_top);
  XH_bottom = min(X_bottom, H_bottom);
  
  int maxSideRects = max(numRects - ZeroIndex,ZeroIndex);
  float widthPerRec = (width/2.2) / (maxSideRects);
  AllottedSigW = widthPerRec*numRects;
  
  int[] Ones = new int[A_length];
  int[] Zeros = new int[A_length];
  for(int i=0; i<A_length; i++) Ones[i] = 1;
  
  Xsig = new Signal(width/2, 180, AllottedSigH, AllottedSigW, X_data, XH_top, XH_bottom, ZeroIndex, ColorX,Ones);


  
  Hsig = new Signal(width/2, 180+(1.3*AllottedSigH), AllottedSigH, AllottedSigW, H_data, XH_top, XH_bottom, ZeroIndex, ColorH,Ones);

  X2sig = new Signal(width/2, 180+(2.6*AllottedSigH), AllottedSigH, AllottedSigW, X_data, XH_top, XH_bottom, ZeroIndex, ColorX,Ones);
  
  H_sig = new Signal(30, 180+(2.6*AllottedSigH), AllottedSigH, AllottedSigW, reverse(H_data), XH_top, XH_bottom, H_data.length - ZeroIndex-1, ColorH,Ones);
  

  ColorY = color(.5*red(ColorX)+.5*red(ColorH),.5*green(ColorX)+.5*green(ColorH),.5*blue(ColorX)+.5*blue(ColorH));
  float[] Blanks = new float[A_length];
  Ysig = new Signal(width/2,180+(3.9*AllottedSigH),1.5*AllottedSigH,AllottedSigW,Blanks,ZeroIndex,ColorY, Zeros);
  
}


