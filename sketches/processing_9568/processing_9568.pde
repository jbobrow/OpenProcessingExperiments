
import controlP5.*;
ControlP5 controlP5,el; 
public float Falloff=0.5,Gain,Length=0.002,Speed=0.001,Distance=0.3;
public int Divide,Stroke=180,Blue=200,Green=200,Opaque=70,Octave=4, Position,Number=2;
public boolean Fill=true;
private float t=0, j=0;

void setup() {
        size(800,400);
        frameRate(60);
        noiseDetail(Octave,Falloff);
        smooth();
        Divide=1;
        Position=height/2;
        Gain=height*2;
        
        controlP5 = new ControlP5(this);
        el = new ControlP5(this);
        
        controlP5.setColorLabel(0);
        controlP5.setColorForeground(color(240,180,0));
        controlP5.setColorBackground(205);
        controlP5.setColorActive(color(255,230,50));
        controlP5.setColorValue(color(100));
        el.setColorLabel(100);
        el.setColorForeground(color(0,180,180));
        el.setColorBackground(205);
        el.setColorActive(255);
        el.setColorValue(color(100));
        controlP5.addSlider("Stroke",0,255,width-140,height-22,100,12);
        controlP5.addSlider("Green",0,255,width-140,height-42,100,12);
        controlP5.addSlider("Blue",0,255,width-140,height-62,100,12);
        controlP5.addSlider("Opaque",0,255,width-140,height-82,100,12);
        controlP5.addToggle("Fill",width-170,height-82,12,12);
        controlP5.addSlider("Octave",0,9,200,height-120,12,100);
        controlP5.addSlider("Falloff",0,0.99,240,height-120,12,100);
        el.addSlider("Position",-height/2,height*3,280,height-120,12,100);
        el.addKnob("Gain",1,height*3,width-70,20,50);
        el.addKnob("Length",0,0.005,width-70,90,50);
        el.addKnob("Speed",0,0.006,width-70,160,50);
        el.addKnob("Distance",0,0.4,10,height-210,80);

        el.addSlider("Number",1,10,10,height-40,120,20);
        Slider s1 = (Slider)el.controller("Number");
        s1.setNumberOfTickMarks(10);
        s1.setSliderMode(Slider.FLEXIBLE);

        el.addSlider("Divide",1,width/2,10,height-100,120,40);
        Slider s2 = (Slider)controlP5.controller("Octave");
        s2.setNumberOfTickMarks(10);
        s2.setSliderMode(Slider.FLEXIBLE);
}
 
void draw() {
        background(255);
        if(Fill){fill(0,Green,Blue,Opaque);}
                 else{noFill();}
        stroke(0,Stroke,Stroke);

        for (int i = 1 ; i <=Number ; ++i){
           beginShape();
           for (float x =-Divide; x <= width+Divide; x += Divide) {
             vertex(x, Gain*noise( x*Length + t*0.618 , t + i*Distance ) - Position );
           }
           vertex(width,height);
           vertex(0,height);
           endShape();
           t = t + tan(noise(j)*PI/2)*Speed;
           j=j+0.003;
        }
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
   if(theEvent.controller().name()=="Octave"
    || theEvent.controller().name()=="Falloff")
    { Octave=int(theEvent.controller().value());
      noiseDetail(Octave,Falloff);
    }
  }
}

  

