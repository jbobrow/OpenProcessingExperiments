
/**

   Coded by Kof @ 
   Thu Apr 25 03:31:50 CEST 2013



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


//////////////////////////////////

float TRAS = 2.0;
int NUM = 280;
ArrayList pnts;

void setup(){
  size(400,800,P3D);

  pnts = new ArrayList();

  for(int i = 0 ; i < NUM;i++){
    pnts.add(new Ring(i));
  }

 // smooth();
}

//////////////////////////////////


void draw(){

  background(5);

  pushMatrix();

  translate(
      (noise(frameCount,0,0)-.5)*TRAS,
      (noise(0,frameCount,0)-.5)*TRAS,
      (noise(0,0,frameCount)-.5)*TRAS
      );

  pushMatrix();

  translate(width/2,height/2-20,0);
  rotateX(HALF_PI);



  for(int i = 0 ; i < pnts.size();i++){
    Ring r = (Ring)pnts.get(i);
    r.draw();
  }

  popMatrix();

  popMatrix();


}

//////////////////////////////////

class Ring{
  float pointNum = 10.0;
  PVector center;
  float R = 100.0;
  int id;

  Ring(int _id){
    id = _id;
    center = new PVector(0,0,id*2-NUM);


  }

  void draw(){
    R = noise(frameCount/(200.32),id/100.33)*200.0;
    pointNum = (frameCount/10.0+abs(sin((id+frameCount) / 
            (abs(cos(id+frameCount)/11.11)+1.0)))*1.0)%75.0+
      (((id^frameCount)%50)/50.0);

    float frac = TWO_PI/pointNum;

    if(pointNum<0.1)
      pointNum=0.1;

    pushMatrix();
    translate(center.x,center.y,center.z);
    rotateZ(radians((frameCount)/(10.0+id*2.0)));
    rotateX(sin((frameCount)/(33.34+id/100.0)));
    for(float f = 0 ; f < TWO_PI;f += frac){
      float x = cos(f)*R;
      float y = sin(f)*R;
      stroke(lerpColor(#ffcc11,#11ccff,abs(sin(f)+1.0)/2.0),55);
      strokeWeight(abs((constrain(tan(f+HALF_PI),0,5))+1.0));
      line(x,y,2,x,y,-2);
    }
    popMatrix();
  }
}

