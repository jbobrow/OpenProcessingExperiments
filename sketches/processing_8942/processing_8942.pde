
PImage squiggle(PImage inImg,boolean traceContour){
  inImg.loadPixels();
  // outImg = inImg;
  //img.copy(srcImg, sx, sy, swidth,  sheight, dx, dy, dwidth, dheight);
//  PImage output = createImage(inImg.width,inImg.height,RGB);
//  PImage blackImg = createImage(inImg.width,inImg.height,RGB);
  output.copy(inImg,0,0,inImg.width,inImg.height,0,0,inImg.width,inImg.height);
  output.loadPixels();
   //  squig = createImage(inImg.width,inImg.height,RGB);
     squig.copy(inImg,0,0,inImg.width,inImg.height,0,0,inImg.width,inImg.height);
   squig.loadPixels();
  // PImage blackImg = output;
  blackImg.copy(inImg,0,0,inImg.width,inImg.height,0,0,inImg.width,inImg.height);
  blackImg.loadPixels();
  color last = color(255,255,255);
  color lastUp = last; 
  color lastDn = last;
  color up = last; 
  color dn = last;
  color lastGood = color(255,255,255);
  int x=0;
  int y=0;
  float warpX = 0;float warpY=0;
  float[] Xwarps = new float[30];  float[] Ywarps = new float[30];
  int warpFade = 0;
  for(y=0;y<30;y++){
   Xwarps[y]=random(2.)-1.;
   Ywarps[y]=0;
  }
  int warpCount=0;
  for(y=1;y<blackImg.height-1;y++){
    for(x=1;x<blackImg.width-1;x++){
      up =inImg.pixels[(y-1)*blackImg.width+x];
      dn =inImg.pixels[(y+1)*blackImg.width+x];
      color val = inImg.pixels[y*blackImg.width+x]; 
      if(brightness(val)>33){
        blackImg.pixels[y*blackImg.width+x] = color(255,255,255);
      }else{        blackImg.pixels[y*blackImg.width+x] = color(0,0,0);
                  output.pixels[y*blackImg.width+x]=lastGood;
            //   if(brightness(last)>3){
          output.pixels[y*blackImg.width+x]=lastGood;
    /*    }
        else if(brightness(up)>3){
          output.pixels[y*blackImg.width+x]=up;
        }
        else if(brightness(dn)>3){
          output.pixels[y*blackImg.width+x]=dn;
        }
        else if(brightness(lastUp)>3){
          output.pixels[y*blackImg.width+x]=lastUp;
        }
        else if(brightness(lastDn)>3){
          output.pixels[y*blackImg.width+x]=lastDn;
        }        else{
         output.pixels[y*blackImg.width+x]=color(255,255,255);
        }*/
        
      }
      if(val != last && last==color(255,255,255)){
        blackImg.pixels[y*blackImg.width+x] = color(0,0,0);
                  output.pixels[y*blackImg.width+x]=lastGood;
                  /*
        if(brightness(last)>50){
          output.pixels[y*blackImg.width+x]=last;
        }
        else if(brightness(up)>50){
          output.pixels[y*blackImg.width+x]=up;
        }
        else if(brightness(dn)>50){
          output.pixels[y*blackImg.width+x]=dn;
        }
        else if(brightness(lastUp)>50){
          output.pixels[y*blackImg.width+x]=lastUp;
        }
        else if(brightness(lastDn)>50){
          output.pixels[y*blackImg.width+x]=lastDn;
        }        else{
         output.pixels[y*blackImg.width+x]=color(255,255,255);
        }
        */
      }
      if(traceContour &&(val != up|| val!=lastUp || val !=dn || val != lastDn)){
    //    if(abs(brightness(val)-brightness(last))>36||abs(brightness(val)-brightness(up))>36||brightness(val)<100||last==color(255,255,255)||val==color(0,0,0)){
        blackImg.pixels[y*blackImg.width+x] = color(0,0,0);
   //     }
        output.pixels[y*blackImg.width+x]=lastGood;
        /*
              if(brightness(last)>50){
          output.pixels[y*blackImg.width+x]=last;
        }
        else if(brightness(up)>50){
          output.pixels[y*blackImg.width+x]=up;
        }
        else if(brightness(dn)>50){
          output.pixels[y*blackImg.width+x]=dn;
        }
        else if(brightness(lastUp)>50){
          output.pixels[y*blackImg.width+x]=lastUp;
        }
        else if(brightness(lastDn)>50){
          output.pixels[y*blackImg.width+x]=lastDn;
        }
        else{
         output.pixels[y*blackImg.width+x]=color(255,255,255);
        }
        */
      }else{
       if(inImg.pixels[(y)*blackImg.width+x+1]==color(255,255,255) && last != color(255,255,255)){
                blackImg.pixels[y*blackImg.width+x] = color(0,0,0);
                                blackImg.pixels[(y-1)*blackImg.width+x] = color(0,0,0);
       } 
              if((up==color(255,255,255) || dn==color(255,255,255)) && last != color(255,255,255)){
                blackImg.pixels[y*blackImg.width+x] = color(0,0,0);
                                blackImg.pixels[(y-1)*blackImg.width+x] = color(0,0,0);
       } 
        
      }
      if(brightness(val)<155){
       output.pixels[y*blackImg.width+x] = lastGood; 
              output.pixels[y*blackImg.width+x+1] = lastGood; 
                     output.pixels[(y-1)*blackImg.width+x] = lastGood; 
                            output.pixels[(y-1)*blackImg.width+x+1] = lastGood; 
                            
                     output.pixels[(y+1)*blackImg.width+x] = lastGood; 
                            output.pixels[(y+1)*blackImg.width+x+1] = lastGood; 
                                                 output.pixels[(y-1)*blackImg.width+x-1] = lastGood; 
                            output.pixels[(y+1)*blackImg.width+x-1] = lastGood; 
      }
 //     if(brightness(val)>0 ){
    //    if(red(val)>70||green(val)>70||blue(val)>70){
          if(inImg.pixels[(y)*blackImg.width+x+1] !=color(0,0,0)){
               if(inImg.pixels[(y)*blackImg.width+x-1] !=color(0,0,0)){
          if(inImg.pixels[(y)*blackImg.width+x+2] !=color(0,0,0)){
               if(inImg.pixels[(y)*blackImg.width+x-2] !=color(0,0,0)){
          if(inImg.pixels[(y-1)*blackImg.width+x+1] !=color(0,0,0)){
               if(inImg.pixels[(y-1)*blackImg.width+x-1] !=color(0,0,0)){
      if(blackImg.pixels[y*blackImg.width+x] == color(255,255,255)){
      lastGood=val;
      }
          }}}
          }          }
     //     }
      //  }
      }

      last = val;
      lastUp =inImg.pixels[(y-1)*blackImg.width+x];
      lastDn =inImg.pixels[(y+1)*blackImg.width+x];
    }
  } 
  output.updatePixels();
    for(y=1;y<blackImg.height-1;y++){
    for(x=1;x<blackImg.width-1;x++){
     color val5 =  output.pixels[y*blackImg.width+x];
     if(red(val5)==green(val5)&&green(val5)==blue(val5) &&blue(val5)<110){
      output.pixels[y*blackImg.width+x]=color(255,255,255);
     }
    }
      output.updatePixels();
    }
  //Squiggle Colors
    for(y=2;y<blackImg.height-2;y++){
      warpY = (10*warpY+(random(30.)-15.0))/11.;

    //  warpX=0.;
            warpX = (190*warpX+(random(80.)-40.0))/191.;
    for(x=2;x<blackImg.width-4;x++){
color val3 =             output.pixels[constrain(int(y+warpY)*blackImg.width+constrain(int(x+warpX),3,blackImg.width-3),0,blackImg.width*blackImg.height-1)];
            squig.pixels[y*blackImg.width+x]=
val3;
             squig.pixels[y*blackImg.width+x-1]=
val3;
//                      squig.pixels[y*blackImg.width+x-2]=
//val3;
            squig.pixels[(y-1)*blackImg.width+x]=
val3;

            squig.pixels[(y-1)*blackImg.width+x-1]=
val3;
//             squig.pixels[(y-1)*blackImg.width+x-2]=
//val3;
              squig.pixels[(y+1)*blackImg.width+x-1]=
val3;
//                         squig.pixels[(y+1)*blackImg.width+x-2]=
//val3;
            
  }
    }
 //   blackImg.filter(BLUR,1);
   // blackImg.filter(THRESHOLD,0.75);
  //squiggle black
     for(y=2;y<blackImg.height-2;y++){
warpFade=0;
      warpCount=0;
            for(int i=0;i<29;i++){
             Ywarps[i] = (170*Ywarps[i]+(random(10.)-5.0))/171.; 
               Xwarps[i] = (190*Xwarps[i]+(random(10.)-5.0))/191.; 
      }
      warpX =Xwarps[warpCount];
      warpY =Ywarps[warpCount];

    //  warpY /=10.;warpX /=10.;

    for(x=2;x<blackImg.width-4;x++){      
      if(warpFade>0){
       warpX = ((Xwarps[warpCount+1]*(20-warpFade) + Xwarps[warpCount]*(warpFade)))/20;
              warpY = ((Ywarps[warpCount+1]*(20-warpFade) + Ywarps[warpCount]*(warpFade))/20);
    //  warpX/=10;      warpY/=10;
     warpFade--;
    if(warpFade==0){
      if(warpCount<27){
      warpCount++;
      }
     warpX=Xwarps[warpCount];
          warpY=Ywarps[warpCount];
                         //   warpX = (1900*warpX+(random(20.)-10.0))/1901.;
         // println(warpCount);
    } 
      } else{
             warpX=Xwarps[warpCount];
          warpY=Ywarps[warpCount];
        
      }


      warpY = (100*warpY+(random(44.)-22.0))/101.;
                  warpX = (100*warpX+(random(20.)-10.)-warpY/2)/101.;
         //   warpY = (200*warpY+(random(60.)-30.0))/201.;
           //       warpX = (2900*warpX+(random(60.)-30.0))/2901.;
color val2 =             blackImg.pixels[constrain(int(y+warpY)*blackImg.width+constrain(int(x+warpX-warpY),3,blackImg.width-3),0,blackImg.width*blackImg.height-1)];
 if(brightness(val2)<20){
            squig.pixels[y*blackImg.width+x]=
val2;
             squig.pixels[y*blackImg.width+x-1]=
val2;

//                      squig.pixels[y*blackImg.width+x-2]=
//val2;
            squig.pixels[(y-1)*blackImg.width+x]=
val2;
 
            squig.pixels[(y-1)*blackImg.width+x-1]=
val2;
 /*            squig.pixels[(y-1)*blackImg.width+x-2]=
val2;
          squig.pixels[(y+1)*blackImg.width+x-1]=
val2;
                         squig.pixels[(y+1)*blackImg.width+x-2]=
val2;
*/


    }else{
      if(inImg.pixels[y*squig.width+x]==color(255,255,255)){
       //  println(warpFade);
        if(warpFade==0){
      Xwarps[warpCount]=warpX;
            Ywarps[warpCount]=warpY;
    //        if(warpCount<28){
        //    warpCount++;
        //    }
warpFade=20;}

    }
     }}
     }
  output.updatePixels();
    squig.updatePixels();
   // squig.filter(BLUR,3);
   // squig.filter(POSTERIZE,6);
  return squig;
}


