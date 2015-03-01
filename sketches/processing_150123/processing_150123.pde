
/**
Coded by Kof @ 
Sun Jun  1 17:28:58 CEST 2014



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

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
MultiChannelBuffer buffer;

AudioOutput output;
Sampler sampler;



String formula = "salksl";
float raw[];
int t = 0;

int BUFFER_SIZE = 1024;

void setup(){
  size(320,240);

  textFont(loadFont("SempliceRegular-8.vlw"));
  textLeading(9);

  noSmooth();

  minim = new Minim(this);
  output = minim.getLineOut();

  raw = new float[BUFFER_SIZE];

  buffer = new MultiChannelBuffer(1,BUFFER_SIZE);
  buffer.setBufferSize(BUFFER_SIZE);
  for(int i = 0 ; i < BUFFER_SIZE;i++){
    buffer.setSample(0,i,0.5);
  }

  sampler = new Sampler(buffer,8000,2);
  sampler.patch( output );
  sampler.looping = true;
  sampler.trigger(); 
}


void draw(){


  background(0);

  fill(255);


  text(formula,10,10,width-20,height-20);


  noFill();
  stroke(255);

  beginShape();
  for(int i = 0 ; i<raw.length;i++){
    float f = map(raw[i],-1.0,1.0,0,100);
    float x = map(i,0,BUFFER_SIZE,10,width-10);
    vertex(x,f+120);
  }
  endShape();

  parse();

}

void keyPressed(){

  if(key=='a'||key=='s'||key=='k'||key=='l'){
    formula = formula+key+"";
  }

  if(keyCode==BACKSPACE)
    if(formula.length()>1)
      formula = formula.substring(0,formula.length()-1);

  if(keyCode==DELETE)
    formula = formula.substring(0,1);



}

void parse(){
  float s = 0.5;
  float step = 0.1;
  for(int t = 0 ; t < BUFFER_SIZE;t++){

    switch(formula.charAt(t%formula.length())){
      case 'a':
        step-=0.01;
        break;
      case 's':
        s+=step;
        break;
      case 'k':
        s-=step;
        break;
      case 'l':
        step+=0.01;
        break;
    }

    if(s>1.0)
      s=-1.0;
    if(s<-1.0)
      s=1.0;

    raw[t] += (s-raw[t])/10.0;
    buffer.setSample(0,t,raw[t]);
  }


}

