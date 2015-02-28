
// One bit processor simulator
// Copyright 2011 Strawdog

import guicomponents.*;

// The code to start the machine with
String programstring=
"# counting program\n" +
"\n" +
" 0 0  0   7 r ;first bit\n" +
" . 1  0  13 b ;\n" +
" . 0  2   9 r ;second bit\n" +
" . 1  2  13 b ;\n" +
" 4 0  +0 11 r ;third bit\n" +
" 5 1  -1 13 b ;\n" +
" 6 0  0   0 p ;\n" +
" . 0  0  +0 w ; loop\n" +
" . 1  8   2 w ;\n" +
" 9 0  2   9 w ;\n" +
"10 1 +0  -6 w ;\n" +
"11 0  4  +0 w ;\n" +
"12 1 12  +1 w ;\n" +
"13 1 -0   0 w ;\n"
;

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
int numreg=64;//192;



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
   size(387,588);
   //size(820,876);
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

