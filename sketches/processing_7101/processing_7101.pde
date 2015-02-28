
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import controlP5.*;
import promidi.*;
import themidibus.*; 
import oscP5.*;
import netP5.*;


Minim minim;
AudioInput myInput;
FFT myFFT;
ControlP5 controlP5;
ControlWindow controlWindow;
MidiIO midiIO;
MidiBus myBus; 
OscP5 oscP5;
NetAddress myBroadcastLocation;
Textarea myTextarea;

int myBroadcastPort = 12000;
String myBroadcastIp = "127.0.0.1";
float AGC=1;
String OSCMessage= "/Traktor.Deck1.Beat";
float OSC_VALUE=1.0;
int Bank = (1);
int Pitch = (64);
int Velocity =(127);
int DelayOn=(30);
int DelayOff=(5);
int averages;
int h=1;
float a;
float b;
float c;
float avgAll=100;
float avg1=100;
float avg2=100;
float avg3=100;

float avgAll2=100;
float avg12=100;
float avg22=100;
float avg32=100;

float totalEnergy;
float totalAll;
float total1;
float total2;
float total3;
float totalBarAll;

float totalAll2;
float total12;
float total22;
float total32;

int indexEnergy=0;
int indexAll = 0;
int index1 = 0;
int index2 = 0;
int index3 = 0; 
int indexBarAll = 0;

int indexAll2 = 0;
int index12 = 0;
int index22 = 0;
int index32 = 0; 


float averageAll = 0;
float average1 = 0;
float average2 = 0;
float average3 = 0;

float averageAll2 = 0;
float average12 = 0;
float average22 = 0;
float average32 = 0;

int numReadingsEnergy = (200);
int numReadingsAll = (200);
int numReadings1 = (200);
int numReadings2 = (200);
int numReadings3 = (200);
int numReadingsBarAll = (200);

int numReadingsAll2 = (50);
int numReadings12 = (50);
int numReadings22 = (50);
int numReadings32 = (50);

float[] readingsEnergy= new float[numReadingsEnergy];
float[] readingsAll= new float[numReadingsAll];
float[] readings1= new float[numReadings1];
float[] readings2= new float[numReadings2];
float[] readings3= new float[numReadings3];
float[] readingsBarAll= new float[numReadingsBarAll];

float[] readingsAll2= new float[numReadingsAll2];
float[] readings12= new float[numReadings12];
float[] readings22= new float[numReadings22];
float[] readings32= new float[numReadings32];

boolean getAll = true;
boolean get1 = true;
boolean get2 = true;
boolean get3 = true;
boolean  beat=false;

boolean Wave = true;
boolean Wave1 = true;
boolean Wave2 = true;
boolean Wave3 = true;

boolean Auto = true;
boolean Draw = true;
boolean agc =true;
boolean osc = false;
boolean MIDI = false;

float Volume =.25;
int Band=3;
int g;
float MaxBPM = 200;
int mydelay;
int milidif;
int time  ;
int lsid=0;
int minVol=100;
int Speed=0;
int ctid=1;
int runtime;
int timeold;
int Power=10;
int hoehe;
float dirAll;
float dir1;
float dir2;
float dir3;
int Energy= 20;
void setup(){
  size(400, 200);
  frameRate(200);
  averages = 1024;
   myBus = new MidiBus(this);
  midiIO = MidiIO.getInstance(this);
  midiIO.printOutputDevices();
  oscP5 = new OscP5(this,myBroadcastPort);
myBroadcastLocation = new NetAddress(myBroadcastIp,myBroadcastPort);
   minim = new Minim(this); 
 myInput= minim.getLineIn(Minim.STEREO,averages);
   myFFT = new FFT(averages,myInput.sampleRate());
    myFFT.logAverages(22, 3);
 
 time = 0;
  milidif = 500;
   mydelay = 300;
  
 if (97+(midiIO.numberOfOutputDevices()*12)<315){
  hoehe = 315;
   }else if (97+(midiIO.numberOfOutputDevices()*12)>315){
    hoehe=97+(midiIO.numberOfOutputDevices()*12);
  }

 

 
  controlP5 = new ControlP5(this);
   controlWindow = controlP5.addControlWindow("Settings",400,hoehe);//
    controlWindow.setBackground(color(0));
  

  MultiList l = controlP5.addMultiList("myList",1,97,width/2-2,12);
   l.setWindow(controlWindow);
    MultiListButton e = l.add("Midi Outputs",2);
      for(int i=0;i<midiIO.numberOfOutputDevices();i++) {
       MultiListButton d = e.add("Midi Output"+i,40+i+1);
        d.setLabel((i+1)+" "+midiIO.getOutputDeviceName(i));
         d.setId(i);}
  
         
         
  controlP5.setColorActive(color(128,0,128));
  controlP5.Controller Power = 
   controlP5.addSlider("Power",1,20,10,1,1,width-40,15);
    Power.setWindow(controlWindow);
  
  controlP5.Controller minVol1 = 
   controlP5.addSlider("minVol",0,200,100,1,17,width-40,15);
    minVol1.setWindow(controlWindow);
  
  controlP5.Controller MaxBPM = 
   controlP5.addSlider("MaxBPM",100,300,200,1,33,width-40,15);
    MaxBPM.setWindow(controlWindow);
  
  controlP5.Controller Band = 
   controlP5.addSlider("Band",1,10,3,1,49,width-40,15);
    Band.setWindow(controlWindow);
  
  controlP5.Controller Auto = 
   controlP5.addToggle("Auto",true,60,115,10,10);
     Auto.setWindow(controlWindow);
     
  controlP5.Controller agc = 
   controlP5.addToggle("agc",true,110,115,10,10);
     agc.setWindow(controlWindow);   
     
  controlP5.Controller Draw = 
   controlP5.addToggle("Draw",true,10,115,10,10);
     Draw.setWindow(controlWindow);   
  
  controlP5.Controller osc = 
   controlP5.addToggle("osc",false,1,200,10,100);
     osc.setWindow(controlWindow);   
  
  controlP5.Controller MIDI = 
   controlP5.addToggle("MIDI",false,1,140,10,47);
     MIDI.setWindow(controlWindow);
     
  controlP5.Controller Bank =
   controlP5.addSlider("Bank",1,16,1,12,140,149,15);
    Bank.setWindow(controlWindow);
  
  controlP5.Controller Pitch =
   controlP5.addSlider("Pitch",0,127,64,12,156,149,15);
    Pitch.setWindow(controlWindow);
    
  controlP5.Controller Velocity =
   controlP5.addSlider("Velocity",0,127,127,12,172,149,15);
    Velocity.setWindow(controlWindow);  
    
  controlP5.Controller OSCmessage =
   controlP5.addTextfield("OSCMessage",12,200,186,14);
    OSCmessage.setWindow(controlWindow); 
    
  controlP5.Controller OSCVALUE =  
   controlP5.addTextfield("OSCVALUE",12,225,186,14);  
    OSCVALUE.setWindow(controlWindow);
    
  controlP5.Controller BroadCastIP =  
   controlP5.addTextfield("BroadCast IP",12,250,186,14);
    BroadCastIP.setWindow(controlWindow); 
   
  controlP5.Controller Port = 
   controlP5.addTextfield("Port",12,275,186,14);
    Port.setWindow(controlWindow); 
    
  myTextarea = controlP5.addTextarea("","",0,170,200,30);
  
  controlP5.Controller Volume =
   controlP5.addSlider("Volume",0,2,.25,1,65,width-40,15);
    Volume.setWindow(controlWindow);
  
  controlP5.Controller Speed =
   controlP5.addSlider("Speed",0,8,0,1,81,width-40,15);
    Speed.setWindow(controlWindow);
    
  controlP5.Controller Energy =
   controlP5.addSlider("Energy",0,199,20,201,97,width-240,12);
    Energy.setWindow(controlWindow);  
  
  controlP5.addSlider("avg1",0,200,100,0,0,20,200);
   controlP5.controller("avg1").moveTo("Band 1");
  controlP5.addSlider("avg2",0,200,100,0,0,20,200);
   controlP5.controller("avg2").moveTo("Band 2");
  controlP5.addSlider("avg3",0,200,100,0,0,20,200);
   controlP5.controller("avg3").moveTo("Band 3");
  controlP5.addSlider("avgAll",0,200,100,0,0,20,200);
   controlP5.controller("avgAll").moveTo("Band All");
  
  controlP5.addToggle("get1",true,21,100,20,20);
   controlP5.controller("get1").moveTo("Band 1");
  controlP5.addToggle("get2",true,21,100,20,20);
   controlP5.controller("get2").moveTo("Band 2");
  controlP5.addToggle("get3",true,21,100,20,20);
   controlP5.controller("get3").moveTo("Band 3");
  controlP5.addToggle("getAll",true,21,100,20,20);
   controlP5.controller("getAll").moveTo("Band All");
  
  controlP5.addToggle("Wave1",true,370,100,20,20);
   controlP5.controller("Wave1").moveTo("Band 1");
  controlP5.addToggle("Wave2",true,370,100,20,20);
   controlP5.controller("Wave2").moveTo("Band 2");
  controlP5.addToggle("Wave3",true,370,100,20,20);
   controlP5.controller("Wave3").moveTo("Band 3");
  controlP5.addToggle("Wave",true,370,100,20,20);
   controlP5.controller("Wave").moveTo("Band All");
  
  controlP5.tab("Band 1").activateEvent(true).setId(2);
   controlP5.tab("Band 1").setColorActive(color(128,0,0));
    controlP5.tab("Band 1").setColorForeground(color(64,0,0));
  controlP5.tab("Band 2").activateEvent(true).setId(3);
   controlP5.tab("Band 2").setColorActive(color(0,128,0));
    controlP5.tab("Band 2").setColorForeground(color(0,64,0));
  controlP5.tab("Band 3").activateEvent(true).setId(4);
   controlP5.tab("Band 3").setColorActive(color(0,0,128));
    controlP5.tab("Band 3").setColorForeground(color(0,0,64));
  controlP5.tab("Band All").activateEvent(true).setId(5);
   controlP5.tab("Band All").setColorActive(color(128,128,0));
    controlP5.tab("Band All").setColorForeground(color(64,64,0));
  controlP5.tab("energy").activateEvent(true).setId(6);
   controlP5.tab("energy").setColorActive(color(128,128,0));
    controlP5.tab("energy").setColorForeground(color(64,64,0));
  controlP5.tab("default").activateEvent(true).setId(1);
   controlP5.tab("default").setLabel("    MAIN");
    controlP5.tab("default").setColorActive(color(128,0,128));
}
  
void controlEvent(ControlEvent theEvent) {
 
ctid = controlP5.window(this).currentTab().id();

  if(theEvent.controller() instanceof MultiListButton) {
    println("a multilist event. id:"+theEvent.controller().id());
    lsid = theEvent.controller().id();
    if (theEvent.controller().id()>=0){
      
    myBus.addOutput(lsid);
    }
    if (theEvent.controller().id()<0){
      myBus.clearOutputs();
    }
  }
 if (theEvent.controller().name()== "BroadCast IP"){
    myBroadcastIp=theEvent.controller().stringValue();
  }
  if (theEvent.controller().name()== "Port"){
    myBroadcastPort =Integer.parseInt(theEvent.controller().stringValue());
  }
  if (theEvent.controller().name()== "OSCVALUE"){
    OSC_VALUE =Float.parseFloat(theEvent.controller().stringValue());
  }
  myBroadcastLocation = new NetAddress(myBroadcastIp,myBroadcastPort);
  if (osc==true){
  myTextarea.setText("OSCMessage: "+OSCMessage+" : "+OSC_VALUE+"\n"+"Broadcast IP: "+myBroadcastIp+"\n"+"Broadcast PORT: "+myBroadcastPort);
  }else if (osc==false){
    myTextarea.setText("");
  }

}



void draw(){
  if (agc==true){
   if (readingsAll[199]*Volume>150){AGC= AGC-.001;}
   else{AGC=AGC+.00005;}
   if (AGC>2){AGC=2;}
   //println(readingsAll[199]*Volume);
   //println(height- (readingsAll[199]));
   //println (AGC);
  }else{AGC=1;}
  
  time = millis();
  milidif=time-mydelay;
myFFT.forward(myInput.mix);
    
  if (h==1){
    RenderEnergy();
  if (Wave==true){
    RenderAll();
    RenderAll2();
   BarAll();
  }else {
    readingsAll[199]=0;
    readingsAll2[49]=0;
}
  if (Wave1==true){
    Render1();
    Render12();
  }else {
    readings1[199]=0;
    readings12[49]=0;
}
  if (Wave2==true){
    Render2();
    Render22();
  }else {
    readings2[199]=0;
    readings22[49]=0;
}
  if (Wave3==true){
    Render3();
    Render32();
  }else {
    readings3[199]=0;
    readings32[49]=0;
}

}
 h++;
  if (h>=Speed){ h=1;}
   a();
  b();
  c();
 
  Beat();
 //RenderEnergy();
  if (Auto==true){
   getavgAll();
   getavg1();
   getavg2();
   getavg3();
   getavgAll2();
   getavg12();
   getavg22();
   getavg32();
 }else{
   avg22=avg2;
  avg12=avg1;
  avg32=avg3;
  avgAll2=avgAll;
 }
  
if (Draw== true){
 background(0);
if (g>0){g= g-1;}
if (g<0){g=0;}

  if(ctid == 5) {
     for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}
    stroke(150,150,0);
  line(20,height-avgAll,width,height-avgAll);
  line(20,height-avgAll2,width,height-avgAll2);
  noFill();
  stroke(255,255,0);
    beginShape();
     for(int t = 0; t < numReadingsAll-1 ; t++){
      vertex(t*2,height- (readingsAll[t+1])*Volume);
}
endShape();
noFill();
  
    
    



fill (150,150,0);
rect (390,0,9,AGC*100);
rect (390,100,9,readingsAll[199]-readingsAll[199-Energy]);
noFill();
  } else if (ctid==6) {
    for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}
   stroke(150,0,0);
  //line(20,height-avg1,width,height-avg1);
  //line(20,height-avg12,width,height-avg12);
  noFill(); 
     stroke(255,255,255);
      beginShape();
      for(int t = 0; t < numReadingsEnergy-1 ; t++){
     vertex(t*2,height- (readingsEnergy[t+1])*Volume);
  }
 endShape();
fill (150,150,0);
 rect (390,0,9,AGC*100);
rect (390,100,9,readingsEnergy[199]-readingsEnergy[199-Energy]);
noFill();
  } 
  else if (ctid==2) {
    for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}
   stroke(150,0,0);
  line(20,height-avg1,width,height-avg1);
  line(20,height-avg12,width,height-avg12);
  noFill(); 
     stroke(255,0,0);
      beginShape();
      for(int t = 0; t < numReadings1-1 ; t++){
     vertex(t*2,height- (readings1[t+1])*Volume);
  }
 endShape();
fill (150,0,0);
 rect (390,0,9,AGC*100);
rect (390,100,9,readings1[199]-readings1[199-Energy]);
noFill();
  } else if (ctid==3) {
    for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}
    stroke(0,150,0);
  line(20,height-avg2,width,height-avg2);
  line(20,height-avg22,width,height-avg22);
  noFill(); 
      stroke(0,255,0);
      beginShape();
      for(int t = 0; t < numReadings2-1 ; t++){
        vertex(t*2,height- (readings2[t+1])*Volume);
  }
 endShape();
fill (0,150,0);
 rect (390,0,9,AGC*100);
rect (390,100,9,readings2[199]-readings2[199-Energy]);
noFill();
} else if (ctid==4) {
  for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}
 stroke(0,0,150);
  line(20,height-avg3,width,height-avg3);
  line(20,height-avg32,width,height-avg32);
  noFill(); 
      stroke(0,0,255);
      beginShape();
      for(int t = 0; t < numReadings3-1 ; t++){
       vertex(t*2,height- (readings3[t+1])*Volume);
  }
 endShape();
fill (0,0,150);
 rect (390,0,9,AGC*100);
rect (390,100,9,readings3[199]-readings3[199-Energy]);
noFill();
}else if (ctid==1) {
  for(int t = 0; t < numReadingsBarAll-1 ; t++){
       stroke(readingsBarAll[t],readingsBarAll[t],readingsBarAll[t]);
      line(t*2,0,t*2,200);
}

  stroke (128,0,0);
  fill(0,128,0);
  for(int i = 0; i < myFFT.avgSize(); i++)
  {
    rect(i*20, height, 19, height - myFFT.getAvg(i)*4);
    
  }
  
noFill();
fill(128,0,128);
rect (390,0,9,AGC*100);
noFill();
fill (128,0,128);
rect (390,100,9,readingsAll[199]-readingsAll[199-Energy]);
noFill();


 }
}
 dirAll = readingsAll[199]-readingsAll[199-Energy];
  dir1 = readings1[199]-readings1[199-Energy];
   dir2 = readings2[199]-readings2[199-Energy];
    dir3 = readings3[199]-readings3[199-Energy];
//println(Energy);
}


 

void a(){
  float k = map(myFFT.getAvg(Band-1), -200, 100, 0, 2);
  a= (pow(k, Power))*AGC;

}
void b(){
 float n = map(myFFT.getAvg(Band+1), -200, 100, 0, 2);
  b= (pow(n, Power))*AGC;

}
void c(){
  float m = map(myFFT.getAvg(Band+3), -200, 100, 0, 2);
  c= (pow(m, Power))*AGC;

} 


void Beat(){
  
 if(((c*Volume)>(avg32))&&((c*Volume)>(avg3))&&(get3==true)&&(beat==false)&&(milidif>(60000/MaxBPM))&&(dir3>minVol/2))
 {g=100;beat =true;mydelay=time;
 if (MIDI==true){
 myBus.sendNoteOn(Bank-1, Pitch, Velocity);
 delay(DelayOn);
    myBus.sendNoteOff(Bank-1, Pitch, Velocity);
 }
 
 OSC();
 
    
  } 
  else  if (((b*Volume)>(avg22))&&((b*Volume)>(avg2))&&(get2==true)&&(beat==false)&&(milidif>(60000/MaxBPM))&&(dir2>minVol/2))
{g=100;beat=true;mydelay=time;
if (MIDI==true){
myBus.sendNoteOn(Bank-1, Pitch, Velocity);
delay(DelayOn);
    myBus.sendNoteOff(Bank-1, Pitch, Velocity);
}  
OSC();

    
  }
   else if (((a*Volume)>(avg12))&&((a*Volume)>(avg1))&&(get1==true)&&(beat==false)&&(milidif>(60000/MaxBPM))&&(dir1>minVol/2))
 {g=100;beat=true;mydelay=time;
 if (MIDI==true){
 myBus.sendNoteOn(Bank-1, Pitch, Velocity);
 delay(DelayOn);
    myBus.sendNoteOff(Bank-1, Pitch, Velocity);
 }  
 OSC();
 
    }
    else if ((((a+b+c)/3*Volume)>(avgAll2))&&(((a+b+c)/3*Volume)>(avgAll))&&(getAll==true)&&(beat==false)&&(milidif>(60000/MaxBPM))&&(dirAll>minVol/2))
  {g=100;beat=true;mydelay=time;
if (MIDI==true){
myBus.sendNoteOn(Bank-1, Pitch, Velocity);
delay(DelayOn);
    myBus.sendNoteOff(Bank-1, Pitch, Velocity);
} 
OSC();

    }
   else {beat=false;}
 }

public void OSC(){
  if (osc==true){
OscMessage myOscMessage = new OscMessage(OSCMessage);
  
  myOscMessage.add(OSC_VALUE);

  oscP5.send(myOscMessage, myBroadcastLocation);
}}
   
void RenderEnergy(){
 totalEnergy= totalEnergy- readingsEnergy[0] + readingsEnergy[199];
    readingsEnergy[199] = dirAll;
  for(int z = 0; z < numReadingsEnergy-1 ; z++){
  readingsEnergy[z]=readingsEnergy[z+1];
}
}   
void BarAll(){
  totalBarAll= totalBarAll- readingsBarAll[0] + readingsBarAll[199]; 
  readingsBarAll[199] = g; 
  for(int z = 0; z < numReadingsBarAll-1 ; z++){
  readingsBarAll[z]=readingsBarAll[z+1];}
}
void RenderAll(){
 
  
  totalAll= totalAll- readingsAll[0] + readingsAll[199]; 
  readingsAll[199] = (a+b+c)/3; 
  for(int z = 0; z < numReadingsAll-1 ; z++){
  readingsAll[z]=readingsAll[z+1];}

}
void RenderAll2(){

  
  totalAll2= totalAll2 - readingsAll2[0] + readingsAll2[49]; 
  readingsAll2[49] = (a+b+c)/3; 
  for(int z = 0; z < numReadingsAll2-1 ; z++){
  readingsAll2[z]=readingsAll2[z+1];}
  
}

void Render1(){
 
  
  total1= total1- readings1[0] + readings1[199]; 
  readings1[199] = a; 
  for(int z = 0; z < numReadings1-1 ; z++){
  readings1[z]=readings1[z+1];}
   
   
}
void Render12(){

  
  total12= total12- readings12[0] + readings12[49]; 
  readings12[49] = a; 
  for(int z = 0; z < numReadings12-1 ; z++){
  readings12[z]=readings12[z+1];}
  
   
}
 void Render2(){
 
  
  total2= total2  - readings2[0]+ readings2[199]; 
  readings2[199] = b; 
  for(int z = 0; z < numReadings2-1 ; z++){
  readings2[z]=readings2[z+1];}
  
     
}      
void Render22(){

  
  total22= total22 - readings22[0] + readings22[49]; 
  readings22[49] = b; 
  for(int z = 0; z < numReadings22-1 ; z++){
  readings22[z]=readings22[z+1];}
   
     
}             
void Render3(){
   
  
  total3= total3 - readings3[0]+ readings3[199]; 
readings3[199] = c;   
  for(int z = 0; z < numReadings3-1 ; z++){
  readings3[z]=readings3[z+1];}
  
     
} 
void Render32(){
  
  
  total32= total32- readings32[0] + readings32[49]; 
readings32[49] = c;   
  for(int z = 0; z < numReadings32-1 ; z++){
  readings32[z]=readings32[z+1];}
   
     
} 
void getavgAll(){
  avgAll = totalAll / numReadingsAll*2*Volume;  
if (avgAll<minVol){avgAll=minVol;}  

}
void getavgAll2(){
  avgAll2 = totalAll2 / numReadingsAll2*2.2*Volume;  
if (avgAll2<minVol){avgAll2=minVol;}  

}
void getavg1(){ 
  avg1 = total1 / numReadings1*2*Volume; 
if (avg1<minVol){avg1=minVol;}  

} 
void getavg12(){ 
  avg12 = total12 / numReadings12*2.2*Volume; 
if (avg12<minVol){avg12=minVol;}  

} 
void getavg2(){
  avg2 = total2 / numReadings2*2*Volume;  
if (avg2<minVol){avg2=minVol;}

}
void getavg22(){
  avg22 = total22 / numReadings22*2.2*Volume;  
if (avg22<minVol){avg22=minVol;}

}
void getavg3(){
  avg3 = (total3 / numReadings3*2*Volume);
  if (avg3<minVol){avg3=minVol;}

}
void getavg32(){
  avg32 = (total32 / numReadings32*2.2*Volume);
  if (avg32<minVol){avg32=minVol;}

}

 void stop(){
  myInput.close();
  minim.stop();
  super.stop();
}


