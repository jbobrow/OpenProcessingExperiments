
/*
Coded by Kof @ 
Wed May 14 06:37:09 CEST 2014



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

int BUFFER_SIZE = 1024;

Minim minim;
MultiChannelBuffer buffer;

AudioOutput output;
Sampler sampler;



int num = 20;

float rots[];
float speeds[];
float L[];

int MEM_SIZE = BUFFER_SIZE;

ArrayList mem;
ArrayList graph1, graph2;


float freq = 512;

void setup(){

  size(720,512);

  noSmooth();

  rots = new float[num];
  L = new float[num];
  speeds = new float[num];

  mem = new ArrayList();
  graph1 = new ArrayList();
  graph2 = new ArrayList();

  for(int i = 0 ; i < num;i++){
    speeds[i] = (random(-PI,PI))/100.0;
    L[i] = random(10,20);
    rots[i] = 0;
  }


  minim = new Minim(this);
  output = minim.getLineOut();

  buffer = new MultiChannelBuffer(1,BUFFER_SIZE);
  buffer.setBufferSize(BUFFER_SIZE*2);
  for(int i = 0 ; i < BUFFER_SIZE*2;i++){
    buffer.setSample(0,i,sin(i/2.0));
  }

  sampler = new Sampler(buffer,44100,2);
  sampler.patch( output );
  sampler.looping = true;
  sampler.trigger(); 
}


void draw(){
  
  // beast control
  for(int i = 0 ; i < num;i++){
    L[i] += (((noise(i/100.0+frameCount/1000.0)-0.5) * 150.0 )-L[i])/100.0;
    
  }

  background(0);

        //
                freq += ((mouseX + 10)-freq) / 10.0;
        //

  stroke(255);

  for(int i = 0 ; i < num;i++){
    rots[i] += speeds[i];
  }

  pushMatrix();

  
    strokeWeight(2);
    stroke(#ffcc00);

  translate(width/2,height/2);

  for(int i = 0 ; i < num;i++){

    rotate(rots[i]);
    
    line(L[i],0,0,0);
    translate(L[i],0);

    if(i==num-1){
      mem.add(new PVector(screenX(0,0),screenY(0,0)));
      graph1.add(new PVector(frameCount%width,screenY(0,0)));
      graph2.add(new PVector(frameCount%width,screenX(0,0)/(width/(height+0.0))));
    }
  }

  if(mem.size()>MEM_SIZE){
    mem.remove(0);
    graph1.remove(0);
    graph2.remove(0);
  }
  
  strokeWeight(1);

  noFill();

  popMatrix();



  for(int i = 1 ; i < mem.size();i++){
    stroke(#ffcc00,map(i,0,mem.size(),0,120));
    PVector tmp = (PVector)mem.get(i);
    PVector tmpp = (PVector)mem.get(i-1);

    line(tmp.x,tmp.y,tmpp.x,tmpp.y);
  }
/*

  for(int i = 1 ; i < mem.size();i++){
    stroke(#ffcc00,map(i,0,mem.size(),0,90));
    PVector tmp = (PVector)graph1.get(i);
    PVector tmpp = (PVector)graph1.get(i-1);

    float d = dist(tmp.x,tmp.y,tmpp.x,tmpp.y);

    if(d<50) 
      line(tmp.x,tmp.y,tmpp.x,tmpp.y);
  }
  for(int i = 1 ; i < mem.size();i++){
    stroke(#ff0000,map(i,0,mem.size(),0,90));
    PVector tmp = (PVector)graph2.get(i);
    PVector tmpp = (PVector)graph2.get(i-1);

    float d = dist(tmp.x,tmp.y,tmpp.x,tmpp.y);

    if(d<50) 
      line(tmp.x,tmp.y,tmpp.x,tmpp.y);
  }
*/

  stroke(255,120);

  // buffer write
  for(int i = 1 ; i < BUFFER_SIZE * 2;i++){
    PVector pg1 = (PVector)graph1.get( round(((sin( (i-1)/freq )+1.0)/2.0)*(mem.size()-1.0)) );
    PVector pg2 = (PVector)graph2.get( round(((sin( (i-1)/freq )+1.0)/2.0)*(mem.size()-1.0)) ) ;

    PVector g1 = (PVector)graph1.get( round(((sin( (i)/freq )+1.0)/2.0)*(mem.size()-1.0)) );
    PVector g2 = (PVector)graph2.get( round(((sin( (i)/freq )+1.0)/2.0)*(mem.size()-1.0)) ) ;
    
    float fade = frameCount<120?map(frameCount,0,120,0,1):1.0;
    
    float y1 =   map(g1.y,0,height,-1,1) * fade;
    float y2 =   map(g2.y,0,height,-1,1) * fade;


    float py1 =  map(pg1.y,0,height,-1,1) * fade;
    float py2 =  map(pg2.y,0,height,-1,1) * fade;


    buffer.setSample(0,i,y1);
    buffer.setSample(1,i,y2);
    
    stroke(255);
    
    line(
        map(i-1,0,BUFFER_SIZE*2,0,width),
        map(py1,-1,1,height,0),
        map(i,0,BUFFER_SIZE*2,0,width),
        map(y1,-1,1,height,0)
        );
        
        
    line(
        map(i-1,0,BUFFER_SIZE*2,0,width),
        map(py2,-1,1,height,0),
        map(i,0,BUFFER_SIZE*2,0,width),
        map(y2,-1,1,height,0)
        );
        
  }

}

