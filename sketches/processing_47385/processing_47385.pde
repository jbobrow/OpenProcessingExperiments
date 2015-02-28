
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//---------------------------GLOBAL CONSTANTS-------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//

String S_X_edit = "0,-1,1,2,3,2,1,-1,0";
String S_H_edit = "[0],1,1,1,1,2,3";

String S_X_save = S_X_edit;
String S_H_save = S_H_edit;



//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//---------------------------GLOBAL VARIABLES-------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
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
PFont f1;
PFont f2;
PFont f3;
char SignalID;

color CC1;
color CC2;
color CC3;

//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------SETUP-------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
void setup() {
  F = createFont("Impact",24,true);
  Fs = createFont("Impact",16,true);
  f1 = createFont("Arial", 12, true);
  f2 = createFont("Arial", 18, true);
  f3 = createFont("Courier", 10, true);
  
  background(255);
  smooth();
  size(800, 800);
  
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
  rect(5,45,width-10,110);
  fill(10, 50, 190,200);
  rect(10,70,(width/2)-20,80);
  fill(245, 240, 40,200);
  rect((width/2)+10,70,(width/2)-20,80);
  
  if (SignalID == 'x'){
   fill(134, 176, 240);
   rect(18,110,(width/2) - 50,18);
  }
  if (SignalID == 'h'){
   fill(225, 225, 130);
   rect((width/2)+18,110,(width/2) - 50,18);
  }

  
  fill(0);
  textAlign(CENTER);
  textFont(F);
  text("Convolution",width/2,26);
  textFont(Fs);
  text("Matt Dzugan",width/2,43);  
  textFont(f1);
  text("Enter x[n]: separated by commas.  Enclose value for x[n=0] in [brackets]",width/2,60);
  textFont(f2);
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
    text("n="+str(int(shiftAmount)),AdjustedMouseX+20,450);
  }
  H_sig.updateRectangles();
  H_sig.display();
  
  Ysig.updateRectangles();
  Ysig.display();




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
    int show;             // wether or not we will show all values right away

  // CONSTRUCTOR
  Signal(float X, float Y, float h, float w, float[] D, int ZI, color c) {
    X_zero = X;
    Y_top = Y;
    SignalHeight = h;
    SignalWidth = w;
    Data = D;
    S_top = max(Data);
    S_bottom = min(Data);
    ZeroIndex = ZI;
    show = 0;
    Rectangle[] rectangles = new Rectangle[Data.length];
    C = c;  
    //Now Consider the indiviual Rectanlges
    float Ry = Y_top+((S_top / (S_top-S_bottom))*SignalHeight);
    float Rw = .8*SignalWidth/Data.length;
    for (int i=0; i<Data.length; i++) {
      float RV = Data[i];
      float Rx = i*(SignalWidth/Data.length) +  (X_zero-(ZeroIndex*SignalWidth/Data.length));
      rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C);
    }
    Rectangles = rectangles;
  }

  Signal(float X, float Y, float h, float w, float[] D, float T, float B, int ZI, color c) {
    X_zero = X;
    Y_top = Y;
    SignalHeight = h;
    SignalWidth = w;
    Data = D;
    S_top = T;
    S_bottom = B;
    ZeroIndex = ZI;
    show = 1;
    Rectangle[] rectangles = new Rectangle[Data.length];
    C = c;  
    //Now Consider the indiviual Rectanlges
    float Ry = Y_top+((S_top / (S_top-S_bottom))*SignalHeight);
    float Rw = .8*SignalWidth/Data.length;
    for (int i=0; i<Data.length; i++) {
      float RV = Data[i];
      float Rx = i*(SignalWidth/Data.length) +  (X_zero-(ZeroIndex*SignalWidth/Data.length));
      rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C);
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
      Rectangles[i] = new Rectangle(Rx, Ry, Rw, RV, SignalHeight, S_top, S_bottom, C);
    }
  }

  // UPDATE 1 DATA ELEMENT
  void updateDataElement(int Index, float Value) {
    Data[Index] = Value;
    updateRectangles();
    S_top = max(S_top,Value);
    S_bottom = min(S_bottom,Value);
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

  Rectangle(float Rx, float Ry, float Rw, float RV, float SH, float ST, float SB, color C) {
    Rwidth = Rw;
    RValue = RV;
    Yzero = Ry;
    Xcenter = Rx;
    C_fill = C;
    C_stroke = color(0);

    SigHeight = SH;
    S_top = ST;
    S_bottom = SB;
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

  // DISPLAY
  void display() {
    fill(C_fill);
    stroke(C_stroke);
    float tall = SigHeight*((RValue) / (S_top-S_bottom));
    rect((Xcenter-(Rwidth/2)), Yzero-max(0, tall), Rwidth, abs(tall));
    fill(0);
    textFont(f3);
    textAlign(CENTER);
    //text(str(RValue),Xcenter,Yzero-4);
    text(str(RValue), Xcenter, Yzero-max(0, tall)-4);
    //text("t="+round(Xcenter-Rwidth/2),Xcenter+1,Yzero-0.5*SigHeight);
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
  
  
  if ((mouseY>460)&&(mouseY<560)){
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
    if ((int(shiftAmount)+ZeroIndex >= 0)&&(int(shiftAmount)+ZeroIndex < numRects)){
      DD[int(shiftAmount)+ZeroIndex] = Yvalue;
    }
    //Ysig.updateDataElement(int(shiftAmount)+ZeroIndex,Yvalue);
    Ysig = new Signal(width/2,600,150,500,DD,ZeroIndex,CC3);
    
    
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
    typing = "";
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
  

  CC1 = color(10, 50, 190, 200);
  //Xsig = new Signal(mouseX, 400, 100, 500, H_data,ZeroIndex, CC);
  Xsig = new Signal(width/2, 180, 100, 500, X_data, XH_top, XH_bottom, ZeroIndex, CC1);


  CC2 = color(245, 240, 40, 170);
  Hsig = new Signal(width/2, 320, 100, 500, H_data, XH_top, XH_bottom, ZeroIndex, CC2);

  X2sig = new Signal(width/2, 460, 100, 500, X_data, XH_top, XH_bottom, ZeroIndex, CC1);
  
  H_sig = new Signal(30, 460, 100, 500, reverse(H_data), XH_top, XH_bottom, H_data.length - ZeroIndex-1, CC2);
  

  CC3 = color(.5*red(CC1)+.5*red(CC2),.5*green(CC1)+.5*green(CC2),.5*blue(CC1)+.5*blue(CC2));
  float[] Blanks = new float[A_length];
  Ysig = new Signal(width/2,600,150,500,Blanks,ZeroIndex,CC3);
  
}


