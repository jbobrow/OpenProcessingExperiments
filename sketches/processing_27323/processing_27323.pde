
// From Luis Nicolás Coronado 
// http://www.openprocessing.org/portal/?userID=1567
// http://www.openprocessing.org/visuals/?visualID=6269

import processing.opengl.*;

Tracer myTracer;
PFont infoFont;
float currentHeight=0;
float currentWidth=0;
int xCenter;
int yCenter;

boolean rose=false;
boolean pinwheel=false;
boolean floatRose=false;
boolean lissajous=true;
boolean lissajousFloat=false;

boolean turnOffMouse1=false;
boolean turnOffMouse2=false;
boolean turnOffMouse3=false;


  float a;
  float b; 

void setup(){
  size(720,480,P2D);
  xCenter=width/2;
  yCenter=height/2;
  currentHeight=height/2;
  noSmooth();
  background(10);
  infoFont=loadFont("SansSerif-10.vlw");
  textFont(infoFont);
  textMode(SCREEN);
  myTracer=new Tracer(get(),color(16,64,32),false);
}

void draw(){
  //background(0);
  myTracer.clear();
  myTracer.loadTracer();
  float A;
  float B=A=150;

  if(lissajousFloat){
    a=mouseX/5.0;
    b=mouseY/5.0;
  }
  else{
    a=mouseX/5;
    b=mouseY/5;
  }
  
  if(turnOffMouse1){
    a=1;
    b=1;
    
    if (mousePressed == true) {
    turnOffMouse1 = false;

    }
  }
  
  
    if(turnOffMouse2){
    a=1;
    b=3;
    
    if (mousePressed == true) {
    turnOffMouse2 = false;

    }
  }
  
  
      if(turnOffMouse3){
    a=1;
    b=5;
    
    if (mousePressed == true) {
    turnOffMouse3 = false;

    }
  }
  
  
  
  float d=radians(frameCount);
  float n;
  if(!floatRose){
    n=(float)ceil(mouseX/20.0);
  }
  else{
    n=mouseX/20.0;
  }
  float d2;
  int turns;
  if(pinwheel){
    turns=10;
    if(!floatRose){
      d2=(float)ceil(((mouseY)/10.0)+1);
    }
    else{
      d2=((mouseY)/10.0)+1;
    }
  }
  else{
    turns=1;
    d2=1;
  }
  float k=n/d2;
  if(lissajous){
    for(float i=0;i<TWO_PI;i+=0.001){

      //Lissajous curve POWER MUTHANFUKAN!
      //http://en.wikipedia.org/wiki/Lissajous_curve
      myTracer.polarTrace(xCenter+A*sin(a*i+d),yCenter+B*sin(b*i));
    }
  }
  if(rose){
    for(float i=0;i<TWO_PI*turns;i+=0.01){
      float r=A*cos((k)*i);
      //coordenadas polares
      myTracer.trace(xCenter+r*cos(i+d),yCenter+r*sin(i+d));  
    }
  }
  myTracer.drawTracer(0,0);

  fill(255);
  text(nf(frameRate,2,2)+"fps",10,20);
  text("Lissajous, A="+A+", B="+B+", a="+a+", b="+b+", d="+d,10,height-20);
}

void keyPressed(){
  if(key=='R'||key=='r'){
    rose=!rose;
  }
  if(key=='l'){
    lissajous=!lissajous;
  }
  if(key=='L'){
    lissajousFloat=!lissajousFloat;
  }
  if(key=='P'||key=='p'){
    pinwheel=!pinwheel;
  }
  if(key=='F'||key=='f'){
    floatRose=!floatRose;
  }
  
    if(key=='1'||key=='!'){
    turnOffMouse1 = true;
  }
  
  
    if(key=='2'||key=='@'){
    turnOffMouse2 = true;
  }
  
    if(key=='3'||key=='#'){
    turnOffMouse3 = true;
  }
  
  
}

class Tracer{
  PImage tracingImage;
  color currentColor;
  int outputTotalPixels;
  boolean subsampling;
  float prevX;
  float prevY;

  boolean tracing;

  /////////Constructor
  Tracer(PImage pTracingImage, color pCurrentColor, boolean pSubsampling){
    subsampling=pSubsampling;
    tracingImage=pTracingImage;
    currentColor=pCurrentColor;
    outputTotalPixels=tracingImage.width*tracingImage.height;
    //prevX=tracingImage.width/2;
    //prevY=tracingImage.height/2;
    tracing=false;
    if(subsampling){
      currentColor=luminanceSampler(currentColor,0.5);
    }
  }
  ////////Inicializador de transformaciones
  void loadTracer(){
    tracingImage.loadPixels();
  }
  void drawTracer(int pPosX, int pPosY){
    tracingImage.updatePixels();
    image(tracingImage,pPosX,pPosY);
  }
  /////////Cambiar el punto de trazo
  void initPoint(float pX,float pY){
    prevX=pX;
    prevY=pY; 
    tracing=true;
  }

  /////////Dibujar el buffer
  void drawTracer(int pPosX, int pPosY, int pWidth, int pHeight){
    tracingImage.updatePixels();
    image(tracingImage,pPosX,pPosY,pWidth,pHeight);
  }
  ///////limpiar el buffer
  void clear(){
    tracingImage=new PImage(tracingImage.width,tracingImage.height);
  }  
  //////retornar la imagen
  PImage getTrace(){
    tracingImage.updatePixels();
    return tracingImage;
  }
  ////////Trazar
 void trace(float pX,float pY){
    if(!tracing){
      initPoint(pX,pY);
    }

    updateLine(prevX,prevY,pX,pY);
    prevX=pX;
    prevY=pY;

  }
  void linearTrace(float pX,float pY){
    if(!tracing){
      initPoint(pX,pY);
    }else
    if(pX<prevX){
    initPoint(0,height);
    }

    updateLine(prevX,prevY,pX,pY);
    prevX=pX;
    prevY=pY;

  }
  void polarTrace(float pX,float pY){
    if(!tracing){
      initPoint(pX,pY);
    }else
    if(abs(pX-prevX)>40||abs(pY-prevY)>40){
      initPoint(pX,pY);
    }

    updateLine(prevX,prevY,pX,pY);
    prevX=pX;
    prevY=pY;

  }
  ////////Dibujar Linea
  void updateLine(float pX1,float pY1,float pX2,float pY2){

    float increment;
    float difX=(pX2-pX1);
    float difY=(pY2-pY1);
    float b=difY/difX;
    color tempColor=currentColor;
    currentColor=luminanceSampler(currentColor,0.25);
    if(subsampling){
      increment=0.5;
    }
    else{
      increment=1;
    }
    if(difX>=0){
      for(float i=0;i<difX;i+=increment){
        updatePoint(i+pX1,pY1+(b*i));
      } 
    }
    else{
      for(float i=0;i>difX;i-=increment){
        updatePoint(i+pX1,pY1+(b*i));
      }
    }
    b=difX/difY;
    if(difY>=0){
      for(float i=0;i<difY;i+=increment){
        updatePoint(pX1+(b*i),i+pY1);
      } 
    }
    else{
      for(float i=0;i>difY;i-=increment){
        updatePoint(pX1+(b*i),i+pY1);
      }
    }
    currentColor=tempColor;
  }
  ///////////////Dibujar Punto
  void updatePoint(float pPointX,float pPointY){
    if(floor(pPointX)>0&&floor(pPointY)>0&&ceil(pPointX)<=tracingImage.width-1&&ceil(pPointY)<=tracingImage.height-1){
      if(subsampling){

        color tempColor=currentColor;

        float decX=(ceil(pPointX)-pPointX);
        float decY=(ceil(pPointY)-pPointY);

        float divider=(decX+decY);
        currentColor=luminanceSampler(tempColor,divider); 
        pointDraw(floor(pPointX),floor(pPointY));        

        decX=(pPointX-floor(pPointX));

        divider=(decX+decY);
        currentColor=luminanceSampler(tempColor,divider); 
        pointDraw(ceil(pPointX),floor(pPointY));

        decY=(pPointY-floor(pPointY));

        divider=(decX+decY);
        currentColor=luminanceSampler(tempColor,divider); 
        pointDraw(ceil(pPointX),ceil(pPointY));

        decX=(ceil(pPointX)-pPointX);

        divider=(decX+decY);
        currentColor=luminanceSampler(tempColor,divider);         
        pointDraw(floor(pPointX),ceil(pPointY));

        currentColor=tempColor;
      }
      else{
        pointDraw(floor(pPointX),floor(pPointY));
      }
    }
  }
  //////////Selector de puntos
  private void pointDraw(int pX, int pY){
    int pixelIndex=(int)((pX)+((pY)*tracingImage.width));
    tracingImage.pixels[pixelIndex]=pixelAdd(currentColor,tracingImage.pixels[pixelIndex]);
  }
  ////////Operación aditiva
  private color pixelAdd(color pColor1, color pColor2){
    if(pColor2!=0x000000||pColor1!=0x000000){
      int r=constrain((pColor1 >>16 & 0xFF)+(pColor2 >> 16 & 0xFF),0,0xFF);
      int g=constrain((pColor1 >>8 & 0xFF)+(pColor2 >> 8 & 0xFF),0,0xFF);
      int b=constrain((pColor1 & 0xFF)+(pColor2 & 0xFF),0,0xFF);
      r=r<<16;
      g=g<<8;
      color outColor=r|g|b;
      return outColor;
    }
    else if(pColor2!=0x000000){
      return pColor1;
    }
    else{
      return pColor2;
    }
  }
  ////////Operacion divisora
  private color luminanceSampler(color pColor,float pDivider){
    pDivider=abs(pDivider);
    if(pDivider<1){
      int r=int(float( pColor >>16 &0xFF )*pDivider);
      int g=int(float( pColor >>8  &0xFF)*pDivider);
      int b=int(float( pColor & 0xFF )*pDivider);
      r=r<<16;
      g=g<<8;
      color outColor=r|g|b;
      return outColor;
    }
    else{
      return pColor;
    }
  }
}





