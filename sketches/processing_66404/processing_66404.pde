
//The Drop Class
class Drop { 

  Glide gainGlide;
  
  public WavePlayer wp = null;
  public Envelope e = null;
  public Gain gn = null;
  
  PVector loc; //Location  

  int keyPosition;
  int dropSize;
  int r;
  int g;
  int b;
  
  //The distance from the wave origin
  int farOut1 = 1;
  int farOut2 = 1;
  int farOut3 = 1; 
  float transp1 = 255;
  float transp2 = 255;
  float transp3 = 255;
  float dDropGain;
  
  int dropDia;
  int dropOccurance;
  
  float dropX;
  float dropY;
  float transpMult;
  
  boolean transparencyOn = true;
  
  
  Drop(float tempX, float tempY, float _dropGain) {
    //println(millis());
    dDropGain = _dropGain;
    
    r = int(random(0, 100));
    g = int(random(100, 200));
    b = int(random(50, 255));
    
    dropX = tempX;
    dropY = tempY;
    
    loc = new PVector(); //Initialize the Location PVector      
    loc.x = dropX;
    loc.y = dropY;
    
    this.transparencyOn = transparencyOn;
    
    gainGlide = new Glide(ac, 0.0, 40);
    
    int duration = 0;
    if(duration == 0){
      transpMult = 1;
      dropDia = 30;
      dropOccurance = 8;
    }else if(duration == 2){
      transpMult = 0.01;
      dropDia = 60;
      dropOccurance = 8;
    }else{
      transpMult = 100;
      dropDia = 20;
      dropOccurance = 6;
    }
    
    synth();
  }
  
  void update() {
    farOut1++; //Increase the distance out
    if (transparencyOn && farOut1 >= dropDia && transp1 > 0) { 
      transp1 -= (9 * transpMult);
    }
    if (transparencyOn && farOut2 >= dropDia && transp2 > 0) { 
      transp2 -= (6 * transpMult);
    }
    if (transparencyOn && farOut3 >= dropDia && transp3 > 0) { 
      transp3 -= (3 * transpMult);
      if(transp3 <0){
        transp3 = 0;
        destroy();
      }
    }
    
    float glideValue = (((transp3/255) * (transp3/255))*0.3)*dDropGain;
    gainGlide.setValue(glideValue);
  }
  
  void display() {
    strokeWeight(1);
    stroke(r, g, b, transp1);
    noFill();
    ellipse(loc.x, loc.y, farOut1, farOut1);
    
    if(farOut1 > dropOccurance){
      farOut2++;
      strokeWeight(1);
      stroke(r, g, b, transp2);
      noFill();
      ellipse(loc.x, loc.y, farOut2, farOut2);
    }
 
    if(farOut2 > 2*dropOccurance){
      farOut3++;
      strokeWeight(1);
      stroke(r, g, b, transp3);
      noFill();
      ellipse(loc.x, loc.y, farOut3, farOut3);
    }
  }

  // destroy the component beads so that they can be cleaned up by the java virtual machine
  void destroy(){
    wp = null;
    e = null;
    gn = null;
  }
  
   void synth(){
    wp = new WavePlayer(ac, frequency, Buffer.SINE);
    gn = new Gain(ac, 1, gainGlide);
    gn.addInput(wp); // connect the WavePlayer to the Gain
    MasterGain.addInput(gn); // connect the Gain to the Master Gain
  }
}


