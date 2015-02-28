
/*
Coded by Kof @ 
Fri Jul  5 18:53:35 CEST 2013



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
*/


float [] steps = {10.5};
float [] widths = {5};

void setup(){
  size(500,500);
  strokeWeight(4);
 smooth();

  noiseSeed(19);
}

void draw(){
  background(255);
  noFill();
  strokeWeight(widths[frameCount%widths.length]);
  stroke(0);
  
  translate(width/2,height/2);
  scale(noise(frameCount/1000.0)*1.5+0.4);
  rotate(QUARTER_PI+frameCount/5.0);
  translate(-width/2,-height/2);

  pushMatrix();
  translate((noise(frameCount/3.0,0)-0.5)*10.0,(noise(0,frameCount/3.0)-0.5)*10.0);

  for(float i = -width ; i < width*2 ; i+= steps[(frameCount+width)%steps.length] ){
    bezier(
        sin(frameCount/100.0)*width/2.0+i,0,
        width/4+i+sin((frameCount-i)/202.4)*width/10.0,cos((frameCount-i)/302.4)*height/10.0+height/2.0,
        width/4*3.0+i+cos((frameCount+i)/103.1)*width/10.0,sin((frameCount+i)/303.1)*height/10.0+height/2.0,
        cos(frameCount/300.0)*(-1*width/2.0)+width/2.0+i,height
        );
  }

  for(float i = -height ; i < height*2 ; i+= steps[(frameCount+height)%steps.length]){
    bezier(
        0,sin(frameCount/103.31)*height/2.0+i,
        cos((frameCount-i)/313.5)*width/4.0+width/2.0,height/10.0+i+sin((frameCount-i)/218.5)*height/10.0,
        sin((frameCount+i)/315.2)*width/4.0+width/2.0,height/10.0*3.0+i+cos((frameCount+i)/114.2)*height/10.0,
        width,cos(frameCount/301.7)*(-1*height/2.0)+height/2.0+i
        );
  }
  popMatrix();
  stroke(255);
  strokeWeight(300);
  ellipse(width/2+sin(frameCount/10.0)*10,height/2+sin(frameCount/13.0)*10,width+100,height+100);
}

