
// Draws a chart of electromagnetic spectrum
// Rupert Brooks, VA2WHY
// Set makePDF, below, to true to write a PDF file
// instead of drawing the applet.

import processing.pdf.*;

boolean makePDF=false;

// globals
float border=30;
float thinStrokeWeight=0.5;
float thickStrokeWeight=2.5;
float xstart;
float xend;
float minfreq=1;
float maxfreq=1e26;
PFont font5;
PFont font10;
PFont font15;
PFont font25;
PFont fText;
PFont fExponent;
PFont fLabel;
PFont fLabelsmall;
PFont fTitle;
boolean fillBox=true;

int drawingWidth=2500;
int appletWidth=600;
int offset=(drawingWidth-appletWidth)/2;
int maxOffset=drawingWidth-appletWidth;

// Mouse handling
int startDragX=0;
boolean pressed=false;
int startOffset=offset;

void mousePressed() {
  startDragX=mouseX;
  pressed=true;
  startOffset=offset;
}
void mouseDragged() {
  if(pressed) {
     offset=startOffset-mouseX+startDragX;
     if(offset<0) offset=0;
     if(offset>maxOffset) offset=maxOffset;
  }
}

void mouseReleased() {
  pressed=false;
}


void setup() {
  // for no display
  
  hint(ENABLE_NATIVE_FONTS);
  if(makePDF) {
    size(drawingWidth, 250, PDF, "filename.pdf");
    beginRecord(PDF, "spectrum.pdf"); 
    noLoop();
    offset=0;
    maxOffset=0;
  } else {
    size(appletWidth, 250);
  }

  // display
  xstart=border;
  xend=drawingWidth-border;
  font5 = loadFont("DejaVuSans-5.vlw");
  font10 = loadFont("DejaVuSans-10.vlw");
  font15 = loadFont("DejaVuSansCondensed-15.vlw");
  font25 = loadFont("DejaVuSans-25.vlw");
  fText=font10;
  fExponent=font5;
  fLabel=font15;
  fLabelsmall=loadFont("DejaVuSansCondensed-12.vlw");
  fTitle=font25;
  textFont(fText);
  
  textAlign(CENTER,BASELINE);
  background(255);
  frameRate(10);
}

float xpos(float val,String unit) {
  float hzval=0;
  if(unit.equals("Hz")) {
    hzval=val;
  } else if(unit.equals("kHz")) {
    hzval=val*1e3;
  } else if(unit.equals("MHz")) {
    hzval=val*1e6;
  } else if(unit.equals("GHz")) {
    hzval=val*1e9;
  } else if(unit.equals("m")) {
    hzval=3e8/val;
  } else if(unit.equals("um")) {
    hzval=3e14/val;
  } else if(unit.equals("nm")) {
    hzval=3e17/val;
  } else if(unit.equals("eV")) {
    hzval=3e17/(1240/val);
  } else if(unit.equals("keV")) {
    hzval=3e20/(1240/val);
  } else if(unit.equals("MeV")) {
    hzval=3e23/(1240/val);
  } else {
    println("Warning: Unknown unit: " + unit);
    return -1;
  }
  return xstart + (xend-xstart) * (log(hzval)-log(minfreq))/(log(maxfreq)-log(minfreq)) -offset;
} 

void tick(float ybottom,float ytop,float val,String unit) {
  float x=xpos(val,unit);
  line(x,ybottom,x,ytop);
}

void textbox(float xleft, float ybottom,float xright, float ytop, String theText) {
  if(!fillBox) noFill();
  rect(xleft,ytop,xright-xleft,ybottom-ytop);
  fill(0);
  textFont(fLabel);
  textAlign(CENTER,CENTER);
  text(theText,(xleft+xright)/2.0,(ybottom+ytop)/2.0);
}

void textboxsmall(float xleft, float ybottom,float xright, float ytop, String theText) {
  if(!fillBox) noFill();
  rect(xleft,ytop,xright-xleft,ybottom-ytop);
  fill(0);
  textFont(fLabelsmall);
  textAlign(CENTER,CENTER);
  text(theText,(xleft+xright)/2.0,(ybottom+ytop)/2.0);
}

String toStr(float val) {
  if(val<1) {
    return str(val);
  } else {
    return str(int(val+0.1));
  }
}

void scientificNotation(int val, int exponent, String unit, float x, float y) {
      String firstString;
      if(val==1) {
         firstString="10";
      } else {
         firstString=toStr(val) + "x10";
      }
      String expString=str(exponent);
      textFont(fText);
      float fw=textWidth(firstString);
      float uw=textWidth(unit);
      float th=textAscent();
      textFont(fExponent);
      float ew=textWidth(expString);
      textAlign(LEFT);
      float xstart=x-(fw+uw+ew)/2.0;
      text(expString,xstart+fw,y-th/2);
      textFont(fText);
      text(firstString,xstart,y);
      text(unit,xstart+fw+ew,y);
}

void formatText(float x, float y, int val, int exponent, String unit) {
  textAlign(CENTER);
  textFont(fText);
  if(unit.equals("Hz")) {
    if(exponent < 3 ) {
      text(toStr(val*pow(10,exponent))+" Hz",x,y);
    } else if (exponent < 6) {
      text(toStr(val*pow(10,(exponent-3)))+" kHz",x,y);
    } else if (exponent < 9) {
      text(toStr(val*pow(10,(exponent-6)))+" MHz",x,y);
    } else if (exponent < 12) {
      text(toStr(val*pow(10,(exponent-9)))+" GHz",x,y);
    } else {
      scientificNotation(val, exponent, " Hz",x,y);
    }    
  } else if(unit.equals("m")) {
    if(exponent > 5) {
      scientificNotation(val, exponent, " m",x,y);
    } else if(exponent > 2) {
      text(toStr(val*pow(10,exponent-3))+" km",x,y);
    } else if(exponent > -3 ) {
      text(toStr(val*pow(10,exponent))+" m",x,y);
    } else if (exponent > -6) {
      text(toStr(val*pow(10,(exponent+3)))+" mm",x,y);
    } else if (exponent > -12) {
      text(toStr(val*pow(10,(exponent+9)))+" nm",x,y);
    } else {
      scientificNotation(val, exponent+9, " nm",x,y);
    }    
  } else if(unit.equals("eV")) {
    if(exponent < -2 ) {
      scientificNotation(val, exponent, " eV",x,y);
    } else if (exponent < 3) {
      text(toStr(val*pow(10,exponent))+" eV",x,y);
    } else if (exponent < 6) {
      text(toStr(val*pow(10,(exponent-3)))+" keV",x,y);
    } else if (exponent < 9) {
      text(toStr(val*pow(10,(exponent-6)))+" MeV",x,y);
    } else if (exponent < 12) {
      text(toStr(val*pow(10,(exponent-9)))+" GeV",x,y);
    } else {
      scientificNotation(val, exponent, " eV",x,y);
    }    
  }
}

public void draw() {
  background(255);
  fillBox=true;
  stroke(0);
  fill(0);
  // Parameters
  float theStart=xstart-offset;
  float theEnd=xend-offset;
  float boxheight=25;
  float fBottom=height-border-border;
  float fTop=fBottom-15;
  float fText=fBottom+10;
  float box1=fTop-boxheight;
  float box2=box1-boxheight;
  float wBottom=box2-boxheight;
  float wTop=wBottom-15;
  float wText=wTop-5;
  float eBottom=wTop-boxheight;
  float eTop=eBottom-15;
  float eText=eBottom+10;

  float lTop=fBottom+boxheight;
  float lBottom=lTop+boxheight;
  
  color ITUColor=color(208,255,255);
  color IEEEColor=color(230,255,208);
  color NATOColor=color(255,255,208);
  color IRColor=color(255,230,230);
  color UV1Color=color(208,196,255);
  color UV2Color=color(230,208,255);
  color XColor=color(230,230,255);

  // Draw the boxed items
  // Radio
  // ITU BANDS
  fill(ITUColor);
  textbox(xpos(3,"Hz"), fTop, xpos( 30, "Hz"), box1, "ELF");
  fill(ITUColor);
  textbox(xpos(30,"Hz"), fTop, xpos( 300, "Hz"), box1, "SLF");
  fill(ITUColor);
  textbox(xpos(300,"Hz"), fTop, xpos( 3, "kHz"), box1, "ULF");
  fill(ITUColor);
  textbox(xpos(3,"kHz"), fTop, xpos( 30, "kHz"), box1, "VLF");
  fill(ITUColor);
  textbox(xpos(30,"kHz"), fTop, xpos( 300, "kHz"), box1, "LF");
  fill(ITUColor);
  textbox(xpos(300,"kHz"), fTop, xpos( 3, "MHz"), box1, "MF");
  fill(ITUColor);
  textbox(xpos(3,"MHz"), fTop, xpos( 30, "MHz"), box1, "HF");
  fill(ITUColor);
  textbox(xpos(30,"MHz"), fTop, xpos( 300, "MHz"), box1, "VHF");
  fill(ITUColor);
  textbox(xpos(300,"MHz"), fTop, xpos( 3, "GHz"), box1, "UHF");
  fill(ITUColor);
  textbox(xpos(3,"GHz"), fTop, xpos( 30, "GHz"), box1, "SHF");
  fill(ITUColor);
  textbox(xpos(30,"GHz"), fTop, xpos( 300, "GHz"), box1, "EHF");
  fill(ITUColor);
  textbox(xpos(300,"GHz"), fTop, xpos( 3000, "GHz"), box1, "THF");

  //IEEE BANDS
  fill(IEEEColor);
  textbox(xpos(3,"MHz"),box1, xpos(30,"MHz"), box2, "HF");
  fill(IEEEColor);
  textbox(xpos(30,"MHz"),box1, xpos(300,"MHz"), box2, "VHF");
  fill(IEEEColor);
  textbox(xpos(300,"MHz"),box1, xpos(1,"GHz"), box2, "UHF");
  fill(IEEEColor);
  textbox(xpos(1,"GHz"),box1, xpos(2,"GHz"), box2, "L");
  fill(IEEEColor);
  textbox(xpos(2,"GHz"),box1, xpos(4,"GHz"), box2, "S");
  fill(IEEEColor);
  textbox(xpos(4,"GHz"),box1, xpos(8,"GHz"), box2, "C");
  fill(IEEEColor);
  textbox(xpos(8,"GHz"),box1, xpos(12,"GHz"), box2, "X");
  fill(IEEEColor);
  textboxsmall(xpos(12,"GHz"),box1, xpos(18,"GHz"), box2, "Ku");
  fill(IEEEColor);
  textbox(xpos(18,"GHz"),box1, xpos(27,"GHz"), box2, "K");
  fill(IEEEColor);
  textboxsmall(xpos(27,"GHz"),box1, xpos(40,"GHz"), box2, "Ka");
  fill(IEEEColor);
  textbox(xpos(40,"GHz"),box1, xpos(75,"GHz"), box2, "V");
  fill(IEEEColor);
  textbox(xpos(75,"GHz"),box1, xpos(110,"GHz"), box2, "W");
  fill(IEEEColor);
  textbox(xpos(110,"GHz"),box1, xpos(300,"GHz"), box2, "mm");

  //IR
  //fillBox=false;
  fill(IRColor);
  textbox(xpos(1e6,"nm"), box1, xpos( 3000, "nm"), box2, "IR-C");
  fill(IRColor);
  textbox(xpos(3000,"nm"), box1, xpos( 1400, "nm"), box2, "B");
  fill(IRColor);
  textbox(xpos(1400,"nm"), box1, xpos( 760, "nm"), box2, "A");
  
  //NATO
  //fillBox=true;
  fill(NATOColor);
  textbox(xpos(1,"Hz"),box2,xpos(250,"MHz"),wBottom,"A");
  fill(NATOColor);
  textbox(xpos(250,"MHz"),box2,xpos(500,"MHz"),wBottom,"B");
  fill(NATOColor);
  textbox(xpos(500,"MHz"),box2,xpos(1,"GHz"),wBottom,"C");
  fill(NATOColor);
  textbox(xpos(1,"GHz"),box2,xpos(2,"GHz"),wBottom,"D");
  fill(NATOColor);
  textbox(xpos(2,"GHz"),box2,xpos(3,"GHz"),wBottom,"E");
  fill(NATOColor);
  textbox(xpos(3,"GHz"),box2,xpos(4,"GHz"),wBottom,"F");
  fill(NATOColor);
  textbox(xpos(4,"GHz"),box2,xpos(6,"GHz"),wBottom,"G");
  fill(NATOColor);
  textbox(xpos(6,"GHz"),box2,xpos(8,"GHz"),wBottom,"H");
  fill(NATOColor);
  textbox(xpos(8,"GHz"),box2,xpos(10,"GHz"),wBottom,"I");
  fill(NATOColor);
  textbox(xpos(10,"GHz"),box2,xpos(20,"GHz"),wBottom,"J");
  fill(NATOColor);
  textbox(xpos(20,"GHz"),box2,xpos(40,"GHz"),wBottom,"K");
  fill(NATOColor);
  textbox(xpos(40,"GHz"),box2,xpos(60,"GHz"),wBottom,"L");
  fill(NATOColor);
  textbox(xpos(60,"GHz"),box2,xpos(100,"GHz"),wBottom,"M");


  // VISIBLE SPECTRUM
  // draw the rainbow bars
  // red
  float specttop=fTop;
  float spectbot=wBottom;
  stroke(255,0,0);
  fill(255,0,0);
  rect(xpos(760,"nm"),specttop,xpos(610,"nm")-xpos(760,"nm"),spectbot-specttop);
  // orange
  stroke(255,128,0);
  fill(255,128,0);
  rect(xpos(610,"nm"),specttop,xpos(591,"nm")-xpos(610,"nm"),spectbot-specttop);
  // yellow 
  stroke(255,255,0);
  fill(255,255,0);
  rect(xpos(591,"nm"),specttop,xpos(570,"nm")-xpos(591,"nm"),spectbot-specttop);
  // green
  stroke(0,255,0);
  fill(0,255,0);
  rect(xpos(570,"nm"),specttop,xpos(500,"nm")-xpos(570,"nm"),spectbot-specttop);
  // blue
  stroke(0,0,255);
  fill(0,0,255);
  rect(xpos(500,"nm"),specttop,xpos(450,"nm")-xpos(500,"nm"),spectbot-specttop);
  // violet
  stroke(128,0,255);
  fill(128,0,255);
  rect(xpos(450,"nm"),specttop,xpos(400,"nm")-xpos(450,"nm"),spectbot-specttop);

  // Global solar uv index
  stroke(0); // have to set stroke back after rainbow
  fill(UV1Color);
  textbox(xpos(400,"nm"), fTop, xpos( 315, "nm"), box1, "");
  fill(UV1Color);
  textbox(xpos(315,"nm"), fTop, xpos( 280, "nm"), box1, "");
  fill(UV1Color);
  textbox(xpos(280,"nm"), fTop, xpos( 100, "nm"), box1, "UVC");

  // Aeronomy
  fill(UV2Color);
  textbox(xpos(121,"nm"), box1, xpos( 10, "nm"), box2, "EUV");
  fill(UV2Color);
  textbox(xpos(200,"nm"), box1, xpos( 121, "nm"), box2, "F");
  fill(UV2Color);
  textbox(xpos(300,"nm"), box1, xpos( 200, "nm"), box2, "M");
  fill(UV2Color);
  textbox(xpos(400,"nm"), box1, xpos( 300, "nm"), box2, "N");

  fill(XColor);
  textbox(xpos(10,"nm"), box1, xpos( 0.1, "nm"), box2, "Soft X-Ray");
  fill(XColor);
  textbox(xpos(0.1,"nm"), box1, xpos( 0.001, "nm"), box2, "Hard X-Ray");
  fill(XColor);
  textbox(xpos(0.001,"nm"), box1, xpos( 1e26, "Hz"), box2, "Gamma");

  // The main log scale bars
  // Frequency 
  stroke(0);
  textAlign(CENTER,TOP);
  strokeWeight(thickStrokeWeight);
  line(theStart,fBottom,theEnd,fBottom);
  line(theStart,fTop,theEnd,fTop);
  float val=1.0;
  for(int i=0;i<=26;++i) {
     strokeWeight(thickStrokeWeight);
     tick(fBottom,fTop,val,"Hz");
     strokeWeight(thinStrokeWeight);
     if(i<26) { // skip the last one
        for(int j=1;j<10;++j) {
           tick(fBottom,fTop,val*j,"Hz");
        }
     }
     formatText(xpos(val,"Hz"),fText,1,i,"Hz");
     val=val*10;
  }
  tick(fBottom,fTop,val,"Hz");
  formatText(xpos(val,"Hz"),fText,1,26,"Hz");


  // Wavelengths
  stroke(0);
  fill(0);
  textAlign(CENTER,BOTTOM);
  strokeWeight(thickStrokeWeight);
  line(theStart,wBottom,theEnd,wBottom);
  line(theStart,wTop,theEnd,wTop);
  val=3e-18f;
  for(int i=0;i<=26;++i) {
     strokeWeight(thickStrokeWeight);
     tick(wBottom,wTop,val,"m");
     strokeWeight(thinStrokeWeight);
     if(i<26) {
        for(int j=1;j<10;++j) {
           tick(wBottom,wTop,val*j,"m");
        }
     }
     formatText(xpos(val,"m"),wText,3,-18+i,"m");
     val=val*10;
  }
  tick(wBottom,wTop,val,"m");
  formatText(xpos(val,"m"),wText,3,-18+26,"m");
  
  // Energy
  textAlign(CENTER,BASELINE);
  strokeWeight(thickStrokeWeight);
  line(xpos(1e-14,"eV"),eBottom,xpos(1e11,"eV"),eBottom);
  line(xpos(1e-14,"eV"),eTop,xpos(1e11,"eV"),eTop);
  val=1e-14f;
  for(int i=0;i<=24;++i) {
     strokeWeight(thickStrokeWeight);
     tick(eBottom,eTop,val,"eV");
     strokeWeight(thinStrokeWeight);
     for(int j=1;j<10;++j) {
        tick(eBottom,eTop,val*j,"eV");
     }
     formatText(xpos(val,"eV"),eText,1,-14+i,"eV");
     val=val*10;
  }
  strokeWeight(thickStrokeWeight);
  tick(eBottom,eTop,val,"eV");
  formatText(xpos(val,"eV"),eText,1,-14+25,"eV");

  // Supplementary information bars  
  float h1=box2-boxheight/2;
  float mdx = xpos(400,"nm");
  float mdxh=(h1+box2)/2.0;
  
  float ion = xpos(124,"nm");
  float ionh = (h1+wBottom)/2.0;
  
  strokeWeight(thickStrokeWeight);
  textFont(font10);
  float twmdx=textWidth("Molecularly Damaging");
  float twion=textWidth("Ionizing");
  float twmicro=textWidth("Microwave");
  float twtera=textWidth("Terahertz");
  float microlow=xpos(300,"MHz");
  float microhigh=xpos(300,"GHz");
  float microh=fBottom+boxheight/1.5;

  float tlow=xpos(300,"GHz");
  float thigh=xpos(3000,"GHz");
  float th=fBottom+boxheight/1.5;
  
  line(mdx,mdxh,(theEnd+mdx-twmdx-10)/2.0,mdxh);
  line(theEnd,mdxh,(theEnd+mdx+twmdx+10)/2.0,mdxh);
  text("Molecularly Damaging",(theEnd+mdx)/2.0,mdxh+textAscent()/3.0);
  line(mdx,box2,mdx,h1);

  line(ion,ionh,(theEnd+ion-twion-10)/2.0,ionh);
  line(theEnd,ionh,(theEnd+ion+twion+10)/2.0,ionh);
  text("Ionizing",(theEnd+ion)/2.0,ionh+textAscent()/3.0);
  line(ion,h1,ion,wBottom);

  line(microlow,microh,(microhigh+microlow-twmicro-10)/2.0,microh);
  line(microhigh,microh,(microhigh+microlow+twmicro+10)/2.0,microh);
  text("Microwave",(microlow+microhigh)/2.0,microh+textAscent()/3.0);
  line(microlow,microh-boxheight/3,microlow,microh+boxheight/4);
  line(microhigh,microh-boxheight/3,microhigh,microh+boxheight/4);

  line(tlow,th,(thigh+tlow-twtera-10)/2.0,th);
  line(thigh,th,(thigh+tlow+twtera+10)/2.0,th);
  text("Terahertz",(tlow+thigh)/2.0,th+textAscent()/3.0);
  line(tlow,th-boxheight/3,tlow,th+boxheight/4);
  line(thigh,th-boxheight/3,thigh,th+boxheight/4);

  // legend
  strokeWeight(thinStrokeWeight);
  // ITU BANDS
  fillBox=true;

  fill(ITUColor);
  textbox(xpos(3,"Hz"), lBottom, xpos( 100, "Hz"), lTop, "ITU Bands");

  //IEEE BANDS
  fill(IEEEColor);
  textbox(xpos(300,"Hz"), lBottom, xpos( 10000, "Hz"), lTop, "IEEE Bands");

  fill(NATOColor);
  textbox(xpos(30,"kHz"),lBottom,xpos(1,"MHz"),lTop,"NATO Bands");

  fill(IRColor);
  textbox(xpos(1e12,"Hz"),lBottom,xpos(3e13,"Hz"),lTop,"Infrared");

  fill(UV1Color);
  textbox(xpos(1e14,"Hz"),lBottom,xpos(3e15,"Hz"),lTop,"UVA,B and C");

  fill(UV2Color);
  textbox(xpos(1e16,"Hz"),lBottom,xpos(1e19,"Hz"),lTop,"Near, Mid, Far, Extreme UV");

  // Title
  textFont(fTitle);
  textAlign(CENTER,BASELINE);
  text("The Electromagnetic Spectrum",width/2,25);
  
  // Reference
  textFont(font10);
  textAlign(LEFT,CENTER);
  text("Chart by Rupert Brooks, VA2WHY. Version 1.0 12/04/2012.  See http://openprocessing.org/sketch/58905 for more info.",drawingWidth*3.0/4.0-offset,(lBottom+lTop)/2.0);
  // display version
  if(makePDF) {
     endRecord();
     // no display version
     // Exit the program 
     println("Finished.");
     exit();
  }
}


