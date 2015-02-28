
// One bit processor simulator
// Copyright 2011 Strawdog

import guicomponents.*;

// The code to start the machine with
String programstring=
"# Turing machine program\n" +
"#\n" +
"# Process\n" +
"#\n" +
"# 1 step through tape to active cell\n" +
"# 2 process cell\n" +
"#    2a write cell value to machine register\n" +
"#    2a jump to machine\n" +
"#    2b branch to register / machine state code\n" +
"#    2c If machine is in tape writing mode\n" +
"#      2c-i set new tape value\n" +
"#      2c-j set machine so next machine call shifts tape\n" +
"#      2c-k jump to tape start   \n" +
"#    2d else machine is in tape shifting mode\n" +
"#      2d-i set machine so next machine call writes tape\n" +
"#      2d-j change machine state\n" +
"#      2d-k jump to tape shifting start\n" +
"# 3 tape writing - step through tape to active cell\n" +
"# 4 process cell\n" +
"#    4a jump to machine\n" +
"# 5 tape shifting right - step through tape to active cell\n" +
"#   write previous cell as active\n" +
"#   jump to previous cell\n" +
"# 6 tape shifting left \n" +
"#   mark this cell as inactive\n" +
"#   jump to next cell\n" +
"#\n" +
"#   This state machine is \n" +
"#   0 A   1 R B\n" +
"#   0 B   1 L A\n" +
"#   0 C   1 L B\n" +
"#   1 A   1 L C\n" +
"#   1 B   1 R B\n" +
"#   1 C   1 - H\n" +
"#\n" +
"#Label      address instruction write-to-register jump-to-register color ;comment\n" +
"                 0 1 0 51              w ; jump to tape\n" +
"# state machine (A - 0 0, B 0 1, C 1 0)\n" +
"HALT:            1 1 0 +0              K ; HALT STATE \n" +
"Input:           2 0 +0 (C1B)          b ; input buffer \n" +
"C0B:             3 0 +0 (CZeroStart)   b ; tape was zero\n" +
"B0B:             4 0 +0 (BZeroStart)   b ;\n" +
"#----------\n" +
"AZeroStart:      5 1 +0    +5         r ; azerostart  \n" +
"                 6 1 -1    +1         w ; set writemode\n" +
"                 7 1 (B0B) +1         w ; \n" +
"                 8 1 (B1B) +1         w ;\n" +
"                 9 1 -1    (T0SR)  w ;\n" +
"                10 0 -5    +1         w ; set shiftmode\n" +
"                11 1 -0    (T0W1)   w ;\n" +
"#----------\n" +
"BZeroStart:     12 1 +0    +5         r ; bzerostart  \n" +
"                13 1 -1    +1         w ; set writemode\n" +
"                14 0 4     +1         w ; \n" +
"                15 0 29 +1         w ;\n" +
"                16 1 -1    (T0SL)   w ;\n" +
"                17 0 -5    +1         w ; set shiftmode\n" +
"                18 1 -0    (T0W1)   w ;\n" +
"#----------\n" +
"CZeroStart:     19 1 +0    +7         r ; czerostart  \n" +
"                20 1 -1    +1         w ; set writemode\n" +
"                21 0 3     +1         w ; change state\n" +
"                22 0 28    +1         w ;\n" +
"                23 1 4     +1         w ; \n" +
"                24 1 29    +1         w ;\n" +
"                25 1 -1    (T0SL)   w ;\n" +
"                26 0 -7    +1         w ; set shiftmode\n" +
"                27 1 -0    (T0W1)   w ;\n" +
"#----------\n" +
"C1B:            28 0 +0 44            b ; tape was one\n" +
"B1B:            29 0 +0 37            b ;\n" +
"                30 1 +0    +5         r ; aonestart  \n" +
"                31 1 -1    +1         w ; set writemode\n" +
"                32 1  3    +1         w ; \n" +
"                33 1 28    +1         w ;\n" +
"                34 1 -1    (T0SL)  w ;\n" +
"                35 0 -5    +1         w ; set shiftmode\n" +
"                36 1 -0    (T0W1)   w ;\n" +
"#----------\n" +
"BOneStart:      37 1 +0    +5         r ; bonestart  \n" +
"                38 1 -1    +1         w ; set writemode\n" +
"                39 0 4     +1         w ; \n" +
"                40 0 28    +1         w ;\n" +
"                41 1 -1    (T0SR)   w ;\n" +
"                42 0 -5    +1         w ; set shiftmode\n" +
"                43 1 -0    (T0W1)   w ;\n" +
"#----------\n" +
"COneStart:      44 1 +0    +2         r ; conestart  \n" +
"                45 1 -1    (HALT)     w ; set writemode\n" +
"                46 0 -2    +1         w ; set shiftmode\n" +
"                47 1 -0    (T0W1)   w ;\n" +
"#---------\n" +
"#----------\n" +
"#-----------\n" +
"                48 0 0 0 K;----\n" +
"ERROR:          49 1 +0 +0 O;ERROR\n" +
"                50 0 0 0 K;----\n" +
"                \n" +
"                #  --  Tape  -- \n" +
"############## T1 ########################\n" +
"T0:            51 1 +0        (T1)     P ; jump to next\n" +
"                # - write to state machn\n" +
"T0VAL:          . 0 (Input)    +1      G ; T0VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T0W1:           . 1 +0        (T1W1)   p ; jump to next W1\n" +
"                . 1 (T0VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T0W0:           . 1 +0        (T1W0)   p ; jump to next W0\n" +
"                . 0 (T0VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T0SL:           . 1 +0        (T1SL)   p ; jump to next SL\n" +
"                . 1 +0        (ERROR)  y ; no previous\n" +
"  #              . 0 +0        +1       y ; \n" +
"  #              . 0 +0        +1       y ; \n" +
"  #              . 0 +0        +1       y ; \n" +
"  #              . 0 +0        +0       y ;  \n" +
"                . 1 +0        +0       r ; jump back one \n" +
"                # - step right\n" +
"T0SR:           . 1 +0       (T1SR)    p ; jump to next SR\n" +
"                . 1 (T0W1)   +1        y ; deactivate this\n" +
"                . 1 (T0W0)   +1        y ; \n" +
"                . 1 (T0SL)   +1        y ; \n" +
"                . 1 (T0SR)   +1        y ; \n" +
"                . 1 (T0)     (T1)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
"############## T1 ########################\n" +
"T1:             . 1 +0        (T2)     P ; jump to next\n" +
"                # - write to state machn\n" +
"T1VAL:          . 0 (Input)    +1      G ; T1VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T1W1:           . 1 +0        (T2W1)   p ; jump to next W1\n" +
"                . 1 (T1VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T1W0:           . 1 +0        (T2W0)   p ; jump to next W0\n" +
"                . 0 (T1VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T1SL:           . 1 +0        (T2SL)   p ; jump to next SL\n" +
"                . 0 (T0W1)    +1       y ; activate previous\n" +
"                . 0 (T0W0)    +1       y ; \n" +
"                . 0 (T0SL)    +1       y ; \n" +
"                . 0 (T0SR)    +1       y ; \n" +
"                . 0 (T0)     (T0)      y ;  \n" +
"                . 1 +0       (T0)      r ; jump back one \n" +
"                # - step right\n" +
"T1SR:           . 1 +0       (T2SR)    p ; jump to next SR\n" +
"                . 1 (T1W1)   +1        y ; deactivate this\n" +
"                . 1 (T1W0)   +1        y ; \n" +
"                . 1 (T1SL)   +1        y ; \n" +
"                . 1 (T1SR)   +1        y ; \n" +
"                . 1 (T1)     (T2)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" +
"############## T2 ########################\n" +
"T2:             . 1 +0         (T3)    P ; jump to next\n" +
"                # - write to state machn\n" +
"T2VAL:          . 0 (Input)    +1      G ; T2VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T2W1:           . 1 +0        (T3W1)   p ; jump to next W1\n" +
"                . 1 (T2VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T2W0:           . 1 +0        (T3W0)   p ; jump to next W0\n" +
"                . 0 (T2VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T2SL:           . 1 +0        (T3SL)   p ; jump to next SL\n" +
"                . 0 (T1W1)    +1       y ; activate previous\n" +
"                . 0 (T1W0)    +1       y ; \n" +
"                . 0 (T1SL)    +1       y ; \n" +
"                . 0 (T1SR)    +1       y ; \n" +
"                . 0 (T1)     (T1)      y ;  \n" +
"                . 1 +0       (T1)      r ; jump back one \n" +
"                # - step right\n" +
"T2SR:           . 1 +0       (T3SR)    p ; jump to next SR\n" +
"                . 1 (T2W1)   +1        y ; deactivate this\n" +
"                . 1 (T2W0)   +1        y ; \n" +
"                . 1 (T2SL)   +1        y ; \n" +
"                . 1 (T2SR)   +1        y ; \n" +
"                . 1 (T2)     (T3)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" +
"############## T3 ########################\n" +
"T3:             . 0 +0         (T4)    P ; jump to next\n" +
"                # - write to state machn\n" +
"T3VAL:          . 0 (Input)    +1      G ; T3VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T3W1:           . 0 +0        (T4W1)   p ; jump to next W1\n" +
"                . 1 (T3VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T3W0:           . 0 +0        (T4W0)   p ; jump to next W0\n" +
"                . 0 (T3VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T3SL:           . 0 +0        (T4SL)   p ; jump to next SL\n" +
"                . 0 (T2W1)    +1       y ; activate previous\n" +
"                . 0 (T2W0)    +1       y ; \n" +
"                . 0 (T2SL)    +1       y ; \n" +
"                . 0 (T2SR)    +1       y ; \n" +
"                . 0 (T2)     (T2)      y ;  \n" +
"                . 1 +0       (T2)      r ; jump back one \n" +
"                # - step right\n" +
"T3SR:           . 0 +0       (T4SR)    p ; jump to next SR\n" +
"                . 1 (T3W1)   +1        y ; deactivate this\n" +
"                . 1 (T3W0)   +1        y ; \n" +
"                . 1 (T3SL)   +1        y ; \n" +
"                . 1 (T3SR)   +1        y ; \n" +
"                . 1 (T3)     (T4)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" +
"############## T4 ########################\n" +
"T4:             . 0 +0         (T5)    P ; jump to next\n" +
"                # - write to state machn\n" +
"T4VAL:          . 0 (Input)    +1      G ; T4VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T4W1:           . 0 +0        (T5W1)   p ; jump to next W1\n" +
"                . 1 (T4VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T4W0:           . 0 +0        (T5W0)   p ; jump to next W0\n" +
"                . 0 (T4VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T4SL:           . 0 +0        (T5SL)   p ; jump to next SL\n" +
"                . 0 (T3W1)    +1       y ; activate previous\n" +
"                . 0 (T3W0)    +1       y ; \n" +
"                . 0 (T3SL)    +1       y ; \n" +
"                . 0 (T3SR)    +1       y ; \n" +
"                . 0 (T3)     (T3)      y ;  \n" +
"                . 1 +0       (T3)      r ; jump back one \n" +
"                # - step right\n" +
"T4SR:           . 0 +0       (T5SR)    p ; jump to next SR\n" +
"                . 1 (T4W1)   +1        y ; deactivate this\n" +
"                . 1 (T4W0)   +1        y ; \n" +
"                . 1 (T4SL)   +1        y ; \n" +
"                . 1 (T4SR)   +1        y ; \n" +
"                . 1 (T4)     (T5)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" +
"############## T5 ########################\n" +
"T5:             . 0 +0        (T6)     P ; jump to next\n" +
"                # - write to state machn\n" +
"T5VAL:          . 0 (Input)    +1      G ; T5VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T5W1:           . 0 +0        (T6W1)   p ; jump to next W1\n" +
"                . 1 (T5VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T5W0:           . 0 +0        (T6W0)   p ; jump to next W0\n" +
"                . 0 (T5VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T5SL:           . 0 +0        (T6SL)   p ; jump to next SL\n" +
"                . 0 (T4W1)    +1       y ; activate previous\n" +
"                . 0 (T4W0)    +1       y ; \n" +
"                . 0 (T4SL)    +1       y ; \n" +
"                . 0 (T4SR)    +1       y ; \n" +
"                . 0 (T4)     (T4)      y ;  \n" +
"                . 1 +0       (T4)      r ; jump back one \n" +
"                # - step right\n" +
"T5SR:           . 0 +0       (T6SR)    p ; jump to next SR\n" +
"                . 1 (T5W1)   +1        y ; deactivate this\n" +
"                . 1 (T5W0)   +1        y ; \n" +
"                . 1 (T5SL)   +1        y ; \n" +
"                . 1 (T5SR)   +1        y ; \n" +
"                . 1 (T5)     (T6)      r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" +
"############## T6 ########################\n" +
"T6:             . 0 +0        (ERROR)  P ; no next\n" +
"                # - write to state machn\n" +
"T6VAL:          . 0 (Input)    +1      G ; T6VAL\n" +
"                . 1 +0        (Input)  r ; jump to machine\n" +
"                # write 1\n" +
"T6W1:           . 0 +0        (ERROR)  p ; no next\n" +
"                . 1 (T6VAL)   (Input)  r ;\n" +
"                # write 0 \n" +
"T6W0:           . 0 +0        (ERROR)  p ; no next\n" +
"                . 0 (T6VAL)   (Input)  y ;\n" +
"                . 1 +0        (Input)  r ;\n" +
"                # - step left\n" +
"T6SL:           . 0 +0        (ERROR)  p ; no next\n" +
"                . 0 (T5W1)    +1       y ; activate previous\n" +
"                . 0 (T5W0)    +1       y ; \n" +
"                . 0 (T5SL)    +1       y ; \n" +
"                . 0 (T5SR)    +1       y ; \n" +
"                . 0 (T5)     (T5)      y ;  \n" +
"                . 1 +0       (T5)      r ; jump back one \n" +
"                # - step right\n" +
"T6SR:           . 0 +0       (ERROR)   p ; no next\n" +
"   #             . 1 (T6W1)   +1        y ; deactivate this\n" +
"   #             . 1 (T6W0)   +1        y ; \n" +
"   #             . 1 (T6SL)   +1        y ; \n" +
"   #             . 1 (T6SR)   +1        y ; \n" +
"                . 1 (T6)     (ERROR)   r ;  \n" +
"                # fall through to next tape cell\n" +
"\n" +
" \n" ;

/********************************************************************/
// Gui for program editing.
GTextField txfML1;
GLabel lblML1, lblInstructions;
GButton btnCompile, btnAccept;;
GPanel pnlControls;

void setupGui() {
    // Sets the colour scheme for the GUI components 
  // Schemes available are 
  // BLUE_SCHEME, GREEN_SCHEME, RED_SCHEME, GREY_SCHEME
  // YELLOW_SCHEME, CYAN_SCHEME, PURPLE_SCHEME
  // Defaults to BLUE_SCHEME 
  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.RED_SCHEME);

  GComponent.globalFont = GFont.getFont(this, "AndaleMono", 10);

  int padding=25;
  int pheight=height-2*padding;
  int pwidth =width-2*padding;
  int innerpadding=10;
  int instrheight=50;
  int cwidth=pwidth-2*innerpadding;
  int bheight=20;
  int bwidth=80;
  int progheight=pheight - 2*innerpadding-instrheight -2*innerpadding-bheight-instrheight;

  if(progheight<50) {
    println("Error: too small for program editor interface");
    progheight=50;
  }

  pnlControls = new GPanel(this,"Program Editor",padding,padding,pwidth,pheight);
  pnlControls.setOpaque(true);
  pnlControls.setCollapsed(false);
  pnlControls.setVisible(false);

  String instructions=
  "Edit the program here.  Each time you compile successfully, the " +
  "internal memory will be updated.  Be sure to save your work because when " +
  "the applet exits, this will be lost.";
  // This should be at height inner padding, but for some reason, it is too low
  lblInstructions = new GLabel(this, instructions, innerpadding,0, cwidth,instrheight);
  
  txfML1 = new GTextField(this, programstring, innerpadding, 2*innerpadding+instrheight, cwidth, progheight  , true);
  
  lblML1 = new GLabel(this, "Compilation Output", innerpadding,pheight-2*innerpadding-bheight-instrheight, cwidth,instrheight);

  btnCompile = new GButton(this, "Compile", innerpadding, pheight-bheight-innerpadding, bwidth, bheight);
  btnAccept = new GButton(this, "Accept", pwidth-bwidth-innerpadding, pheight-bheight-innerpadding, bwidth, bheight);
  pnlControls.add(btnCompile);
  pnlControls.add(btnAccept);
  pnlControls.add(txfML1);
  pnlControls.add(lblML1);
  pnlControls.add(lblInstructions);
}

void handleButtonEvents(GButton button) {
  if(button == btnCompile) {
     String    cres=parseProgram(txfML1.getText());
     if(cres.length()==0) {
       lblML1.setText("Successfully compiled\nProgram is loaded in memory\n");
       programstring=txfML1.getText();
     } else {
       lblML1.setText(cres);
       parseProgram(programstring);
     }
  }
  if(button == btnAccept)  {
    pnlControls.setVisible(false);
  }
}


/***************************************************************************************/
// The basic setup for the processor

float radius=3;
color off=color(255);
color on=color(255,0,0);
color textColor=color(128,128,255);
color commentColor=color(128,255,128);
color registerTextColor=color(0,80,0);
boolean drawRegisterBitFields=false;
int textspacer=10;


float outerPadding=6;
float registerHeight=9;
float textColSize=3*registerHeight;
float commentSize=80;
float buttonSize=40;
float commentSpacer=15;
boolean parseDebug=false;

float stepDelay=250; //milliseconds

int maxcolreg=96;
int numreg=192;



//---------------------------------------------
// it should not be necessary to edit below this line


int numbits=ceil(log(float(numreg))/log(2.0));
char colors[]=new char[numreg];
int register0[]=new int[numreg];
int register1[]=new int[numreg];
int register2[]=new int[numreg];
int instruction[]=new int[numreg];
String comments[]=new String[numreg];

float register_x=20;
float register_y[]=new float[numreg];
float bitcols0[]=new float[numbits];
float bitcols1[]=new float[numbits];
float bitcols2[]=new float[numbits];
float bitcolsInstruction[]=new float[1];
float commentCols[]=new float[2];
float buttonCols[]=new float[2];
float buttonRows[]=new float[8];


boolean isRunning=false;
int lastTime;
int programCounter=0;

class intClass {
  intClass(int val) {_val=val;}
  int getVal() {return _val;}
  int _val;
};

class Button {
  Button(float x,float y, float w, float h, String t) {
  _x=x;
  _y=y;
  _w=w;
  _h=h;
  on=true;
  label=t;
  }
  float _x;
  float _y;
  float _w;
  float _h;
  boolean on;
  String label;
  
  boolean isInside(float x,float y) {
    if(x>_x && x<(_x+_w) && y>_y && y<(_y+_h)) {
      return true;
    } else {
      return false;
    }
  }
  
  void turnOn() {on=true;}
  void turnOff() {on=false;}
  
  void Draw() {
      stroke(150,128,50);
      if(on) {
          fill(222,150,150,255);
      } else {
          fill(222,222,222,255);
      }
      rect(_x,_y,_w,_h);
      fill(textColor);
      textAlign(CENTER,CENTER);
      text(label,_x+_w/2,_y+_h/2);
  }
  
};


void clearRegisters()
{
  for(int i=0;i<numreg;++i) {
    register0[i]=0;
    instruction[i]=0;
    register1[i]=0;
    register2[i]=0;
    colors[i]='w';
    comments[i]="";
  }
}

int parseRegisterString(String iString, int idx, HashMap crossRefs) {
  int r1=-1;
  if(iString.substring(0,1).equals("(")) {
     if(parseDebug) print("Found cross-reference to ");
     if(parseDebug) println(iString);
     if(crossRefs.containsKey(iString)) {
         r1=((intClass)crossRefs.get(iString)).getVal();
     } else {
         print("ERROR: Unknown crossreference ");
         println(iString);
     }
  } else {
    // because int("+5") != 5... sigh...
     if(iString.substring(0,1).equals("-") ) {
       r1=int(iString)+idx;
     } else if(iString.substring(0,1).equals("+")) {
       r1=int(iString.substring(1))+idx;
     } else  {
       r1=int(iString);
     }
  }
  return r1;
}



String parseProgram(String program) {
  clearRegisters();
  programCounter=0;
  HashMap crossRefs=new HashMap();

  String compileOutput="";
 
  try {
  
    for(int state=0; state<2;++state) {
      
      int lastidx=-1;
      String[] proglines=split(program,"\n");
      int stc=0;
      while ( stc < proglines.length ) { //reader.ready()) {
	//num3 = Integer.parseInt(reader3.readLine()) ;
        String l=proglines[stc];
        stc++;//reader.readLine();
        try {
          String[] label=split(l,":");
          String codeline;
          String theLabel="";
          if(label.length == 2) {
            if(parseDebug) print("Found a label: ");
            if(parseDebug) println(label[0]);
            theLabel="("+label[0]+")";
            codeline=label[1];
          } else {
            codeline=l;
          }
          
          String[] tokens=split(codeline,';');
      
          if(tokens.length !=2 ) {
            // Comment
          } else {
            String[] subtokens=splitTokens(tokens[0]," \t");
            if(subtokens[0].substring(0,1).equals("#")) {
              // comment
            } else if (subtokens.length !=5) {
              compileOutput+="Bad line:";
              compileOutput+=l;
              compileOutput+="\n";
            }  else {
              int idx;
              if (subtokens[0].equals(".")) {
                idx=lastidx+1;
              } else {
                idx=int(subtokens[0]);
              }
              if(state==0) {
                if(theLabel.length() > 1) {
                  if(crossRefs.containsKey(theLabel)) {
                    compileOutput+="ERROR: double label ";
                    compileOutput+=theLabel;
                    compileOutput+="\n";
                  } else {
                   crossRefs.put(theLabel,new intClass(idx));
                  }
                }
              } else if(state==1) {
                int inst=int(subtokens[1]);
                int r1 = parseRegisterString(subtokens[2],idx,crossRefs);
                if(r1>=numreg || r1<0) {
                  compileOutput+="Error: invalid register in r1: ";
                  compileOutput+=r1;
                  compileOutput+=l;
                  compileOutput+="\n";
                }
              
                int r2 = parseRegisterString(subtokens[3],idx,crossRefs);
                if(r2>=numreg || r2<0) {
                  compileOutput+="Error: invalid register in r2: ";
                  compileOutput+=r2;
                  compileOutput+=l;
                  compileOutput+="\n";
                }
                if(idx<numreg) {
                  if(parseDebug) {
                    print(l);
                    print(" '");print(subtokens[0]);print("' ");
                    print(" '");print(subtokens[1]);print("' ");
                    print(" '");print(subtokens[2]);print("' ");
                    print(" '");print(subtokens[3]);print("' ");
                    print(": ");
                    print(idx);
                    print(" ");
                    print(inst);
                    print(" ");
                    print(r1);
                    print(" ");
                    print(r2);
                    print(" ");
                    print(subtokens[4].substring(0,1));
                    println("");
                  }
                
                  instruction[idx] =inst;
                  register0[idx] = idx;
                  register1[idx] = r1;
                  register2[idx] = r2;
                  colors[idx]=subtokens[4].charAt(0);
                  comments[idx]=tokens[1];
                } else {
                  compileOutput+="Error: index too large for machine\n";
                }
              }
              lastidx=idx;
            }
          }
        } catch(Exception e) {
          compileOutput+="Cannot parse line: ";
          compileOutput+=l;
          compileOutput+=e;
          compileOutput+="\n";
        }
      }  
    }
  }
  catch(Exception e) {
    compileOutput+="Error: " + e;
    compileOutput+="\n";
  }
   return compileOutput;
}


Button stepButton;
Button runButton;
Button stopButton;
Button loadButton;
Button programModeButton;
int startsecond;

void setup() {
  
   frameRate(25);

   //print(teststring); 
   for(int i=0;i<(numreg<=maxcolreg?numreg:maxcolreg);++i) {
     register_y[i]=outerPadding+i*registerHeight+registerHeight/2;
   }
   
   bitcolsInstruction[0]=2*textColSize+registerHeight*(drawRegisterBitFields?(numbits+1):1)+outerPadding;
   for(int i=0;i<numbits;++i) {
     bitcols0[i]=outerPadding+textColSize+(drawRegisterBitFields?registerHeight*i:0);
     bitcols1[i]=bitcolsInstruction[0]+1*textColSize+registerHeight*(i+1);
     bitcols2[i]=bitcolsInstruction[0]+2*textColSize+numbits*registerHeight+registerHeight*(i+1);
   }
   commentCols[0]=bitcols2[numbits-1]+commentSpacer;
   commentCols[1]=commentCols[0]+commentSize;
   buttonCols[0]=commentCols[1]+commentSpacer;
   buttonCols[1]=buttonCols[0]+buttonSize;



   int xsize=int(buttonCols[1]+outerPadding);
   int ysize=(numreg<maxcolreg)?int(outerPadding*2+numreg*registerHeight):int(outerPadding*2+maxcolreg*registerHeight);
   startsecond=xsize;
   if(numreg>maxcolreg) xsize+=xsize-outerPadding;
   print ("Desired size is: ");
   print (xsize);
   print (" x ");
   println (ysize);
   
   //size(xsize,ysize);
   // To export to openprocessing size must be fixed
   //size(387,588);
   size(820,876);
   //size(1140,1000);
   smooth();
   stroke(0);
   background(255);
   ellipseMode(CENTER);
   PFont font;
   font = loadFont("AndaleMono-10.vlw");
   textFont(font, registerHeight);
   textAlign(RIGHT,CENTER);
   

   stepButton=new Button(buttonCols[0],20,buttonSize,20, "step");
   runButton=new Button(buttonCols[0],50,buttonSize,20, "run");
   stopButton=new Button(buttonCols[0],80,buttonSize,20, "stop");
   stopButton.turnOff();
   loadButton=new Button(buttonCols[0],110,buttonSize,20, "reset");
   programModeButton=new Button(buttonCols[0],140,buttonSize,20, "edit");
   String cres=parseProgram(programstring);
   if(cres.length() > 0) {
      println("Error - initial program does not compile");
      println(cres);
   }
    
   setupGui();
}

void drawbit(int bit,float x,float y) {
  stroke(150,128,50);
    if(bit > 0) {
      fill(on);
    } else {
      fill(off);
    }
    ellipse(x,y,2*radius,2*radius);
}

void drawregisters(int startreg, int numreg, float startx) {
 
  for(int i=startreg;i<numreg;++i) {
    color drawcolor=color(255);
    if(colors[i]=='r')        drawcolor=color(255,150,150);
    else if(colors[i]=='g')   drawcolor=color(200,255,200);
    else if(colors[i]=='b')          drawcolor=color(200,200,255);
    else if(colors[i]=='p')              drawcolor=color(240,200,255);
    else if(colors[i]=='P')              drawcolor=color(240,0,255);
    else if(colors[i]=='y')              drawcolor=color(255,255,200);
    else if(colors[i]=='c')              drawcolor=color(200,255,255);
    else if(colors[i]=='k')              drawcolor=color(200,200,200);
    else if(colors[i]=='K')              drawcolor=color(0,0,0);
    else if(colors[i]=='R')              drawcolor=color(255,0,0);
    else if(colors[i]=='G')              drawcolor=color(0,255,0);
    else if(colors[i]=='O')              drawcolor=color(255,128,0);
    else { /*print("Unknown color : "); println(colors[i]); */}
    
    commentColor=drawcolor;
    if(colors[i]=='w') commentColor=color(150,128,50);
    fill(drawcolor);
    stroke(0,0);
    float starty=register_y[i-startreg]-5;
    rect(startx+bitcolsInstruction[0]-2*radius,starty,4*radius,registerHeight);
    if(drawRegisterBitFields) {
       rect(startx+bitcols0[0]-2*radius,starty,bitcols0[numbits-1]+4*radius-bitcols0[0],registerHeight);
    }
    rect(startx+bitcols1[0]-2*radius,starty,bitcols1[numbits-1]+4*radius-bitcols1[0],registerHeight);
    rect(startx+bitcols2[0]-2*radius,starty,bitcols2[numbits-1]+4*radius-bitcols2[0],registerHeight);
  }

  //println("In loop");
  float starty=register_y[0]-2*radius;
  float endy=register_y[numreg-1-startreg]+2*radius;
  fill(0,0);
  stroke(150,128,50);
  rect(startx+bitcolsInstruction[0]-2*radius,starty,4*radius,endy-starty);
  if(drawRegisterBitFields) {
     rect(startx+bitcols0[0]-2*radius,starty,bitcols0[numbits-1]+4*radius-bitcols0[0],endy-starty);
  }
  rect(startx+bitcols1[0]-2*radius,starty,bitcols1[numbits-1]+4*radius-bitcols1[0],endy-starty);
  rect(startx+bitcols2[0]-2*radius,starty,bitcols2[numbits-1]+4*radius-bitcols2[0],endy-starty);

  rect(startx+commentCols[0]-2*radius,starty,commentCols[1]+4*radius-commentCols[0],endy-starty);

  fill(99);
  stroke(150,128,50);
  for(int i=startreg;i<numreg;++i) {
    commentColor=color(150,128,50);
    if(colors[i]=='r')        commentColor=color(255,150,150);
    else if(colors[i]=='g')   commentColor=color(200,255,200);
    else if(colors[i]=='b')          commentColor=color(200,200,255);
    else if(colors[i]=='p')              commentColor=color(240,200,255);
    else if(colors[i]=='P')              commentColor=color(240,0,255);
    else if(colors[i]=='y')              commentColor=color(255,255,200);
    else if(colors[i]=='c')              commentColor=color(200,255,255);
    else if(colors[i]=='k')              commentColor=color(200,200,200);
    else if(colors[i]=='K')              commentColor=color(0,0,0);
    else if(colors[i]=='R')              commentColor=color(255,0,0);
    else if(colors[i]=='G')              commentColor=color(0,255,0);
    else if(colors[i]=='O')              commentColor=color(255,128,0);
    else { /*print("Unknown color : "); println(colors[i]); */}
    
    int iypos=i-startreg;
    drawbit(instruction[i],bitcolsInstruction[0]+startx,register_y[iypos]);

    int c=1;

    for(int b=0;b<numbits;++b) {
       if(drawRegisterBitFields) {
         drawbit(register0[i] & c,bitcols0[numbits-b-1]+startx,register_y[iypos]);
       }
      drawbit(register1[i] & c,bitcols1[numbits-b-1]+startx,register_y[iypos]);
      drawbit(register2[i] & c,bitcols2[numbits-b-1]+startx,register_y[iypos]);
      c*=2;
    }
    fill(commentColor);
    textAlign(LEFT,CENTER);
    text(comments[i],commentCols[0]+startx,register_y[iypos]);

    textAlign(RIGHT,CENTER);
    fill(textColor);
    String ival;
    if(instruction[i] > 0) {
      ival="1";
    } else {
      ival="0";
    }
    text(ival,bitcolsInstruction[0]-textspacer+startx,register_y[iypos]);
    text(str(register0[i]),bitcols0[0]-textspacer+startx,register_y[iypos]);
    text(str(register1[i]),bitcols1[0]-textspacer+startx,register_y[iypos]);
    text(str(register2[i]),bitcols2[0]-textspacer+startx,register_y[iypos]);

    fill(registerTextColor);
    text(str(register0[i]),bitcols0[0]-textspacer+startx,register_y[iypos]);
  }
  if(programCounter>=startreg && programCounter < numreg)
  {
    stroke(150,128,50);
    float pcx=bitcolsInstruction[0]-textspacer-registerHeight+startx;
    float pcy=register_y[programCounter-startreg];
    stroke(on);
    line(pcx-10,pcy,pcx,pcy);
    line(pcx-5,pcy-3,pcx,pcy);
    line(pcx-5,pcy+3,pcx,pcy);
    stroke(0);
    fill(0,0);
    float startyy=register_y[programCounter-startreg]-5;
    rect(startx+bitcols0[0]-2*radius,startyy,bitcols2[numbits-1]+4*radius-bitcols0[0],registerHeight);
  }
}





void draw() {
  background(255);
  if(pnlControls.isVisible()) {
    textAlign(LEFT,TOP);
    
  } else {
    if(numreg<65) {
      drawregisters(0,numreg,0);
    } else {
      drawregisters(0,maxcolreg,0);
      drawregisters(maxcolreg,numreg,startsecond);
    }
    if(isRunning) {
      stepButton.turnOff();
      stopButton.turnOn();
      runButton.turnOn();
    }
    stopButton.Draw();
    runButton.Draw();
    stepButton.Draw();
    loadButton.Draw();
    programModeButton.Draw();

    textAlign(RIGHT,CENTER);
    if(isRunning && millis()-lastTime > stepDelay)  {
      lastTime=millis();
      takeStep();
    }
  }
}


void takeStep() {
  instruction[register1[programCounter]]=instruction[programCounter];
  if(instruction[programCounter]>0) {
      programCounter=register2[programCounter];
  } else {
      programCounter++;
  }
  if(programCounter>=numreg) programCounter=0;
}

void mousePressed() {
  //print(" Got ");
  //print(mouseX);
  //print(" ");
  //println(mouseY);
  if(mouseX > buttonCols[0] && mouseX < buttonCols[1]) {
      if(stepButton.isInside(mouseX,mouseY)) {
        if(!isRunning) takeStep();
      } if(runButton.isInside(mouseX,mouseY)) {
        if(!isRunning) {
          isRunning=true;
        stepButton.turnOff();
        runButton.turnOff();
        stopButton.turnOn();
          lastTime=millis();
          takeStep();
        }
      } if(stopButton.isInside(mouseX,mouseY)) {
        isRunning=false;
        stepButton.turnOn();
        runButton.turnOn();
        stopButton.turnOff();
       
      } else if (loadButton.isInside(mouseX,mouseY)){
        isRunning=false;
        stepButton.turnOn();
        runButton.turnOn();
        stopButton.turnOff();
        parseProgram(programstring);
      } else if (programModeButton.isInside(mouseX,mouseY)){
        isRunning=false;
        stepButton.turnOn();
        runButton.turnOn();
        stopButton.turnOff();
        pnlControls.setVisible(true);
      } 
  } else {
    int regRow=-1;
    for(int i=0;i<numreg;++i) {
      if(mouseY>register_y[i]-radius && mouseY<register_y[i]+radius) {
        regRow=i;
        break;
      }
    }
    if(regRow<0) return;

    int bitCol=-1;
    if(mouseX > bitcolsInstruction[0]-radius && mouseX < bitcolsInstruction[0]+radius) {
      instruction[regRow] ^= 1;
    } else {
      for(int b=0;b<numbits;++b) {
         if(mouseX > (bitcols0[b]-radius) && mouseX < (bitcols0[b]+radius) ) {
           int c=int(pow(2,numbits-b-1));
           register0[regRow] ^= c;
           break;
         } else
         if(mouseX > (bitcols1[b]-radius) && mouseX < (bitcols1[b]+radius) ) {
           int c=int(pow(2,numbits-b-1));
           register1[regRow] ^= c;
           break;
         } else
         if(mouseX > (bitcols2[b]-radius) && mouseX < (bitcols2[b]+radius) ) {
           int c=int(pow(2,numbits-b-1));
           register2[regRow] ^= c;
           break;
         }
      }
    }
  }
}

