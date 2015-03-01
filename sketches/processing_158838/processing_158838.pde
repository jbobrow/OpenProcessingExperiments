
import g4p_controls.*;

GImageToggleButton btnToggle, start;
GLabel label, label2, loutlet, lsetpoint, lbias, lpb, linl;
GCustomSlider sdr1, sdr2, sdr3, sdr4, sdr5;
Sliders outlet, setpoint, Sbias, pb, inl;
Tank myTank;
Controller CT;
ControlValve CV;
LevelTrans LT;
disp D;
graph wl, sp, CTout;
EA e;
queue q;
float [] level;
float X=420, Y=120, Z=255;
int tick=0;
int QL=50;
boolean run=true;

void setup()
{
  size(1146, 800 );  
  frameRate(200);

  sdr1 = new GCustomSlider(this, X+420, Y+180, 150, 70, "grey_blue");
  sdr2 = new GCustomSlider(this, X+490, Y+180, 150, 70, "grey_blue");
  sdr3 = new GCustomSlider(this, X+560, Y+180, 150, 70, "grey_blue");
  sdr4 = new GCustomSlider(this, X+630, Y+180, 150, 70, "grey_blue");
  sdr5 = new GCustomSlider(this, X+350, Y+180, 150, 70, "grey_blue");

  outlet=new Sliders(sdr1, 0, 50, 0.5, true);
  setpoint=new Sliders(sdr2, 0, 100, 0.750, true);
  Sbias=new Sliders(sdr3, 0, 100, 0, true);
  pb=new Sliders(sdr4, 1, 100, 0.50, true);
  inl=new Sliders(sdr5, 0, 100, 0.5, false);

  myTank=new Tank(X, Y, Z);
  CT=new Controller();
  CV=new ControlValve();
  LT=new LevelTrans();
  e=new EA();
  D=new disp(X, Y);
  CTout=new graph(X, Y, 32, 152, 31);
  wl=new graph(X, Y, 0, 0, 255);
  sp=new graph(X, Y, 255, 0, 0);
  q=new queue(QL);

  start=new GImageToggleButton(this, X+650, Y+230);
  btnToggle = new GImageToggleButton(this, X+570, Y+230);

  loutlet= new GLabel(this, X+430, Y+180, 50, 30);
  lsetpoint= new GLabel(this, X+500, Y+180, 50, 30);
  lbias= new GLabel(this, X+570, Y+180, 50, 30);
  lpb= new GLabel(this, X+640, Y+180, 50, 30);
  linl= new GLabel(this, X+360, Y+180, 50, 30);
  label = new GLabel(this, X+570, Y+280, 50, 30);
  label2=new GLabel(this, X+650, Y+280, 50, 30);

  label.setText("Auto"); 
  label2.setText("Run");
  loutlet.setText("Bleed");
  lsetpoint.setText("SetPoint");
  lbias.setText("Bias");
  lpb.setText("PB");

  textFont(createFont("Times New Roman", 36));

  //display
  //background(Z);
  background(246, 255, 209);
  // to draw grid 
  noFill();
  smooth();
  // scan lines
  stroke(111, 20);
  strokeWeight(1 );
  for ( float xx = 0; xx < (width+height); xx+=10) 
  {
    line( 0, xx, width, xx );
    line( xx, 0, xx, height);
  }
  // end of grid
  stroke(0);
  textAlign(CENTER);
  textSize(36);
  text("Level Control Loop using Proportional only Controller", width/2, 40);
  textAlign(LEFT); 
  stroke(0);
  strokeWeight(10);                         // to print outer big boxes
  line(0, 0, 1146, 0);
  line(1146, 0, 1146, 800);
  line(1146, 800, 0, 800);
  line(0, 800, 0, 0);
  strokeWeight(3);
  line(X-350, Y+320, X-350, Y+620);
  line(X-350, Y+620, X+650, Y+620);
  strokeWeight(2);
  line(0, 775, 1146, 775);
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(15);
  textAlign(LEFT);
  stroke(0);
  strokeWeight(5);
  line(0, Y+305, 1146, Y+305);
  myTank.display();
  LT.showLevelTrans(X, Y);
  CT.showController(X, Y);
  e.showEA(X, Y);
  CV.displayControlValve(X, Y);
  D.showDisp();
}
void draw()
{  
  if (run)
  {
    float waterLevel, WL_mA, inlet_mA, inlet, outpsi;

    waterLevel=myTank.calcLevel();
    WL_mA=LT.calcOutput(waterLevel);
    inlet_mA=CT.calcOutmA(WL_mA);
    outpsi=e.calcEAOut(inlet_mA);
    inlet=CV.calcOutputFlow(outpsi);
    if (tick<QL)      //inserting delay for 20 ticks
    {
      q.addele(inlet);
    }
    else
    {

      myTank.setInlet(q.removeele());
      q.addele(inlet);
    }
    D.getPara(waterLevel, CT.getSP(), inlet_mA, CT.getDiff_mA());

    //display
    //background(Z);
    background(246, 255, 209);
    // to draw grid 
    noFill();
    smooth();
    // scan lines
    stroke(111, 20);
    strokeWeight(1 );
    for ( float xx = 0; xx < (width+height); xx+=10) 
    {
      line( 0, xx, width, xx );
      line( xx, 0, xx, height);
    }
    // end of grid
    stroke(0);
    textAlign(CENTER);
    textSize(36);
    text("Level Control Loop using Proportional only Controller", width/2, 40);
    textAlign(LEFT); 
    stroke(0);
    strokeWeight(10);                         // to print outer big boxes
    line(0, 0, 1146, 0);
    line(1146, 0, 1146, 800);
    line(1146, 800, 0, 800);
    line(0, 800, 0, 0);
    strokeWeight(3);
    line(X-350, Y+320, X-350, Y+620);
    line(X-350, Y+620, X+650, Y+620);
    strokeWeight(2);
    line(0, 775, 1146, 775);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(15);
    textAlign(LEFT);
    stroke(0);
    strokeWeight(5);
    line(0, Y+305, 1146, Y+305);
    myTank.display();
    LT.showLevelTrans(X, Y);
    CT.showController(X, Y);
    e.showEA(X, Y);
    CV.displayControlValve(X, Y);
    D.showDisp();
    CTout.showGraph((inlet_mA-4)*100/16);
    sp.showGraph(CT.getSP());
    wl.showGraph(waterLevel);
    tick++;
  }
}

public void handleSliderEvents(GValueControl slider, GEvent event) 
{ 
  if (slider == sdr1)                                    // for Manual/Auto bleed
  {                                    
    myTank.setOutlet((float)slider.getValueI());
  }
  else if (slider == sdr2 && btnToggle.stateValue()==0)   //  for Auto setpoint
  {
    CT.setSP_percentage((float)slider.getValueI());
  }
  else if (slider==sdr3 && btnToggle.stateValue()==0)    //  for Auto bias
  {
    CT.setBias((float)slider.getValueI());
  }
  else if (slider==sdr4 && btnToggle.stateValue()==0)    //  for Auto PB
  {
    CT.setGain((float)(100/slider.getValueI()));
  }
  else if (slider==sdr5 && btnToggle.stateValue()==1)    // for Manual feed
  {
    myTank.setInlet((float)slider.getValueI());
  }
} 

public void handleToggleButtonEvents(GImageToggleButton button, GEvent event) 
{ 
  if (button==btnToggle && button.stateValue()==0)          // for AUTO mode
  {
    myTank.setOutlet((float)sdr1.getValueI());
    CT.setSP_percentage((float)sdr2.getValueI());
    CT.setBias((float)sdr3.getValueI());
    CT.setGain((float)(100/sdr4.getValueI()));
    sdr5.setVisible(false);
    linl.setText("");
    label.setText("Auto");
  }
  if (button==btnToggle && button.stateValue()==1)        // for MANUAL mode
  { 
    sdr5.setVisible(true);
    linl.setText("Feed");
    myTank.setOutlet((float)sdr1.getValueI());
    myTank.setInlet((float)sdr5.getValueI());
    label.setText("Manual");
  }
  if (button==start)                                    // to START or STOP
  {
    run=!run;
    if (run)
    {
      label2.setText("Run");
    }
    else
    {
      label2.setText("Pause");
    }
  }
}


class ControlValve
{
  float inlet, CV_inputpercent, outpsi;

  float calcOutputFlow(float d)
  {
    outpsi=d;
    CV_inputpercent=(outpsi-3)*100/12;
    inlet=CV_inputpercent;
    return inlet;
  }

  void displayControlValve(float x, float y)
  {
    stroke(255, 102, 0);
    line(x-215, y+80, x-215, y-40);
    line(x-215, y-40, x-170, y-40);

    stroke(0);
    line(x-180, y-20, x-140, y+10);
    line(x-140, y+10, x-140, y-20);
    line(x-140, y-20, x-180, y+10);
    line(x-180, y+10, x-180, y-20);
    line(x-160, y-30, x-160, y-5);

    line(x-175, y-30, x-145, y-30);
    arc(x-160, y-30, 30, 30, PI, TWO_PI);
    textSize(20);
    text("Control Valve", x-190, y-50);
    textSize(15);
    text("Input: "+nf(outpsi, 1, 2)+" psi ("+nf(CV_inputpercent, 1, 2)+"%)", x-140, y-25);
    text("Output: "+nf(inlet, 1, 2)+"L/sec ("+nf(inlet, 1, 2)+"%)", x-170, y+25);
  }
} 


class Controller
{
  float SP_mA, WL_mA, diff_mA, ouput_mA, gain, bias, SP_percentage;

  Controller()
  { 
    bias=50;
    gain=2;
    SP_percentage=50;
  } 

  void setGain(float x)
  {
    gain=x;
  }

  void setBias(float x)
  {
    bias=x;
  }

  float getSP()
  {
    return SP_percentage;
  }

  void setSP_percentage(float x)
  {
    SP_percentage=x;
  }

  float calcOutmA(float x)
  { 
    WL_mA=x;
    SP_mA=((16*SP_percentage)/100)+4;

    if (btnToggle.stateValue()==0)          //  AUTO Mode
    { 
      diff_mA=SP_mA-WL_mA;
      ouput_mA=diff_mA*gain+(bias*16/100)+4;
    }
    else                                      // Manual Mode
    {
      ouput_mA=(sdr5.getValueI()*16.0/100.0)+4.0;
    }
    ouput_mA=constrain(ouput_mA, 4, 20);
    return ouput_mA;
  }

  float getDiff_mA()
  {
    return diff_mA;
  }

  void showController(float x, float y)
  {
    line(x-205, y+240, x-165, y+210);
    line(x-165, y+210, x-165, y+270);
    line(x-165, y+270, x-205, y+240);

    line(x-165, y+250, x+115, y+250);
    line(x-165, y+230, x-85, y+230);


    textSize(20);
    text("Controller", x-210, y+295);
    textSize(15);
    text("Set Point", x-110, y+225);
    text(":"+nf(SP_mA, 1, 2)+"mA ("+nf(SP_percentage, 1, 2)+" %)", x-55, y+225);
    text("Input", x-110, y+265);
    text(":"+nf(WL_mA, 1, 2)+" mA ("+nf((WL_mA-4)/16*100, 1, 2)+" %)", x-55, y+265);
    text("Error", x-210, y+205);
    text(":"+nf(diff_mA, 1, 2), x-170, y+205);
    text("Output", x-210, y+190);
    text(":"+nf(ouput_mA, 1, 2)+"mA ("+nf((ouput_mA-4)*100/16, 1, 2)+"%)", x-170, y+190);
  }
}


class EA
{
  float inputmA, out_psi;

  void showEA(float x, float y)
  {
    line(x-205, y+240, x-215, y+240);
    line(x-215, y+240, x-215, y+120);

    ellipse(x-215, y+100, 40, 40);
    line(x-230, y+85, x-200, y+115);
    line(x-200, y+85, x-230, y+115);
    stroke(255, 102, 0);
    line(x-195, y+100, x-135, y+100);
    stroke(0);
    text("20 psi", x-130, y+105);
    text("Input:"+nf(inputmA, 1, 2)+"mA ("+nf((inputmA-4)*100/16, 1, 2)+"%)", x-210, y+135);
    text("Output: "+nf(out_psi, 1, 2)+" psi ("+nf((out_psi-3)*100/12, 1, 2)+"%)", x-210, y+80);
    textSize(14);
    text("E", x-218, y+117);
    text("A", x-218, y+92);
  }

  float calcEAOut(float x)
  {
    inputmA=x;
    out_psi=(inputmA-4)*12.0/16.0+3;
    return out_psi;
  }
}  


class LevelTrans
{
  float WL_mA, waterLevel;

  LevelTrans()
  {
    WL_mA=0;
  }

  float calcOutput(float x)
  {
    waterLevel=x;
    WL_mA=((16*waterLevel)/100)+4;
    return WL_mA;
  }

  void showLevelTrans(float x, float y)
  { 
    noFill();
    stroke(0);
    strokeWeight(2);
    line(x+130, y+200, x+130, y+235);
    ellipse(x+130, y+250, 30, 30);
    textSize(20);
    text("LT", x+120, y+257);
    text("Level Transmitter", x+70, y+290);
    textSize(15);
    text("Level: "+nf(waterLevel, 1, 2)+"m ("+nf(waterLevel, 1, 2)+" %FT)", x+135, y+225);
  }
}


class Sliders
{ 
  Sliders(GCustomSlider x, int l, int h, float value, boolean b)
  { 
    x.setLocalColorScheme(6); 
    x.setOpaque(false); 
    x.setValue(value); 
    x.setNbrTicks(2); 
    x.setLimits(l, h);
    x.setShowLimits(true); 
    x.setShowValue(true); 
    x.setShowTicks(true); 
    x.setStickToTicks(false); 
    x.setEasing(1.0); 
    x.setRotation(4.712389); 
    x.setTextOrientation(G4P.ORIENT_RIGHT);
    x.setVisible(b);
  }
}


class Tank
{ 
  float x, y, z;
  float waterLevel, tank_hgt, inlet, outlet, volume;
  final static float k=PI*5*5;

  Tank(float X, float Y, float Z)
  { 
    x=X;
    y=Y;
    z=Z;
    waterLevel=0;
    volume=k*waterLevel;
    outlet=sdr1.getValueI();
    inlet=0;
  }

  void setInlet(float in)
  {
    inlet=in;
  }

  void setOutlet(float out)
  {

    outlet= out;
  }

  float getWaterLevel()
  { 
    return waterLevel;
  }

  void display()
  { 
    stroke(0);
    strokeWeight(2);
    line(x+80, y, x+80, y+200);
    line(x+80, y+200, x+180, y+200);
    line(x+180, y+200, x+180, y);

    if (inlet==0)
    {
      fill(255);
    }
    else
    {
      fill(139, 244, 255);
    }
    rect(x-140, y-10, 220, 10);
    if (outlet==0)
    {
      fill(255);
    }
    else
    {
      fill(139, 244, 255);
    }
    rect(x+180, y+190, 90, 10);
    fill(139, 244, 255);
    rect(x+80, y-2*waterLevel+200, 100, 2*waterLevel);
    fill(0);
    strokeWeight(2);
    line(x+75, y, x+20, y);
    line(x+75, y+100, x+80, y+100);
    line(x+75, y+200, x+80, y+200);
    line(x+75, y+150, x+80, y+150);
    line(x+75, y+50, x+80, y+50);
    textSize(15);
    text("0", x+65, y+205);
    text("25", x+60, y+155);
    text("50", x+60, y+105);
    text("75", x+60, y+55);
    text("100", x+57, y+12);
    textSize(20);
    text("Tank", x+245, y+90);
    textSize(15);
    text("Bleed", x+200, y+110);
    text(":"+nf(outlet, 1, 2)+" L/sec\n", x+245, y+110);
    text("Feed", x+200, y+130);
    text(":"+nf(inlet, 1, 2)+" L/sec\n", x+245, y+130);
    text("Volume", x+200, y+150);
    text(":"+nf(volume, 1, 2)+" Liters\n", x+245, y+150);
    text("Level", x+200, y+170);
    text(":"+nf(waterLevel, 1, 2)+" m\n", x+245, y+170);
  }

  float calcLevel()
  { 
    volume=volume+inlet-outlet;
    volume=constrain(volume, 0, 100*k);
    waterLevel=volume/k;     //+noise(tick);
    return waterLevel;
  }
}


class disp
{
  float x, y, waterLevel, SP_percent, CT_mA, diff_mA;

  disp(float X, float Y)
  {
    x=X;
    y=Y;
    waterLevel=50;
    SP_percent=50;
    CT_mA=12;
    diff_mA=0;
  }

  void showDisp()
  {
    noFill();
    rect(x-390, y-20, 120, 260);
    stroke(255, 0, 0);
    line(x-366, y, x-366, y+200);
    stroke(0);
    line(x-342, y, x-342, y+200);
    stroke(32, 152, 31);
    line(x-318, y, x-318, y+200);
    stroke(0, 0, 255);
    line(x-294, y, x-294, y+200);
    strokeWeight(5);
    stroke(0);
    line(x-362, y+200-2*SP_percent, x-370, y+200-2*SP_percent);
    line(x-338, y+200-2*((abs(diff_mA))/16*100), x-346, y+200-2*((abs(diff_mA))/16*100));
    line(x-322, y+200-2*((CT_mA-4)*100/16), x-314, y+200-2*((CT_mA-4)*100/16));
    line(x-290, y+200-2*waterLevel, x-298, y+200-2*waterLevel);
    strokeWeight(3);
    line(x-395, y, x-385, y);
    line(x-395, y+200, x-385, y+200);
    line(x-395, y+100, x-385, y+100);
    strokeWeight(2);

    textSize(15);
    text("100", x-415, y+5);
    text("0", x-405, y+205);
    text("50", x-410, y+105);
    textSize(11);
    text("SP", x-375, y+225);
    text("Error", x-360, y+225);
    text("Output", x-333, y+225);
    text("Level", x-300, y+225);
  }

  void getPara(float x, float y, float z, float w)
  {
    diff_mA=w;
    waterLevel=x;
    SP_percent=y;
    CT_mA=z;
  }
}


class graph
{ 
  int c, t;
  float x, y, r, g, b;
  FloatList arr;
  IntList time;

  graph(float X, float Y, float p, float q, float w)
  { 
    t=0;
    c=0;
    x=X;
    y=Y;
    r=p;
    g=q;
    b=w;
    arr=new FloatList();
    time=new IntList();

    for (int i=0;i<10;i++)
      time.append((i+1)*100);
  } 

  void showGraph(float p)
  { 
    int i;
    if (arr.size()<1000)
    {
      arr.append(p*3);
      c++;
      for (i=1;i<c;i++)
      {
        stroke(r, g, b);
        strokeWeight(1.5);
        line(x-350+i, y+620-arr.get(i), x-350+i-1, y+620-arr.get(i-1));
      } 
      for (t=0;t<10;t++)
      {
        textSize(12);
        text(time.get(t), x-360+(t+1)*100, y+640);
        stroke(0);
        strokeWeight(2);
        line(x-350+(t+1)*100, y+620, x-350+(t+1)*100, y+625);
      }
    } 
    else
    { 
      arr.remove(0);
      arr.append(p*3);
      for (i=1;i<1000;i++)
      {
        stroke(r, g, b);
        strokeWeight(1.5);
        line(x-350+i, y+620-arr.get(i), x-350+i-1, y+620-arr.get(i-1));
      }
      if (tick%100==0 && tick>1000)
      {
        time.remove(0);
        time.append(tick);
      } 
      for (t=0;t<10;t++)
      {
        textSize(12);
        text(time.get(9-t), x+640-(tick%100)-(t*100), y+640);
        stroke(0);
        strokeWeight(2);
        line(x+650-(tick%100)-(t*100), y+620, x+650-(tick%100)-(t*100), y+625);
      }
    }
    strokeWeight(2);
    stroke(0);
    line(x-355, y+620, x-350, y+620);
    line(x-355, y+320, x-350, y+320);
    line(x-355, y+470, x-350, y+470);
    line(x-355, y+395, x-350, y+395);
    line(x-355, y+545, x-350, y+545);
    textSize(15);
    text("0", x-365, y+625);
    text("25", x-370, y+550);
    text("50", x-370, y+475);
    text("75", x-370, y+400);
    text("100", x-375, y+325);
    text("(sec)", x+670, y+640);
    text("(%)", x-400, y+325);
  }
}


class queue
{
  int l, rear;
  float []arr;
  queue(int x)
  {
    l=x;
    rear=0;
    arr=new float[l];
  }
  void addele(float x)
  {

    arr[rear++]=x;
  }

  float removeele()
  {
    float x;
    x=arr[0];

    for (int i=0;i<rear-1;i++)
      arr[i]=arr[i+1];
    rear--;
    return x;
  } 
  void show()
  {
    for (int i=0;i<l;i++)
    {
      print(arr[i]+"   ");
    }
    println("   tail="+rear);
  }
} 

