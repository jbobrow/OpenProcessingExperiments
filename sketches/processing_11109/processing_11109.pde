
//Annie's attempt at background color change

import controlP5.*;

public ControlP5 controlP5;

public PImage AM, TV, FM, cellphone, microwave, radar2, IR1, IR2, V1, V2, UV1, UV2, Xray1, Gamma1, Gamma2;

//PFont font;
PFont Arial15;
PFont Arial10;
PFont Arial45;

public float a = 0.0;
public float wavelength = 50.0;
public float wavelength1;
public float amp = 150.0;  //amplitude of the sine wave

public int redcolor = 0;
public int saturate =99;
public int backboard = 99;
public int y_pos;

void setup (){
  
  size(900, 800);  //size declaration width, height
  y_pos = height- 300;
  
  controlP5 = new ControlP5(this);//creates GUI object (slider)
  //controlP5.addSlider("amp", 0, 100, 50, (width/2)-100,375,200,16);
  controlP5.addSlider("wavelength", 0,1190, 0, 50, 300, 790, 10);
  
  Arial15 = loadFont("ArialMT-15.vlw"); //ruler numbers
  textFont(Arial15);
  Arial10 = loadFont("ArialMT-10.vlw"); //ruler exponents
  textFont(Arial10);
  Arial45 = loadFont("ArialMT-30.vlw"); //heading
  textFont(Arial45);



  readin_img();


  
} //end setup



void draw(){
  
  wavelength1 = wavelength-1250;
  float inc = TWO_PI/wavelength1;  //determine the wavelength of the sine wave
  
    if(wavelength<800 && wavelength>670){ //varies the color of the wavelength w/in the visble spectrum
   redcolor = int(wavelength - 700.0); 
   backboard = 99;
    
  } else {
    redcolor = 0;
    backboard = 0;
  }
  
  saturate = 99;
  
  if(wavelength<1200 && wavelength>800){//causes color of wave outside of visible spectrum to appear gray
    saturate = 0;
    backboard =0;
  }
 
  if(wavelength<670 && wavelength>0){
    saturate = 0;
    backboard = 0;
  } 
  
  colorMode (HSB, 125,100,100);
  background (redcolor, saturate, backboard);// wtih the line here, the screen refreshes itself every frame
  
  //  colorMode (RGB);
   stroke (0,0,99);
    strokeWeight (5);//ruler
    line(50, 300, 850, 300);// ruler
    stroke (0,0,99);
    strokeWeight (3.0); // hash marks 700 (length of line)/8 = increments of 87.5 (88)
    
    for (int i = 0; i < 17; i = i+1){
      line(48+i*50, 285, 48+i*50, 315);//first mark
    
    textFont(Arial15);
     fill (0,0,99);
      text("10", 40+i*50, 280);//ruler values 

    textFont(Arial10);
     fill (0,0,99);
      text(3-i, 58+i*50, 275);//ruler exponents 
      
     textFont(Arial45);
     fill (0,0,99);
      text("Wavelengths of the Electromagnetic Spectrum", width/6, 40 );//heading
}

    //fill(0);
    //text("10", 40+i*88, 280);//ruler exponents 
        

    
  
  stroke (0, 0, 99);// stroke of wave
  strokeWeight (5); //Thicker
  noFill ();
  
  beginShape();//creates sin wave
  for (int i=0;i<width; i++)
  { //defines the position of the vertex that gets linked up to become a sine wave
  curveVertex (i, (0+300)+sin(inc*i-a)*amp);
  } 
  endShape ();
  
  a=a+inc; //this shifts the curve by inc at the next frame, giving the curve the moving effect
  
  load_img();
  
}  //end draw() 

public void readin_img(){
  
    //Images must be in the "data" directory to load correctly
  AM = loadImage("radiotower.jpg");
  TV = loadImage("tv2.jpg");
  FM = loadImage("radio.jpg");
  cellphone= loadImage("cellphone.jpg");
  microwave = loadImage("microwave.jpg");
  radar2= loadImage("radar.jpg");
  //radar3= loadImage();
  IR1= loadImage("treeIR.jpg");
  IR2= loadImage("ir_man.jpg");
  V1= loadImage("lightbulb.jpg");
  V2= loadImage("humaneye.jpg");
  UV1= loadImage("sun5.jpg");
  UV2= loadImage("UV5.jpg");
  Xray1= loadImage("xray3.jpg");
  Gamma1= loadImage("gamma.jpg");
  Gamma2= loadImage("radioactive.jpg");
  
}
 
public void load_img(){
  
  if(wavelength<110 && wavelength>1){//causes images to show up in their correct wavelength range
    image (AM, 30, y_pos,120,120);
  }
    if(wavelength<180 && wavelength>110){//causes images to show up in their correct wavelength range
    image (TV, 90, y_pos,120,120);
  }
   if(wavelength<250 && wavelength>180){//causes images to show up in their correct wavelength range
    image (FM, 160, y_pos,120,120);
  }
     if(wavelength<330 && wavelength>250){//causes images to show up in their correct wavelength range
    image (cellphone, 230, y_pos,120,120);
  }
     if(wavelength<410 && wavelength>330){//causes images to show up in their correct wavelength range
    image (microwave, 300, y_pos,120,120);
  }
     if(wavelength<500 && wavelength>410){//causes images to show up in their correct wavelength range
    image (radar2, 390, y_pos,120,120);
  }
     if(wavelength<590 && wavelength>500){//causes images to show up in their correct wavelength range
    image (IR1, 470, y_pos,120,120);
  }
     if(wavelength<670 && wavelength>590){//causes images to show up in their correct wavelength range
    image (IR2, 520, y_pos,120,120);
  }
  //   if(wavelength<800 && wavelength>670){//causes images to show up in their correct wavelength range
    //image (V1, 670, y_pos,180,180);
  //}
  if(wavelength<800 && wavelength>670){//causes images to show up in their correct wavelength range
  image (V2, 600, y_pos,120,130);
  }
   //  if(wavelength<830 && wavelength>800){//causes images to show up in their correct wavelength range
   // image (UV1, 800, y_pos,180,180);
 // }
     if(wavelength<890 && wavelength>800){//causes images to show up in their correct wavelength range
    image (UV2, 700, y_pos,120,120);
  }
     if(wavelength<960 && wavelength>890){//causes images to show up in their correct wavelength range
    image (Xray1, 750, y_pos,120,120);
  }   
    if(wavelength<1200 && wavelength>960){//causes images to show up in their correct wavelength range
    image (Gamma1, 800, y_pos,120,120);
  }  
  //  if(wavelength<1200 && wavelength>1020){//causes images to show up in their correct wavelength range
  //  image (Gamma2, 1000, y_120,180,180);
  //}
}


