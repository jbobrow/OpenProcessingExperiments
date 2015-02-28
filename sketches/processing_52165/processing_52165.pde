
  //setup BEFORE setup
  PImage bus1;
  PImage bus2;
  PImage london;
  int x1=-10;
  int y1=-10;
  int x2=360;
  int y2=80;
  int x3=1;
  int gone=0;
  int wait1=80;
  int wait2=130;

  public void setup() {
  //Bus-top screen size
  size(512, 160); 
  //Bus-top screen refresh rate
  frameRate(8);
  //Basic setup
  bus1=loadImage("bus1.PNG");
  bus2=loadImage("bus2.png");
  london=loadImage("LONDON.png");
  bus1.resize(163,89);
  bus2.resize(163,89);
  london.resize(252,34);
}
 
void draw() {
  //Set color for bus-top's red and black screen
  background(0); 
  stroke(255,0,0); 
  fill(255,0,0);   
   
  //CODE
  image(bus1,x1,y1);
  image(bus2,x2,y2);
  if(x1<350){
    x1+=10;
    x2-=10; 
  }else{
    if(y1!=30){
      y1+=10;
      y2-=10;
    }else{
      image(london,0,0);
      fill(0,0);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      bezier(x1+80,y1+45,random(512),random(160),random(512),random(160),x2+80,y2+45);
      //red resetter
      if((frameCount>=wait1)&&(frameCount<=wait2)){
        fill(255,0,0);
        if((x3<512)&&(gone==0)){
          x3+=20;
        }else{
          if(x3>width){
            gone=1;
            x1=-10;
            y1=-10;
            x2=360;
            y2=80;
            gone=0;
            x3=0;
            wait1+=80;
            wait2+=130;
          }
        }
        rect(0,0,x3,height);
      }
      fill(0);
    }
  }
}

