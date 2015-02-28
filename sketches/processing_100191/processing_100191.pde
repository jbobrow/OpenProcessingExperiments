
/*
Color study
Coded by Kof @ 
Tue May 28 09:02:03 CEST 2013



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

float r,g,b;
ArrayList R,G,B;
PGraphics mask[];

void setup(){
  size(640,480);

  R = new ArrayList();
  G = new ArrayList();
  B = new ArrayList();

  smooth();
  rectMode(CENTER);

  mask = new PGraphics[1];

  mask[0] = createGraphics(width,height,JAVA2D);
  mask[0].beginDraw();
  mask[0].stroke(0,100);
  mask[0].noFill();
  mask[0].strokeWeight(40);
  mask[0].rect(0,0,width,height);
  mask[0].filter(BLUR,40);
  mask[0].endDraw();


}

void draw(){

  float speed = map(sin(frameCount/(PI*10.0)),-1,1,400000,900000);

  r = ((sin(frameCount*650.0/speed)) + 1.0) * 127;
  g = ((sin(frameCount*510.0/speed)) + 1.0) * 127;
  b = ((sin(frameCount*475.0/speed)) + 1.0) * 127;

  background(r,g,b);

  noStroke();
  fill(255-r,255-g,255-b);
  rect(width/2,height/2,width,127);


  R.add(r);
  G.add(g);
  B.add(b);

  if(R.size()>width){
    R.remove(0);
    G.remove(0);
    B.remove(0);
  }

  pushMatrix();
  float sc = 2.0;
  translate(0,height/2-64);

  for(int i = 1 ; i < R.size();i++){
    float rr1 = (Float)R.get(i-1)/sc;
    float gg1 = (Float)G.get(i-1)/sc;
    float bb1 = (Float)B.get(i-1)/sc;

    float rr2 = (Float)R.get(i)/sc;
    float gg2 = (Float)G.get(i)/sc;
    float bb2 = (Float)B.get(i)/sc;

    stroke(255,0,0,90);
    line(i,rr1,i,rr2);

    stroke(0,255,0,90);
    line(i,gg1,i,gg2);

    stroke(0,0,255,90);
    line(i,bb1,i,bb2);

  }
  popMatrix();


  image(mask[0],0,0);



}



