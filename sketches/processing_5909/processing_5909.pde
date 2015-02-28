
class WaveformMonitor{
  PImage inputImage;
  int sizeX;
  int sizeY;
  int outputTotalPixels;
  int inputTotalPixels;
  PImage outputImage;

  WaveformMonitor(PImage pInputImage){
    inputImage=pInputImage;
    sizeX=pInputImage.width;
    sizeY=255;
    outputImage= createImage(sizeX,sizeY+1,RGB);

  }

  void update(){
    outputImage.loadPixels();
    inputImage.loadPixels();

    for(int i=0;i<outputImage.pixels.length;i++){
      outputImage.pixels[i]=0;
    }

    for(int i=0;i<inputImage.pixels.length;i++){
      //int luminance=(int)brightness(inputImage.pixels[i]);
      //el brightness de P5
      int luminance=(int)luminance(inputImage.pixels[i]);
      //Mi luminancia (promediando :P, como debe ser)
     
      //outputImage.pixels[constrain(i%inputImage.width+(256-luminance)*inputImage.width,0,outputImage.pixels.length-1)]=luminanceDivider(inputImage.pixels[i],1);
      //waveform Con Color del pedazo (horrible por la luminancia)
      
      outputImage.pixels[constrain(i%inputImage.width+(256-luminance)*inputImage.width,0,outputImage.pixels.length-1)]=
      luminanceSum(outputImage.pixels[constrain((i%inputImage.width)+((256-luminance)*inputImage.width),0,outputImage.pixels.length-1)],luminanceDivider(inputImage.pixels[i],6));
      //Waveform Coloreado      
      
      //outputImage.pixels[constrain(i%inputImage.width+(486-int(luminance*0.7))*inputImage.width,0,outputImage.pixels.length-1)]=
      //luminanceSum(outputImage.pixels[constrain((i%inputImage.width)+((486-int(luminance*0.7))*inputImage.width),0,outputImage.pixels.length-1)],luminanceDivider(inputImage.pixels[i],2));
      //coloreado full size
      
      //outputImage.pixels[constrain(i%inputImage.width+(256-luminance)*inputImage.width,0,outputImage.pixels.length-1)]+=0x050505;
      //Waveform Normalito
    }
    inputImage.updatePixels();
    outputImage.updatePixels();
  }

  PImage display(){
    return outputImage;
  }

  color luminanceSum(color pColor1, color pColor2){
    int r=constrain((pColor1 >>16 & 0xFF)+(pColor2 >> 16 & 0xFF),0,0xFF);
    int g=constrain((pColor1 >>8 & 0xFF)+(pColor2 >> 8 & 0xFF),0,0xFF);
    int b=constrain((pColor1 & 0xFF)+(pColor2 & 0xFF),0,0xFF);
    r=r<<16;
    g=g<<8;
    color outColor=r|g|b;
    return outColor;
  }
  
    color luminanceSub(color pColor1, color pColor2){
    int r=constrain((pColor1 >>16 & 0xFF)-(pColor2 >> 16 & 0xFF),0,0xFF);
    int g=constrain((pColor1 >>8 & 0xFF)-(pColor2 >> 8 & 0xFF),0,0xFF);
    int b=constrain((pColor1 & 0xFF)-(pColor2 & 0xFF),0,0xFF);
    r=r<<16;
    g=g<<8;
    color outColor=r|g|b;
    return outColor;
  }

  color luminanceDivider(color pColor,int pDivider){
    int r=( pColor >>16 &0xFF )/pDivider;
    int g=( pColor >>8  &0xFF)/pDivider;
    int b=( pColor & 0xFF )/pDivider;
    r=r<<16;
    g=g<<8;
    color outColor=r|g|b;
    return outColor;
  }
  
    color luminanceMultiplier(color pColor,int pDivider){
    int r=constrain(( pColor >>16 &0xFF )*pDivider,0,0xFF);
    int g=constrain( (pColor >>8  &0xFF)*pDivider,0,0xFF);
    int b=constrain(( pColor & 0xFF )*pDivider,0,0xFF);
    r=r<<16;
    g=g<<8;
    color outColor=r|g|b;
    return outColor;
  }
  
  color luminance(color pColor){
     int l=constrain(((pColor >>16 & 0xFF)+(pColor >> 8 & 0xFF)+(pColor & 0xFF))/3,0,0xFF);
//       int l=constrain(((pColor >>16 & 0xFF)+(pColor >> 8 & 0xFF)+(pColor & 0xFF)),0,0xFF*3);
   //full size
     return l;

   //  return l;
  }

}




